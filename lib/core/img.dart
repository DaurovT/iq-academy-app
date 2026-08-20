import 'api/api_client.dart';

/// Уменьшенная+сжатая версия картинки через thumbnail-прокси бэкенда (обложки бывают 2+ МБ).
String? imgThumb(String? url, {int w = 400}) {
  if (url == null || url.isEmpty) return null;
  return '$kApiBase/client/thumb?u=${Uri.encodeComponent(url)}&w=$w';
}
