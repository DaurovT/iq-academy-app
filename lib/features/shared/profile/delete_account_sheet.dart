import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/api/providers.dart';
import '../../../core/auth/auth_controller.dart';
import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import '../../pharmacist/providers.dart';
import 'profile_widgets.dart';

/// Путь экрана «Аккаунт удалён» — гостевой (под /login/…), т. к. после
/// удаления сессия закрыта.
const kAccountDeletedPath = '/login/account-deleted';

/// «Удалить аккаунт?» — нижний лист с подтверждением словом (макет DeleteAccount).
/// Успех → AccountApi.deleteAccount, выход и экран «Аккаунт удалён».
Future<void> showDeleteAccountSheet(BuildContext context) => showPqSheet<void>(
  context,
  scrollable: true,
  padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
  handleGap: 16,
  bordered: true,
  scrim: const Color(0x9905060A), // rgba(5,6,10,.6) в обеих темах
  builder: (_) => const _DeleteSheet(),
);

class _DeleteSheet extends ConsumerStatefulWidget {
  const _DeleteSheet();

  @override
  ConsumerState<_DeleteSheet> createState() => _DeleteSheetState();
}

class _DeleteSheetState extends ConsumerState<_DeleteSheet> {
  final _ctrl = TextEditingController();
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _ctrl.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  bool get _matches =>
      _ctrl.text.trim().toUpperCase() ==
      context.l10n.profileDeleteWord.toUpperCase();

  Future<void> _delete() async {
    if (!_matches || _busy) return;
    setState(() => _busy = true);
    final router = GoRouter.of(context);
    final nav = Navigator.of(context);
    final auth = ref.read(authControllerProvider.notifier);
    try {
      await ref.read(apiProvider).account.deleteAccount();
    } catch (e) {
      if (!mounted) return;
      setState(() => _busy = false);
      showPqToast(
        context,
        context.l10n.profileDeleteFailed,
        tone: PqTone.danger,
        subtitle: profileErrorText(context, e),
      );
      return;
    }
    nav.pop();
    await auth.logout();
    router.go(kAccountDeletedPath);
  }

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final balance = ref.watch(walletProvider).asData?.value.balanceIqc;
    final vouchers =
        ref
            .watch(myVouchersProvider)
            .asData
            ?.value
            .where((v) => v.status == 'issued')
            .length;
    final fmt = NumberFormat.decimalPattern('ru');

    Widget loss(PqIcons icon, String title, String hint) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          PqIconTile(
            icon,
            tone: PqTone.danger,
            size: 36,
            radius: 10,
            iconSize: 18,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: PqText.text(15, FontWeight.w600, c: pq.text),
                ),
                const SizedBox(height: 1),
                Text(
                  hint,
                  style: PqText.text(13, FontWeight.w400, c: pq.textMuted),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: PqAnimate(
            fx: PqFx.rise,
            child: Container(
              width: 64,
              height: 64,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: pq.dangerSoft,
                shape: BoxShape.circle,
              ),
              child: PqIcon(PqIcons.trash, size: 28, color: pq.danger),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Semantics(
          header: true,
          child: Text(
            l.profileDeleteConfirmTitle,
            textAlign: TextAlign.center,
            style: PqText.heading(22, FontWeight.w700, c: pq.text),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          l.profileDeleteLose,
          textAlign: TextAlign.center,
          style: PqText.text(15, FontWeight.w400, c: pq.textSecondary),
        ),
        const SizedBox(height: 16),
        if (balance != null && balance > 0)
          loss(
            PqIcons.star,
            l.profileDeleteLoseIqc(fmt.format(balance)),
            l.profileDeleteLoseIqcHint,
          ),
        if (vouchers != null && vouchers > 0)
          loss(
            PqIcons.gift,
            l.profileDeleteLoseVouchers(vouchers),
            l.profileDeleteLoseVouchersHint,
          ),
        loss(
          PqIcons.target,
          l.profileDeleteLoseProgress,
          l.profileDeleteLoseProgressHint,
        ),
        const SizedBox(height: 16),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: '${l.profileDeleteTypePrompt} '),
              TextSpan(
                text: l.profileDeleteWord,
                style: PqText.body(c: pq.text, w: FontWeight.w700),
              ),
            ],
          ),
          style: PqText.body(c: pq.textSecondary),
        ),
        const SizedBox(height: 6),
        PqTextField(
          controller: _ctrl,
          hint: l.profileDeleteWord,
          height: 52,
          textCapitalization: TextCapitalization.characters,
          textInputAction: TextInputAction.done,
          onSubmitted: (_) => _delete(),
        ),
        const SizedBox(height: 16),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: _matches || _busy ? 1 : .7,
          child: IgnorePointer(
            ignoring: !_matches,
            child: PqButton(
              label: l.profileDeleteForever,
              loadingLabel: l.profileDeleting,
              kind: PqButtonKind.danger,
              height: 52,
              loading: _busy,
              onPressed: _delete,
            ),
          ),
        ),
        const SizedBox(height: 8),
        PqButton(
          label: l.profileDeleteKeep,
          kind: PqButtonKind.secondary,
          height: 52,
          onPressed: _busy ? null : () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
