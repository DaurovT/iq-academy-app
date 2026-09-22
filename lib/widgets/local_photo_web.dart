import 'package:flutter/material.dart';

/// Превью только что выбранного фото — на вебе image_picker отдаёт blob-URL,
/// его читает обычный Image.network.
Widget localPhoto(String path,
        {double? width, double? height, BoxFit fit = BoxFit.cover}) =>
    Image.network(path, width: width, height: height, fit: fit);
