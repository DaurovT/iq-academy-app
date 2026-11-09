import 'dart:io';
import 'package:flutter/material.dart';

/// Превью только что выбранного фото — на мобильных это файл на диске.
Widget localPhoto(String path,
        {double? width, double? height, BoxFit fit = BoxFit.cover, Widget? fallback}) =>
    Image.file(File(path), width: width, height: height, fit: fit,
        // Файл пропал или не читается — показываем заглушку.
        errorBuilder: fallback == null ? null : (_, __, ___) => fallback);
