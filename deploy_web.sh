#!/usr/bin/env bash
# Сборка и выкатка Flutter-веба (platform_app) на https://pharmview.uz/beta/
#
# Тот же код, что и мобильное приложение — веб просто ещё один таргет.
# Отдаётся с того же домена, что и /api/1.0/, поэтому CORS не нужен.
set -euo pipefail

export PATH="$PATH:/home/flutterdev/flutter/bin"
git config --global --add safe.directory '*' 2>/dev/null || true

APP=/root/platform_app
DST=/var/www/beta

cd "$APP"
flutter build web --release --base-href /beta/

# Выкатываем через временный каталог: сайт не лежит во время копирования.
rm -rf "$DST.new"
mkdir -p "$DST.new"
cp -r build/web/. "$DST.new/"
rm -rf "$DST.old"
[ -d "$DST" ] && mv "$DST" "$DST.old"
mv "$DST.new" "$DST"
rm -rf "$DST.old"
chown -R www-data:www-data "$DST" 2>/dev/null || true

echo "Готово: https://pharmview.uz/beta/"
