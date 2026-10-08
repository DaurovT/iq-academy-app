import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/design/design.dart';
import '../../core/l10n/l10n.dart';
import '../../core/models/common.dart';
import '../../core/models/medrep.dart';
import '../../widgets/pq_states.dart';
import 'medrep_widgets.dart';
import 'providers.dart';

/// «Пригласить в команду» (макет MedInvite): кодовое слово медпреда,
/// «Копировать» / «Поделиться» и как это работает для врача и фармацевта.
///
/// Блока «Ссылка-приглашение» из макета нет намеренно: в приложении
/// приглашают только кодовым словом.
class MedrepInviteScreen extends ConsumerWidget {
  const MedrepInviteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final code = ref.watch(medrepCodeProvider);
    return PqScreen(
      safeBottom: false,
      child: Column(children: [
        PqTopBar(
          title: l.medrepInviteTitle,
          backLabel: l.medrepTeamTitle,
          onBack: () => medBack(context, '/app/portfolio'),
        ),
        Expanded(
          child: PqRefresh(
            onRefresh: () async {
              ref.invalidate(medrepCodeProvider);
              await ref
                  .read(medrepCodeProvider.future)
                  .then((_) {}, onError: (_) {});
            },
            child: PqAsync<MedrepCode>(
              value: code,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
              onRetry: () => ref.invalidate(medrepCodeProvider),
              data: (c) => SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 0, 16, kPqNavClearance),
                child: PqStagger(gap: 24, children: [
                  _CodeHero(code: c),
                  const _HowItWorks(),
                ]),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

/// Герой-карточка: подпись, слово 48/800 с разрядкой 10 и две кнопки 50.
class _CodeHero extends StatelessWidget {
  const _CodeHero({required this.code});

  final MedrepCode code;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final muted = medHeroMuted(pq);
    final username = (code.username ?? '').replaceFirst('@', '').trim();
    return MedHeroCard(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(l.medrepYourCode.toUpperCase(), style: PqText.overline(c: muted)),
        const SizedBox(height: 14),
        PqAnimate(
          fx: PqFx.pop,
          delay: const Duration(milliseconds: 150),
          child: Align(
            alignment: Alignment.centerLeft,
            child: MedCodeWord(code.code, size: 48, spacing: 10, color: Colors.white),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          username.isEmpty ? l.medrepCodeHint : l.medrepCodeHintNick(username),
          style: PqText.text(14, FontWeight.w400, c: muted),
        ),
        const SizedBox(height: 18),
        Row(children: [
          Expanded(
            child: PqPressable(
              onTap: () => medCopyCode(context, code.code),
              semanticLabel: l.medrepCopyCode,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0x47FFFFFF)),
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const PqIcon(PqIcons.copy, size: 18, color: Colors.white),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(l.medrepHomeCopy,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: PqText.text(15, FontWeight.w600, c: Colors.white)),
                  ),
                ]),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: MedAccentButton(
              label: l.medrepHomeShare,
              icon: PqIcons.share,
              height: 50,
              iconGap: 8,
              background: pq.isDark ? pq.accent : Colors.white,
              foreground: pq.isDark ? pq.onAccent : pq.accentText,
              onTap: () => medShareCode(context, code.code),
            ),
          ),
        ]),
      ]),
    );
  }
}

/// «Как это работает»: врач — обязательно и сразу в команде, фармацевт —
/// по желанию, через «Ожидают подтверждения».
class _HowItWorks extends StatelessWidget {
  const _HowItWorks();

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final violet = pq.isDark
        ? (bg: const Color(0x2E7C3AED), fg: const Color(0xFFC4B5FD))
        : (bg: const Color(0xFFEDE9FE), fg: const Color(0xFF6D28D9));
    final accent = pq.tone(PqTone.accent);
    Widget row(PqIcons icon, ({Color bg, Color fg}) tone, String title, String text) =>
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            PqIconTile(icon,
                size: 40, iconSize: 20, background: tone.bg, foreground: tone.fg),
            const SizedBox(width: 14),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(title, style: PqText.text(16, FontWeight.w600, c: pq.text)),
                const SizedBox(height: 2),
                Text(text, style: PqText.body(c: pq.textMuted)),
              ]),
            ),
          ]),
        );
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      PqSectionHeader(l.medrepHowTitle),
      const SizedBox(height: 10),
      PqCard(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: pq.divider)),
            ),
            child: row(PqIcons.stethoscope, violet, Role.doctor.label(l), l.medrepHowDoctor),
          ),
          row(PqIcons.medCross, accent, Role.pharmacist.label(l), l.medrepHowPharm),
        ]),
      ),
    ]);
  }
}
