import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../core/api/providers.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/models/support.dart';
import '../../../widgets/async_view.dart';
import '../providers.dart';
import '../widgets/pharm_top_bar.dart';
import '../widgets/screen_decor.dart';

final _dt = DateFormat('dd.MM, HH:mm');

/// Чат с поддержкой. Перенесён один в один из макета Figma
/// «pharmiq-support-chat».
class SupportScreen extends ConsumerStatefulWidget {
  const SupportScreen({super.key});

  @override
  ConsumerState<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends ConsumerState<SupportScreen> {
  final _ctrl = TextEditingController();
  bool _sending = false;

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    final text = _ctrl.text.trim();
    if (text.isEmpty || _sending) return;
    setState(() => _sending = true);
    final messenger = ScaffoldMessenger.of(context);
    try {
      await ref.read(apiProvider).support.send(text);
      _ctrl.clear();
      ref.invalidate(supportThreadProvider);
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = _S.of(context);
    final thread = ref.watch(supportThreadProvider);

    return Scaffold(
      backgroundColor: c.page,
      body: Stack(children: [Positioned.fill(child: ScreenDecor(supportDecor)), Column(
        children: [
          const PharmTopBar(),
          // back-nav
          SizedBox(
            height: 44,
            child: InkWell(
              onTap: () =>
                  context.canPop() ? context.pop() : context.go('/app/profile'),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Icon(Icons.arrow_back, size: 18, color: c.muted),
                    const SizedBox(width: 6),
                    Text(context.l10n.supportBackProfile,
                        style: TextStyle(fontSize: 14, color: c.muted)),
                  ],
                ),
              ),
            ),
          ),
          // title
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(context.l10n.supportTitle,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: c.text)),
            ),
          ),
          // chat card
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: c.chatBg, borderRadius: BorderRadius.circular(16)),
                child: AsyncView(
                  value: thread,
                  onRetry: () => ref.invalidate(supportThreadProvider),
                  data: (list) => list.isEmpty
                      ? Center(
                          child: Text(context.l10n.supportEmptyHint,
                              style: TextStyle(color: c.muted)))
                      : ListView(
                          padding: const EdgeInsets.all(16),
                          children: [
                            for (final m in list) _Bubble(c: c, m: m),
                          ],
                        ),
                ),
              ),
            ),
          ),
          // input-bar
          Container(
            color: c.inputBar,
            child: SafeArea(
              top: false,
              child: Container(
                height: 61,
                padding: const EdgeInsets.only(left: 16, right: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: c.field,
                            borderRadius: BorderRadius.circular(24)),
                        child: TextField(
                          controller: _ctrl,
                          style: TextStyle(fontSize: 14, color: c.text),
                          textInputAction: TextInputAction.send,
                          onSubmitted: (_) => _send(),
                          decoration: InputDecoration(
                            isCollapsed: true,
                            filled: false,
                            border: InputBorder.none,
                            hintText: context.l10n.supportInputHint,
                            hintStyle:
                                TextStyle(fontSize: 14, color: c.muted),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: _sending ? null : _send,
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: const Color(0xFF1A3566),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Icon(Icons.send,
                            size: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )]),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({required this.c, required this.m});
  final _S c;
  final SupportMessage m;

  @override
  Widget build(BuildContext context) {
    final isUser = m.from == 'user';
    final time = DateTime.tryParse(m.createdAt);
    final timeStr = time == null ? m.createdAt : _dt.format(time.toLocal());
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment:
            isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 280),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isUser ? const Color(0xFF1A3566) : Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(16),
                topRight: const Radius.circular(16),
                bottomLeft: Radius.circular(isUser ? 16 : 4),
                bottomRight: Radius.circular(isUser ? 4 : 16),
              ),
            ),
            child: Text(m.text,
                style: TextStyle(
                    fontSize: 16,
                    height: 1.4,
                    color: isUser ? Colors.white : const Color(0xFF0D1117))),
          ),
          const SizedBox(height: 6),
          Text(
              '${isUser ? context.l10n.supportYou : context.l10n.supportTeam} · $timeStr',
              style: const TextStyle(fontSize: 11, color: Color(0xFF8B949E))),
        ],
      ),
    );
  }
}

class _S {
  const _S({
    required this.page,
    required this.text,
    required this.muted,
    required this.chatBg,
    required this.inputBar,
    required this.field,
  });

  final Color page;
  final Color text;
  final Color muted;
  final Color chatBg;
  final Color inputBar;
  final Color field;

  static _S of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? _dark : _light;

  static const _dark = _S(
    page: Color(0xFF0D1117),
    text: Color(0xFFE4E2ED),
    muted: Color(0xFF8F909A),
    chatBg: Color(0xFF121820),
    inputBar: Color(0xFF0D1018),
    field: Color(0xFF1A1E28),
  );

  static const _light = _S(
    page: Color(0xFFF5F6FA),
    text: Color(0xFF1A1D26),
    muted: Color(0xFF6B7280),
    chatBg: Color(0xFFEEF1F6),
    inputBar: Color(0xFFFFFFFF),
    field: Color(0xFFF2F4F7),
  );
}
