import 'package:go_router/go_router.dart';

/// Целочисленный параметр пути (`/app/checks/:id`).
int intParam(GoRouterState s, String key) =>
    int.tryParse(s.pathParameters[key] ?? '') ?? 0;
