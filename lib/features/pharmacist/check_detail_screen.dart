import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/format.dart';
import '../../core/models/check.dart';
import '../../widgets/async_view.dart';
import '../shared/widgets/photo_lightbox.dart';
import '../shared/widgets/screen_decor.dart';
import 'providers.dart';

/// Деталь чека. Перенесена один в один из макета Figma «detail-*»
/// (состояния: отклонён / на проверке / начислено / одобрен).
class CheckDetailScreen extends ConsumerWidget {
  const CheckDetailScreen({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = _CD.of(context);
    final detail = ref.watch(checkDetailProvider(id));

    return Scaffold(
      backgroundColor: c.page,
      body: Stack(children: [Positioned.fill(child: ScreenDecor(checkDetailDecor)), SafeArea(
        bottom: false,
        child: AsyncView(
          value: detail,
          onRetry: () => ref.invalidate(checkDetailProvider(id)),
          data: (d) => _Body(c: c, id: id, detail: d),
        ),
      )]),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.c, required this.id, required this.detail});
  final _CD c;
  final int id;
  final CheckDetail detail;

  @override
  Widget build(BuildContext context) {
    final status = detail.status;
    final (chipBg, chipFg, chipLabel) = _chip(status);

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
      children: [
        // top-nav
        SizedBox(
          height: 44,
          child: InkWell(
            onTap: () => context.canPop()
                ? context.pop()
                : context.go('/app/checks'),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(Icons.chevron_left, size: 20, color: c.muted),
                  const SizedBox(width: 4),
                  Text('Мои чеки',
                      style: TextStyle(fontSize: 14, color: c.muted)),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),

        // header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text('Чек №$id',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: c.text)),
            ),
            const SizedBox(width: 12),
            Container(
              height: 24,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  color: chipBg, borderRadius: BorderRadius.circular(12)),
              child: Text(chipLabel.toUpperCase(),
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: chipFg)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(formatDateTime(detail.createdAt),
            style: TextStyle(fontSize: 14, color: c.muted)),
        const SizedBox(height: 24),

        // receipt-photo
        _PhotoBox(c: c, detail: detail),
        const SizedBox(height: 24),

        // ── карточки по статусу ──
        ..._statusCards(context, status),

        // quest-card
        _QuestCard(c: c, text: _questText(status), positive: _questPositive(status)),
      ],
    );
  }

  List<Widget> _statusCards(BuildContext context, CheckStatus status) {
    switch (status) {
      case CheckStatus.rejected:
        return [
          _RejectionCard(
            c: c,
            reason: detail.rejectReason ?? 'Чек отклонён',
            onResubmit: () => context.go('/app/checks'),
          ),
          const SizedBox(height: 24),
        ];
      case CheckStatus.pending:
      case CheckStatus.aiWrong:
        return [
          _PendingCard(c: c, sentAt: formatDateTime(detail.createdAt)),
          const SizedBox(height: 24),
          _AiDimmedCard(c: c),
          const SizedBox(height: 24),
        ];
      case CheckStatus.aiDetected:
      case CheckStatus.approved:
        return [
          _AiCard(c: c, drugs: detail.drugs),
          const SizedBox(height: 24),
        ];
    }
  }

  String _questText(CheckStatus status) {
    if (detail.allocations.isNotEmpty) {
      final a = detail.allocations.first;
      return '${a.questName} · Квест выполнен ✓';
    }
    return switch (status) {
      CheckStatus.pending || CheckStatus.aiDetected || CheckStatus.aiWrong =>
        'Появится после одобрения чека',
      _ => 'Пока не зачтён ни в один квест',
    };
  }

  bool _questPositive(CheckStatus status) => detail.allocations.isNotEmpty;

  (Color, Color, String) _chip(CheckStatus s) => switch (s) {
        CheckStatus.approved => (c.approvedBg, c.approvedFg, 'Одобрен'),
        CheckStatus.rejected => (c.rejectedBg, c.rejectedFg, 'Отклонён'),
        _ => (const Color(0xFFF5A623), const Color(0xFF3A2A00), 'На проверке'),
      };
}

// ── Фото чека ───────────────────────────────────────────────────────────

class _PhotoBox extends StatelessWidget {
  const _PhotoBox({required this.c, required this.detail});
  final _CD c;
  final CheckDetail detail;

  @override
  Widget build(BuildContext context) {
    final hasPhoto = detail.photos.isNotEmpty;
    final box = Container(
      height: 200,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: c.card, borderRadius: BorderRadius.circular(16)),
      child: hasPhoto
          ? Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  detail.photos.first.url,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => _placeholder(),
                ),
                // подсказка «нажмите, чтобы открыть»
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                        color: const Color(0x99000000),
                        borderRadius: BorderRadius.circular(999)),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      const Icon(Icons.zoom_in, size: 16, color: Colors.white),
                      const SizedBox(width: 4),
                      Text(
                          detail.photos.length > 1 ? '1/${detail.photos.length}' : 'Открыть',
                          style: const TextStyle(fontSize: 12, color: Colors.white)),
                    ]),
                  ),
                ),
              ],
            )
          : _placeholder(),
    );
    if (!hasPhoto) return box;
    return GestureDetector(
      onTap: () => showPhotoLightbox(
          context, [for (final p in detail.photos) p.url]),
      child: box,
    );
  }

  Widget _placeholder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.description_outlined, size: 48, color: c.muted),
        const SizedBox(height: 12),
        Text('фото: ${detail.photoCount}',
            style: TextStyle(fontSize: 14, color: c.muted)),
      ],
    );
  }
}

// ── Карточка отклонения ─────────────────────────────────────────────────

class _RejectionCard extends StatelessWidget {
  const _RejectionCard(
      {required this.c, required this.reason, required this.onResubmit});
  final _CD c;
  final String reason;
  final VoidCallback onResubmit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: c.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFCF6679)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.error_outline,
                  size: 20, color: Color(0xFFCF6679)),
              const SizedBox(width: 8),
              Text('Причина отклонения',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: c.text)),
            ],
          ),
          const SizedBox(height: 16),
          Text(reason,
              style: const TextStyle(fontSize: 13, color: Color(0xFFFFB3B3))),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 40,
            child: FilledButton.icon(
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF6B9EF5),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: onResubmit,
              icon: const Icon(Icons.refresh, size: 18),
              label: const Text('Отправить повторно',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Карточка «на проверке» ──────────────────────────────────────────────

class _PendingCard extends StatelessWidget {
  const _PendingCard({required this.c, required this.sentAt});
  final _CD c;
  final String sentAt;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: c.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0x66F5A623)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.schedule, size: 20, color: Color(0xFFFFD770)),
              SizedBox(width: 8),
              Text('На проверке',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFFD770))),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
              'Ваш чек на проверке у специалиста. Обычно это занимает до 24 часов.',
              style: TextStyle(fontSize: 13, color: Color(0xFFD4B86A))),
          const SizedBox(height: 12),
          Opacity(
            opacity: 0.6,
            child: Text('Отправлен: $sentAt',
                style: TextStyle(fontSize: 12, color: c.muted)),
          ),
        ],
      ),
    );
  }
}

class _AiDimmedCard extends StatelessWidget {
  const _AiDimmedCard({required this.c});
  final _CD c;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.4,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: c.card, borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.auto_awesome, size: 20, color: c.text),
                const SizedBox(width: 8),
                Text('Ожидание распознавания ИИ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: c.text)),
              ],
            ),
            const SizedBox(height: 8),
            Text('Результат появится после проверки',
                style: TextStyle(fontSize: 14, color: c.muted)),
          ],
        ),
      ),
    );
  }
}

// ── Карточка «распознано ИИ» ────────────────────────────────────────────

class _AiCard extends StatelessWidget {
  const _AiCard({required this.c, required this.drugs});
  final _CD c;
  final List<CheckDrug> drugs;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: c.card, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.auto_awesome, size: 20, color: Color(0xFFC4B5FD)),
              const SizedBox(width: 8),
              Text('Распознано ИИ',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: c.text)),
            ],
          ),
          for (final d in drugs) ...[
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(d.name,
                      style: TextStyle(fontSize: 14, color: c.muted)),
                ),
                const SizedBox(width: 12),
                Text('${d.packs} уп.',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: c.text)),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

// ── Карточка «зачёт в квесты» ───────────────────────────────────────────

class _QuestCard extends StatelessWidget {
  const _QuestCard({required this.c, required this.text, required this.positive});
  final _CD c;
  final String text;
  final bool positive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: c.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: c.questBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Зачёт в квесты',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600, color: c.text)),
          const SizedBox(height: 4),
          Text(text,
              style: TextStyle(
                  fontSize: 14,
                  color: positive ? const Color(0xFF79D384) : c.muted)),
        ],
      ),
    );
  }
}

// ── Палитра ─────────────────────────────────────────────────────────────

class _CD {
  const _CD({
    required this.page,
    required this.card,
    required this.text,
    required this.muted,
    required this.questBorder,
    required this.approvedBg,
    required this.approvedFg,
    required this.rejectedBg,
    required this.rejectedFg,
  });

  final Color page;
  final Color card;
  final Color text;
  final Color muted;
  final Color questBorder;
  final Color approvedBg;
  final Color approvedFg;
  final Color rejectedBg;
  final Color rejectedFg;

  static _CD of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? _dark : _light;

  static const _dark = _CD(
    page: Color(0xFF0D1117),
    card: Color(0xFF151B2A),
    text: Color(0xFFFFFFFF),
    muted: Color(0xFF8F909A),
    questBorder: Color(0xFF2D2E38),
    approvedBg: Color(0xFF14421E),
    approvedFg: Color(0xFF79D384),
    rejectedBg: Color(0xFF5C1A28),
    rejectedFg: Color(0xFFFFD9D6),
  );

  static const _light = _CD(
    page: Color(0xFFF5F6FA),
    card: Color(0xFFFFFFFF),
    text: Color(0xFF1A1D26),
    muted: Color(0xFF6B7280),
    questBorder: Color(0xFFEBEDF0),
    approvedBg: Color(0xFFDCFCE7),
    approvedFg: Color(0xFF16A34A),
    rejectedBg: Color(0xFFFEE2E2),
    rejectedFg: Color(0xFFDC2626),
  );
}
