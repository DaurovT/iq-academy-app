import 'package:flutter/material.dart';

import '../../../core/design/design.dart';
import '../../../core/l10n/l10n.dart';
import 'privacy_policy_text.dart';
import 'profile_widgets.dart';

/// Полный текст политики (макет PrivacyFull): оглавление-карточка со
/// ссылками на разделы и нумерованные разделы. Текст — из landing/privacy.html
/// (только русский, как на сайте).
class PrivacyFullScreen extends StatefulWidget {
  const PrivacyFullScreen({super.key});

  @override
  State<PrivacyFullScreen> createState() => _PrivacyFullScreenState();
}

class _PrivacyFullScreenState extends State<PrivacyFullScreen> {
  late final _keys = [for (final _ in kPrivacyDocSections) GlobalKey()];

  int get _readMinutes {
    final words = kPrivacyDocSections
        .expand((s) => s.items)
        .fold<int>(0, (n, t) => n + t.split(RegExp(r'\s+')).length);
    return (words / 180).ceil().clamp(1, 60);
  }

  void _jump(int i) {
    final ctx = _keys[i].currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: PqMotion.reduced(context) ? Duration.zero : const Duration(milliseconds: 450),
      curve: PqMotion.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    final pq = context.pq;
    final l = context.l10n;
    final ruOnly = Localizations.localeOf(context).languageCode != 'ru';
    return PqScreen(
      child: Column(children: [
        PqTopBar(
          title: l.profilePrivacy,
          backLabel: l.profileBack,
          onBack: () => profileGoBack(context),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
            child: PqStagger.auth(
              gap: 24,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Semantics(
                    header: true,
                    child: Text(kPrivacyDocTitle, style: PqText.display(c: pq.text)),
                  ),
                  const SizedBox(height: 4),
                  Text(l.profilePrivacyReadTime(_readMinutes),
                      style: PqText.subtitle(c: pq.textMuted)),
                ]),
                ProfileWarnBanner(ruOnly
                    ? '${l.profilePrivacyDraft}. ${l.profilePrivacyRuOnly}'
                    : l.profilePrivacyDraft),
                PqCard(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 4),
                      child: Text(l.profilePrivacyContents.toUpperCase(),
                          style: PqText.overline(c: pq.textMuted)),
                    ),
                    for (var i = 0; i < kPrivacyDocSections.length; i++)
                      PqPressable(
                        onTap: () => _jump(i),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(minHeight: 36),
                          child: Row(children: [
                            SizedBox(
                              width: 20,
                              child: Text(kPrivacyDocSections[i].number,
                                  style: PqText.text(15, FontWeight.w400, c: pq.textMuted)),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(kPrivacyDocSections[i].title,
                                  style: PqText.text(15, FontWeight.w400, c: pq.accent)),
                            ),
                          ]),
                        ),
                      ),
                    const SizedBox(height: 8),
                  ]),
                ),
                for (var i = 0; i < kPrivacyDocSections.length; i++)
                  Column(
                    key: _keys[i],
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Semantics(
                        header: true,
                        child: Text(
                            '${kPrivacyDocSections[i].number}. ${kPrivacyDocSections[i].title}',
                            style: PqText.title(c: pq.text)),
                      ),
                      for (final p in kPrivacyDocSections[i].items) ...[
                        const SizedBox(height: 8),
                        Text(p,
                            style: PqText.text(15, FontWeight.w400,
                                height: 1.65, c: pq.textSecondary)),
                      ],
                    ],
                  ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
