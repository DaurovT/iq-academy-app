import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import '../../core/models/wallet.dart';
import '../../widgets/async_view.dart';
import '../shared/widgets/screen_decor.dart';
import 'providers.dart';

final _num = NumberFormat.decimalPattern('ru');

/// Экран ваучера — подарочная карта Korzinka с QR.
/// Перенесён один в один из макета Figma «wallet-voucher-korzinka».
class VoucherScreen extends ConsumerWidget {
  const VoucherScreen({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mine = ref.watch(myVouchersProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final page = isDark ? const Color(0xFF0D1117) : const Color(0xFFF5F6FA);

    return Scaffold(
      backgroundColor: page,
      body: Stack(children: [Positioned.fill(child: ScreenDecor(voucherDecor)), SafeArea(
        child: AsyncView(
          value: mine,
          onRetry: () => ref.invalidate(myVouchersProvider),
          data: (list) {
            final v = list.where((e) => e.id == id).firstOrNull;
            if (v == null) return const EmptyState(text: 'Ваучер не найден');
            return _VoucherBody(voucher: v, isDark: isDark, page: page);
          },
        ),
      )]),
    );
  }
}

class _VoucherBody extends StatelessWidget {
  const _VoucherBody({
    required this.voucher,
    required this.isDark,
    required this.page,
  });

  final IssuedVoucher voucher;
  final bool isDark;
  final Color page;

  @override
  Widget build(BuildContext context) {
    final used = voucher.status == 'used';
    final muted = isDark ? const Color(0xFF8F909A) : const Color(0xFF6B7280);
    final titleColor = isDark ? const Color(0xFF8F909A) : const Color(0xFF6B7280);

    return Column(
      children: [
        // top-nav
        SizedBox(
          height: 56,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).maybePop(),
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      children: [
                        Icon(Icons.chevron_left, size: 24, color: titleColor),
                        const SizedBox(width: 8),
                        Text('Мой ваучер',
                            style: TextStyle(fontSize: 16, color: titleColor)),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.ios_share, size: 22, color: titleColor),
                  onPressed: () => Clipboard.setData(
                    ClipboardData(text: voucher.code),
                  ).then((_) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Код скопирован')));
                    }
                  }),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 8, bottom: 24),
            child: Column(
              children: [
                // status-row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: used
                              ? const Color(0xFF2A2A2A)
                              : const Color(0xFF1A3A2A),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: used
                                  ? const Color(0xFF6B7280)
                                  : const Color(0xFF22C55E)),
                        ),
                        child: Text(used ? 'Использован' : 'Активен',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: used
                                    ? const Color(0xFF9CA3AF)
                                    : const Color(0xFF22C55E))),
                      ),
                      Text('Выпущен ${_date(voucher.issuedAt)}',
                          style: TextStyle(fontSize: 12, color: muted)),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // voucher-card (Korzinka)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: _KorzinkaCard(voucher: voucher, used: used),
                ),
              ],
            ),
          ),
        ),
        // bottom-info
        _BottomInfo(isDark: isDark, page: page, muted: muted),
      ],
    );
  }

  static String _date(String iso) {
    final d = DateTime.tryParse(iso);
    if (d == null) return iso;
    return DateFormat('dd.MM.yyyy').format(d.toLocal());
  }
}

class _KorzinkaCard extends StatelessWidget {
  const _KorzinkaCard({required this.voucher, required this.used});
  final IssuedVoucher voucher;
  final bool used;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFFE31E24),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(color: Color(0x99000000), blurRadius: 40, offset: Offset(0, 12)),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 16),
          // логотип korzinka
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: SvgPicture.asset(
              'assets/korzinka.svg',
              height: 44,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8, bottom: 12),
            child: Opacity(
              opacity: 0.8,
              child: Text("SOVG'A KARTASI",
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      color: Colors.white)),
            ),
          ),
          const _DashedDivider(),
          // сумма
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(_num.format(voucher.amountUzs),
                    style: const TextStyle(
                        fontSize: 44,
                        fontWeight: FontWeight.w800,
                        color: Colors.white)),
                const SizedBox(height: 2),
                Text('UZS · ПОДАРОЧНАЯ КАРТА',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withValues(alpha: 0.7))),
              ],
            ),
          ),
          const _DashedDivider(),
          // QR
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  width: 180,
                  height: 180,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Opacity(
                    opacity: used ? 0.3 : 1,
                    child: QrImageView(
                      data: voucher.code,
                      size: 150,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SelectableText(voucher.code,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
                const SizedBox(height: 12),
                SizedBox(
                  width: 260,
                  child: Text('Покажите QR-код кассиру или назовите код',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withValues(alpha: 0.7))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DashedDivider extends StatelessWidget {
  const _DashedDivider();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const dash = 6.0;
        const gap = 4.0;
        final count = (constraints.maxWidth / (dash + gap)).floor();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            count,
            (_) => Container(
              width: dash,
              height: 1,
              color: Colors.white.withValues(alpha: 0.25),
            ),
          ),
        );
      },
    );
  }
}

class _BottomInfo extends StatelessWidget {
  const _BottomInfo({required this.isDark, required this.page, required this.muted});
  final bool isDark;
  final Color page;
  final Color muted;

  @override
  Widget build(BuildContext context) {
    final border = isDark ? const Color(0xFF1E2A3A) : const Color(0xFFEBEDF0);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: page,
        border: Border(top: BorderSide(color: border)),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => launchUrl(Uri.parse('https://korzinka.uz'),
                mode: LaunchMode.externalApplication),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Магазины Korzinka.uz',
                    style: TextStyle(fontSize: 13, color: muted)),
                Icon(Icons.open_in_new, size: 16, color: muted),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Divider(height: 1, color: border),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Служба поддержки',
                  style: TextStyle(fontSize: 13, color: muted)),
              GestureDetector(
                onTap: () => launchUrl(Uri.parse('tel:1155')),
                child: const Text('1155',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF60A5FA))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
