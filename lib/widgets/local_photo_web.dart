import 'package:flutter/material.dart';

/// Превью только что выбранного фото — на вебе image_picker отдаёт blob-URL,
/// его читает обычный Image.network.
Widget localPhoto(String path,
        {double? width, double? height, BoxFit fit = BoxFit.cover, Widget? fallback}) =>
    Image.network(path, width: width, height: height, fit: fit,
        // Файл пропал или не читается — показываем заглушку.
        errorBuilder: fallback == null ? null : (_, __, ___) => fallback);
