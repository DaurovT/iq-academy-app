{{flutter_js}}
{{flutter_build_config}}

_flutter.loader.load({
  config: {
    // Движок отрисовки отдаём со своего домена. По умолчанию Flutter тянет
    // canvaskit.wasm с gstatic.com — если он недоступен, приложение не
    // стартует вовсе. Файлы и так лежат рядом в сборке.
    canvasKitBaseUrl: "canvaskit/",
  },
});

// Свой service worker (web/sw.js) — он делает веб-версию устанавливаемой на
// домашний экран. Штатный flutter_service_worker.js депрекейтнут и не
// регистрируется. Регистрируем после загрузки, чтобы не тормозить первый кадр.
if ("serviceWorker" in navigator) {
  window.addEventListener("load", function () {
    navigator.serviceWorker.register("sw.js").catch(function (e) {
      console.warn("SW registration failed:", e);
    });
  });
}
