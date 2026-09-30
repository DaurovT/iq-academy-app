import 'package:flutter/material.dart';

import 'pq_colors.dart';
import 'pq_icon.dart';
import 'pq_icons.dart';
import 'pq_motion.dart';
import 'pq_text.dart';

/// Пункт нижнего меню.
class PqNavItem {
  const PqNavItem({required this.icon, required this.label, this.badge = false});

  final PqIcons icon;
  final String label;
  final bool badge;
}

/// Нижнее меню (раздел «06»): высота 84 (включая 16 под индикатор «домой»),
/// активный пункт — капсула 64×32. Капсула «вырастает» при переключении.
class PqBottomNav extends StatelessWidget {
  const PqBottomNav({
    super.key,
    required this.items,
    required this.selected,
    required this.onSelect,
    this.wrapItem,
  });

  final List<PqNavItem> items;
  final int selected;
  final ValueChanged<int> onSelect;

  /// Обёртка пункта (например, якорь обучающего тура).
  final Widget Function(int index, Widget item)? wrapItem;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final bottom = MediaQuery.paddingOf(context).bottom;
    return Container(
      padding: EdgeInsets.fromLTRB(8, 8, 8, bottom > 16 ? bottom : 16),
      decoration: BoxDecoration(
        color: pq.navBg,
        border: Border(top: BorderSide(color: pq.navBorder)),
        boxShadow: pq.isDark
            ? null
            : const [BoxShadow(color: Color(0x0D000000), offset: Offset(0, -2), blurRadius: 8)],
      ),
      child: SizedBox(
        height: 60,
        child: Row(children: [
          for (var i = 0; i < items.length; i++)
            Expanded(
              child: (wrapItem ?? (_, w) => w)(
                i,
                _NavButton(
                  item: items[i],
                  active: i == selected,
                  onTap: () => onSelect(i),
                ),
              ),
            ),
        ]),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({required this.item, required this.active, required this.onTap});

  final PqNavItem item;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    return Semantics(
      selected: active,
      button: true,
      label: item.label,
      excludeSemantics: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 32,
              width: 64,
              child: Stack(alignment: Alignment.center, clipBehavior: Clip.none, children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 280),
                  curve: PqMotion.ease,
                  width: active ? 64 : 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: active ? pq.navPill : pq.navPill.withValues(alpha: 0),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                TweenAnimationBuilder<Color?>(
                  tween: ColorTween(end: active ? pq.navPillIcon : pq.navInactive),
                  duration: const Duration(milliseconds: 200),
                  builder: (_, c, __) => PqIcon(item.icon, size: 21, color: c),
                ),
                if (item.badge)
                  Positioned(
                    top: 2,
                    right: active ? 14 : 18,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: PqColors.badge,
                        shape: BoxShape.circle,
                        border: Border.all(color: pq.navBg, width: 1.5),
                      ),
                    ),
                  ),
              ]),
            ),
            const SizedBox(height: 4),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: PqText.text(12, active ? FontWeight.w700 : FontWeight.w500,
                  height: 1.2, c: active ? pq.navActiveLabel : pq.navInactive),
              child: Text(item.label, maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      ),
    );
  }
}
