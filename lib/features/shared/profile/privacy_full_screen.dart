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
  // С запасом: в русской версии 10 разделов, в узбекской — 8.
  late final _keys = List.generate(16, (_) => GlobalKey());

  int _readMinutes(PrivacyDoc doc) {
    final words = doc.sections
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
    final lang = Localizations.localeOf(context).languageCode;
    final doc = privacyDocFor(lang);
    // Политика есть на русском и узбекском; для остальных языков — русская.
    final ruOnly = !privacyDocTranslated(lang);
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
                    child: Text(doc.title, style: PqText.display(c: pq.text)),
                  ),
                  const SizedBox(height: 4),
                  Text('${doc.edition} · ${l.profilePrivacyReadTime(_readMinutes(doc))}',
                      style: PqText.subtitle(c: pq.textMuted)),
                  for (final p in doc.intro) ...[
                    const SizedBox(height: 12),
                    Text(p,
                        style: PqText.text(15, FontWeight.w400,
                            height: 1.65, c: pq.textSecondary)),
                  ],
                ]),
                if (ruOnly) ProfileWarnBanner(l.profilePrivacyRuOnly),
                PqCard(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 4),
                      child: Text(l.profilePrivacyContents.toUpperCase(),
                          style: PqText.overline(c: pq.textMuted)),
                    ),
                    for (var i = 0; i < doc.sections.length; i++)
                      PqPressable(
                        onTap: () => _jump(i),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(minHeight: 36),
                          child: Row(children: [
                            SizedBox(
                              width: 20,
                              child: Text(doc.sections[i].number,
                                  style: PqText.text(15, FontWeight.w400, c: pq.textMuted)),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(doc.sections[i].title,
                                  style: PqText.text(15, FontWeight.w400, c: pq.accent)),
                            ),
                          ]),
                        ),
                      ),
                    const SizedBox(height: 8),
                  ]),
                ),
                for (var i = 0; i < doc.sections.length; i++)
                  Column(
                    key: _keys[i],
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Semantics(
                        header: true,
                        child: Text(
                            '${doc.sections[i].number}. ${doc.sections[i].title}',
                            style: PqText.title(c: pq.text)),
                      ),
                      for (final p in doc.sections[i].items) ...[
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
