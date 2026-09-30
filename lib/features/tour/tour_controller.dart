import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/api/providers.dart';
import '../../core/auth/auth_controller.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/common.dart';

/// Цели тура — элементы главной и вкладки нижнего меню (макеты Tour*.dc.html).
enum TourTarget { balance, sendCheck, quest, tabChecks, tabLearn, tabProfile }

/// Шаг тура с подсветкой элемента.
class TourStep {
  const TourStep({
    required this.target,
    required this.title,
    required this.text,
    this.tapDot,
  });

  final TourTarget target;
  final String Function(AppLocalizations l) title;
  final String Function(AppLocalizations l) text;

  /// Точка «нажми сюда» — только там, где элемент — кнопка/вкладка;
  /// положение внутри цели (Alignment).
  final Alignment? tapDot;
}

/// Сценарии из спецификаций TourSpec (фармацевт) и DocTourSpec (врач):
/// приветствие → 6 шагов → «Готово». Тексты врача — про бланки.
List<TourStep> tourStepsFor(Role role) {
  final doc = role == Role.doctor;
  const button = Alignment(.85, 0);
  const tab = Alignment(.67, -.55);
  return [
    TourStep(
      target: TourTarget.balance,
      title: (l) => l.tourBalanceTitle,
      text: (l) => doc ? l.tourBalanceTextDoc : l.tourBalanceText,
    ),
    TourStep(
      target: TourTarget.sendCheck,
      title: (l) => doc ? l.tourSendTitleDoc : l.tourSendTitle,
      text: (l) => doc ? l.tourSendTextDoc : l.tourSendText,
      tapDot: button,
    ),
    TourStep(
      target: TourTarget.quest,
      title: (l) => l.tourQuestsTitle,
      text: (l) => doc ? l.tourQuestsTextDoc : l.tourQuestsText,
    ),
    TourStep(
      target: TourTarget.tabChecks,
      title: (l) => doc ? l.tourChecksTitleDoc : l.tourChecksTitle,
      text: (l) => doc ? l.tourChecksTextDoc : l.tourChecksText,
      tapDot: tab,
    ),
    TourStep(
      target: TourTarget.tabLearn,
      title: (l) => l.tourLearnTitle,
      text: (l) => l.tourLearnText,
      tapDot: tab,
    ),
    TourStep(
      target: TourTarget.tabProfile,
      title: (l) => l.tourProfileTitle,
      text: (l) => doc ? l.tourProfileTextDoc : l.tourProfileText,
      tapDot: tab,
    ),
  ];
}

/// Фаза тура.
enum TourPhase { off, welcome, step, done }

@immutable
class TourState {
  const TourState({
    this.phase = TourPhase.off,
    this.steps = const [],
    this.index = 0,
    this.role = Role.pharmacist,
  });

  final TourPhase phase;

  /// Чей сценарий (тексты приветствия и финала различаются).
  final Role role;

  /// Шаги, цели которых есть на экране (у нового пользователя, например,
  /// нет карточки баланса) — счётчик «Шаг N из M» считает только их.
  final List<TourStep> steps;
  final int index;

  bool get active => phase != TourPhase.off;
  TourStep? get current =>
      phase == TourPhase.step && index < steps.length ? steps[index] : null;

  TourState copyWith({TourPhase? phase, List<TourStep>? steps, int? index}) =>
      TourState(
        phase: phase ?? this.phase,
        steps: steps ?? this.steps,
        index: index ?? this.index,
        role: role,
      );
}

/// Реестр целей: [TourAnchor] регистрирует свой контекст, оверлей читает
/// положение. Без GlobalKey — один и тот же экран может монтироваться дважды.
class TourAnchors {
  TourAnchors._();

  static final _map = <TourTarget, _AnchorEntry>{};

  static void _set(TourTarget t, BuildContext c, double radius) =>
      _map[t] = _AnchorEntry(c, radius);

  static void _remove(TourTarget t, BuildContext c) {
    if (identical(_map[t]?.context, c)) _map.remove(t);
  }

  static BuildContext? context(TourTarget t) {
    final e = _map[t];
    if (e == null || !e.context.mounted) return null;
    return e.context;
  }

  static double radius(TourTarget t) => _map[t]?.radius ?? 16;

  /// Прямоугольник цели в координатах [ancestor] (или экрана).
  static Rect? rect(TourTarget t, {RenderObject? ancestor}) {
    final c = context(t);
    final box = c?.findRenderObject();
    if (box is! RenderBox || !box.attached || !box.hasSize) return null;
    return box.localToGlobal(Offset.zero, ancestor: ancestor) & box.size;
  }
}

class _AnchorEntry {
  _AnchorEntry(this.context, this.radius);

  final BuildContext context;
  final double radius;
}

/// Помечает элемент как цель тура.
class TourAnchor extends StatefulWidget {
  const TourAnchor({
    super.key,
    required this.target,
    required this.child,
    this.radius = 16,
  });

  final TourTarget target;

  /// Радиус скругления элемента: вырез = радиус + 4.
  final double radius;
  final Widget child;

  @override
  State<TourAnchor> createState() => _TourAnchorState();
}

class _TourAnchorState extends State<TourAnchor> {
  @override
  void initState() {
    super.initState();
    TourAnchors._set(widget.target, context, widget.radius);
  }

  @override
  void didUpdateWidget(TourAnchor old) {
    super.didUpdateWidget(old);
    if (old.target != widget.target) TourAnchors._remove(old.target, context);
    TourAnchors._set(widget.target, context, widget.radius);
  }

  @override
  void dispose() {
    TourAnchors._remove(widget.target, context);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

/// Управление туром. Флаг «пройдено» хранится на устройстве по аккаунту
/// (на сервере поля для него пока нет).
class TourController extends Notifier<TourState> {
  bool _autoChecked = false;

  @override
  TourState build() => const TourState();

  String? get _account {
    final phone = ref.read(authControllerProvider).asData?.value.account?.phone;
    return phone?.replaceAll(RegExp(r'\D'), '');
  }

  Role? get _role => ref.read(authControllerProvider).asData?.value.activeRole;

  /// Есть ли тур для роли (сценарии в макетах — фармацевт и врач).
  static bool supports(Role? role) =>
      role == Role.pharmacist || role == Role.doctor;

  /// Один раз после входа, когда главная загрузилась (не на скелетоне).
  Future<void> maybeAutoStart() async {
    if (_autoChecked || state.active) return;
    _autoChecked = true;
    final role = _role;
    final account = _account;
    if (!supports(role) || account == null) return;
    try {
      final store = ref.read(tokenStoreProvider);
      if (await store.readTourDone('${role!.name}_$account')) return;
    } catch (_) {
      return; // хранилище недоступно — лучше не показывать, чем показывать всегда
    }
    start();
  }

  /// Запустить с приветствия (в т. ч. «Пройти обучение заново»).
  void start() {
    final role = _role;
    if (!supports(role)) return;
    state = TourState(phase: TourPhase.welcome, role: role!);
  }

  /// «Начать»: собрать шаги, цели которых сейчас есть на экране.
  void begin() {
    final steps = [
      for (final s in tourStepsFor(state.role))
        if (TourAnchors.context(s.target) != null) s,
    ];
    state =
        steps.isEmpty
            ? state.copyWith(phase: TourPhase.done)
            : TourState(
              phase: TourPhase.step,
              steps: steps,
              index: 0,
              role: state.role,
            );
  }

  void next() {
    if (state.phase == TourPhase.welcome) return begin();
    if (state.phase != TourPhase.step) return;
    if (state.index + 1 >= state.steps.length) {
      state = state.copyWith(phase: TourPhase.done);
    } else {
      state = state.copyWith(index: state.index + 1);
    }
  }

  void back() {
    if (state.phase == TourPhase.step && state.index > 0) {
      state = state.copyWith(index: state.index - 1);
    }
  }

  /// «Пропустить», «Готово», «Начать работу» — ставят флаг «пройдено».
  Future<void> finish() async {
    final role = state.role;
    state = const TourState();
    final account = _account;
    if (account != null) {
      try {
        await ref
            .read(tokenStoreProvider)
            .writeTourDone('${role.name}_$account');
      } catch (_) {}
    }
  }
}

final tourProvider = NotifierProvider<TourController, TourState>(
  TourController.new,
);
