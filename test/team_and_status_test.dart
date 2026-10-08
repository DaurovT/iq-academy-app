// Команда медпреда, кодовое слово и статус «Доп. проверка»:
// разбор ответов сервера (docs/medrep-team-api.md) и правила показа.
import 'package:flutter_test/flutter_test.dart';
import 'package:platform_app/core/models/check.dart';
import 'package:platform_app/core/models/medrep.dart';
import 'package:platform_app/core/models/registration.dart';
import 'package:platform_app/features/doctor/rx_common.dart';
import 'package:platform_app/features/medrep/portfolio_screen.dart';
import 'package:platform_app/features/mini_apps/sapper_widgets.dart';
import 'package:platform_app/features/pharmacist/checks/check_ui.dart';

void main() {
  test('команда: разбор ответа и порядок — активные, затем по числу', () {
    final team = MedrepTeam.fromJson({
      'totals': {'all': 3, 'doctors': 1, 'pharmacists': 2, 'pending': 3},
      'doctors': [
        {
          'accountId': 2879, 'telegramId': 1906911721, 'role': 'doctor',
          'name': 'Нодира Юсупова', 'specialty': 'Терапевт',
          'workplace': 'Поликлиника №10', 'city': 'Ташкент',
          'phone': '+998901234567', 'recipes': 34, 'approved': 30,
          'lastAt': '2026-10-07T08:00:00+00:00', 'active': true,
          'joinedAt': '2026-10-01T10:00:00+00:00',
        },
      ],
      'pharmacists': [
        {
          'telegramId': 123456, 'accountId': null, 'role': 'pharmacist',
          'name': 'Зиёда Азизова', 'shop': 'MARXAMAT MED FARM №4',
          'city': 'Ташкент', 'checks': 89, 'quests': 2,
          'lastAt': '2026-10-06T12:00:00+00:00', 'active': true,
        },
        {'telegramId': null, 'accountId': 77, 'name': 'Новый', 'checks': 100},
      ],
    });
    expect(team.totals.pending, 3);
    expect(teamDoctorKey(team.doctors.single), 'a2879');

    final members = teamMembers(team);
    // Неактивный «Новый» со 100 чеками — после активных.
    expect(members.map((m) => m.name), ['Зиёда Азизова', 'Нодира Юсупова', 'Новый']);
    expect(members[1].isDoctor, isTrue);
    expect(members[1].subtitle, 'Терапевт · Поликлиника №10');
    expect(members[1].searchText, contains('поликлиника'));
  });

  test('кодовое слово и заявки: разбор ответов', () {
    final code = MedrepCode.fromJson({
      'code': 'PANIKA', 'username': 'pani_kalinina', 'company': 'Bionorica SE',
      'joinedByCode': 12, 'inviteLink': 'https://t.me/PharmQuestBot?start=ref_1',
    });
    expect(code.code, 'PANIKA');

    final ok = MedrepCodeCheck.fromJson({
      'ok': true,
      'medrep': {'name': 'Вольга Калинин', 'company': 'Bionorica SE'},
    });
    expect(ok.medrep?.name, 'Вольга Калинин');
    expect(MedrepCodeCheck.fromJson({'ok': false}).medrep, isNull);

    final app = PendingReferral.fromJson({
      'id': 2881, 'kind': 'app', 'name': 'Шахноза', 'phone': '+99890',
      'shop': 'SHIFO PLUS №3', 'source': 'code',
      'requestedAt': '2026-10-08T06:00:00+00:00',
    });
    expect((app.kind, app.source), ('app', 'code'));
    // Старый ответ без новых полей — заявка из бота.
    final bot = PendingReferral.fromJson(
        {'id': 1, 'name': 'А', 'phone': '', 'requestedAt': '2026-10-08'});
    expect(bot.kind, 'bot');
  });

  test('поле кодового слова в схеме регистрации', () {
    final f = RegField.fromJson({
      'name': 'medrepCode', 'type': 'text',
      'label': {'ru': 'Код медпреда'},
      'hint': {'ru': '6 символов'}, 'maxLength': 6, 'required': true,
    });
    expect((f.maxLength, f.required), (6, true));
    // Старая схема без подсказки и длины.
    final old = RegField.fromJson(
        {'name': 'clinic', 'type': 'text', 'label': 'Клиника', 'required': true});
    expect(old.maxLength, isNull);
  });

  test('статус «Доп. проверка» и неизвестный статус', () {
    Check check(String status) => Check.fromJson({
          'id': 1, 'status': status, 'createdAt': '2026-10-07T11:20:00',
          'photoCount': 1, 'drugs': [],
        });
    expect(check('review').status, CheckStatus.review);
    expect(checkStageOf(CheckStatus.review), CheckStage.extraReview);
    expect(CheckStatus.review.rxStage(), RxStage.extraReview);
    expect(CheckStage.extraReview.inReview, isTrue);
    // Прежние статусы показываются как раньше.
    expect(checkStageOf(CheckStatus.aiWrong), CheckStage.review);
    expect(CheckStatus.aiWrong.rxStage(), RxStage.rejected);
    // Новый статус, о котором приложение ещё не знает, не роняет список.
    expect(check('something_new').status, CheckStatus.pending);
  });

  test('приз-ваучер в «Сапёре» — без валюты', () {
    expect(sapperPrizeLabel('ваучер 13 000 сум'), 'ваучер 13 000');
    expect(sapperPrizeLabel('ваучер 13 000 IQC'), 'ваучер 13 000');
    expect(sapperPrizeLabel('Vaucher 13 000 so‘m'), 'Vaucher 13 000');
    expect(sapperPrizeLabel('ваучер 13 000'), 'ваучер 13 000');
    // Приз в баллах не трогаем.
    expect(sapperPrizeLabel('10 IQC'), '10 IQC');
    expect(sapperPrizeText('10 IQC'), '+10 IQC');
  });
}
