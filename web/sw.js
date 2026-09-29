// Минимальный service worker. Нужен, чтобы веб-версию можно было установить
// на домашний экран как приложение: собственный SW Flutter депрекейтнут и с
// версии 3.44 больше не регистрируется, а без SW браузер не предлагает установку.
//
// Стратегия — network-first с откатом в кэш: онлайн пользователь всегда видит
// свежую сборку (устаревший бандл после выкатки страшнее оффлайна), а при
// пропаже сети открывается последняя закэшированная оболочка.
const CACHE = 'iqa-shell-v1';

self.addEventListener('install', () => self.skipWaiting());

self.addEventListener('activate', (event) => {
  event.waitUntil((async () => {
    // чистим кэши прошлых версий, чтобы не копить мегабайты
    for (const k of await caches.keys()) {
      if (k !== CACHE) await caches.delete(k);
    }
    await self.clients.claim();
  })());
});

self.addEventListener('fetch', (event) => {
  const req = event.request;
  if (req.method !== 'GET') return;

  const url = new URL(req.url);
  // чужие домены и API кэшировать нельзя: ответы персональные и меняются
  if (url.origin !== self.location.origin) return;
  if (url.pathname.startsWith('/api/')) return;

  event.respondWith((async () => {
    try {
      const res = await fetch(req);
      if (res && res.ok) {
        const cache = await caches.open(CACHE);
        cache.put(req, res.clone());
      }
      return res;
    } catch (e) {
      const hit = await caches.match(req);
      if (hit) return hit;
      // навигация без сети — отдаём оболочку приложения
      if (req.mode === 'navigate') {
        const shell = await caches.match('index.html');
        if (shell) return shell;
      }
      throw e;
    }
  })());
});
