(function () {
  "use strict";

  var FORM_ENDPOINT = "https://api.pharmiq.uz/api/v1/web/form";
  var STORE_LINKS = {
    ios: "https://apps.apple.com/in/app/pharmiq/id6448833841",
    android: "https://play.google.com/store/apps/details?id=uz.iqacademy.platform_app"
  };

  var dict = window.I18N || {};
  var lang = pickLang();
  var reduceMotion = window.matchMedia && matchMedia("(prefers-reduced-motion: reduce)").matches;

  // Браузер может восстановить прошлую позицию прокрутки — лендинг всегда открываем сверху.
  if ("scrollRestoration" in history) history.scrollRestoration = "manual";
  window.addEventListener("load", function () {
    if (!location.hash) window.scrollTo(0, 0);
  });

  // ---------- i18n ----------
  function pickLang() {
    var fromUrl = new URLSearchParams(location.search).get("lang");
    if (fromUrl && dict[fromUrl]) return fromUrl;
    try {
      var saved = localStorage.getItem("lang");
      if (saved && dict[saved]) return saved;
    } catch (e) {}
    return "ru";
  }

  function t(key) {
    var d = dict[lang] || {};
    return key in d ? d[key] : ((dict.ru || {})[key] || "");
  }

  function applyLang(next) {
    lang = next;
    document.documentElement.lang = lang;
    try { localStorage.setItem("lang", lang); } catch (e) {}

    document.querySelectorAll("[data-i18n]").forEach(function (el) {
      var val = t(el.getAttribute("data-i18n"));
      if (val) el.textContent = val;
    });
    document.querySelectorAll("[data-i18n-attr]").forEach(function (el) {
      el.getAttribute("data-i18n-attr").split(";").forEach(function (pair) {
        var p = pair.split(":");
        var val = t(p[1]);
        if (val) el.setAttribute(p[0], val);
      });
    });
    document.querySelectorAll("[data-lang]").forEach(function (b) {
      b.setAttribute("aria-pressed", String(b.getAttribute("data-lang") === lang));
    });
    var note = document.querySelector("[data-legal-note]");
    if (note) note.hidden = !t("legal.note");
  }

  document.querySelectorAll("[data-lang]").forEach(function (b) {
    b.addEventListener("click", function () { applyLang(b.getAttribute("data-lang")); });
  });

  // ---------- Mobile menu (dialog, lpMenu) ----------
  var menu = document.getElementById("menu");
  var burger = document.querySelector(".burger");
  var lastFocus = null;

  function openMenu() {
    if (!menu) return;
    lastFocus = document.activeElement;
    menu.hidden = false;
    document.body.classList.add("menu-open");
    if (burger) burger.setAttribute("aria-expanded", "true");
    var close = menu.querySelector(".menu__close");
    if (close) close.focus();
  }

  function closeMenu(restoreFocus) {
    if (!menu || menu.hidden) return;
    menu.hidden = true;
    document.body.classList.remove("menu-open");
    if (burger) burger.setAttribute("aria-expanded", "false");
    if (restoreFocus !== false && lastFocus && lastFocus.focus) lastFocus.focus();
  }

  if (menu && burger) {
    burger.addEventListener("click", openMenu);
    menu.querySelector(".menu__close").addEventListener("click", function () { closeMenu(); });
    // Пункт меню: закрываем меню, прокрутку делает общий обработчик якорей.
    menu.addEventListener("click", function (e) {
      if (e.target.closest("a")) closeMenu(false);
    });
    document.addEventListener("keydown", function (e) {
      if (menu.hidden) return;
      if (e.key === "Escape") { closeMenu(); return; }
      if (e.key !== "Tab") return;
      // простая ловушка фокуса внутри диалога
      var items = Array.prototype.filter.call(
        menu.querySelectorAll("a[href], button"),
        function (el) { return el.offsetParent !== null; }
      );
      if (!items.length) return;
      var first = items[0], last = items[items.length - 1];
      if (e.shiftKey && document.activeElement === first) { e.preventDefault(); last.focus(); }
      else if (!e.shiftKey && document.activeElement === last) { e.preventDefault(); first.focus(); }
    });
    // Меню существует только на узких экранах: при расширении окна — закрываем.
    var wide = matchMedia("(min-width: 1181px)");
    var onWide = function () { if (wide.matches) closeMenu(false); };
    if (wide.addEventListener) wide.addEventListener("change", onWide);
    else if (wide.addListener) wide.addListener(onWide);
  }

  // Ссылки-якоря прокручивают страницу, но не оставляют #раздел в адресе:
  // иначе при следующем открытии браузер сразу уводит на этот раздел.
  document.querySelectorAll('a[href^="#"]').forEach(function (a) {
    a.addEventListener("click", function (e) {
      var id = a.getAttribute("href").slice(1);
      var target = id ? document.getElementById(id) : null;
      if (!target) return;
      e.preventDefault();
      target.scrollIntoView({ behavior: reduceMotion ? "auto" : "smooth", block: "start" });
      if (id !== "top") {
        target.setAttribute("tabindex", "-1");
        target.focus({ preventScroll: true });
      }
      history.replaceState(null, "", location.pathname + location.search);
    });
  });

  // ---------- Header: фон появляется после начала прокрутки ----------
  var header = document.querySelector(".header");
  function onScroll() { if (header) header.classList.toggle("is-scrolled", window.scrollY > 8); }
  window.addEventListener("scroll", onScroll, { passive: true });
  onScroll();

  // ---------- Login / register: on phones open the app store (as on the old site) ----------
  document.querySelectorAll("[data-auth]").forEach(function (a) {
    a.addEventListener("click", function (e) {
      var ua = navigator.userAgent || "";
      var target = /Android/i.test(ua) ? STORE_LINKS.android : /iPhone|iPad|iPod/i.test(ua) ? STORE_LINKS.ios : null;
      if (target) { e.preventDefault(); location.href = target; }
    });
  });

  // ---------- Partners tabs (видны только в мобильной раскладке) ----------
  var tabs = Array.prototype.slice.call(document.querySelectorAll('.tabs [role="tab"]'));
  function selectTab(tab) {
    tabs.forEach(function (tb) {
      var on = tb === tab;
      tb.setAttribute("aria-selected", String(on));
      tb.tabIndex = on ? 0 : -1;
      var panel = document.getElementById(tb.getAttribute("aria-controls"));
      if (panel) panel.classList.toggle("is-active", on);
    });
  }
  tabs.forEach(function (tab, i) {
    tab.addEventListener("click", function () { selectTab(tab); });
    tab.addEventListener("keydown", function (e) {
      if (e.key !== "ArrowRight" && e.key !== "ArrowLeft") return;
      var next = tabs[(i + (e.key === "ArrowRight" ? 1 : tabs.length - 1)) % tabs.length];
      selectTab(next);
      next.focus();
    });
  });

  // ---------- Benefits carousel dots (мобильная раскладка) ----------
  var track = document.querySelector(".benefits");
  var dots = document.querySelectorAll(".dots span");
  if (track && dots.length) {
    var ticking = false;
    var updateDots = function () {
      ticking = false;
      var cards = track.querySelectorAll(".benefit");
      if (!cards.length) return;
      var step = cards.length > 1 ? cards[1].offsetLeft - cards[0].offsetLeft : track.clientWidth;
      var max = track.scrollWidth - track.clientWidth;
      var idx = track.scrollLeft >= max - 2 ? cards.length - 1 : Math.round(track.scrollLeft / Math.max(step, 1));
      dots.forEach(function (d, i) { d.classList.toggle("is-on", i === idx); });
    };
    track.addEventListener("scroll", function () {
      if (!ticking) { ticking = true; requestAnimationFrame(updateDots); }
    }, { passive: true });
  }

  // ---------- Video ----------
  var video = document.getElementById("promo");
  var playBtn = document.querySelector(".video__play");
  if (video && playBtn) {
    playBtn.addEventListener("click", function () {
      video.controls = true;
      video.play();
      var box = video.closest(".video");
      if (box) box.classList.add("is-playing");
    });
  }

  // ---------- Phone mask + lead form ----------
  var form = document.getElementById("lead-form");
  var phone = document.getElementById("phone");
  var msg = form && form.querySelector(".form__msg");

  // The "+998" prefix lives next to the field, so the input holds 9 local digits.
  function formatPhone(digits) {
    var d = digits.replace(/^998/, "").slice(0, 9);
    var out = d.slice(0, 2);
    if (d.length > 2) out += " " + d.slice(2, 5);
    if (d.length > 5) out += " " + d.slice(5, 7);
    if (d.length > 7) out += " " + d.slice(7, 9);
    return out;
  }

  if (phone) {
    phone.addEventListener("input", function () {
      phone.value = formatPhone(phone.value.replace(/\D/g, ""));
    });
  }

  if (form && phone) {
    form.addEventListener("submit", function (e) {
      e.preventDefault();
      var digits = "998" + phone.value.replace(/\D/g, "").replace(/^998/, "");
      if (digits.length !== 12) {
        setMsg(t("contact.invalid"), "error");
        phone.focus();
        return;
      }
      var btn = form.querySelector("button[type=submit]");
      btn.disabled = true;
      setBtnLabel(btn, t("contact.sending"));

      var data = new FormData();
      data.append("pageID", "main");
      data.append("contactNumber", digits);

      fetch(FORM_ENDPOINT, { method: "POST", body: data })
        .then(function (r) {
          if (!r.ok) throw new Error("HTTP " + r.status);
          setMsg(t("contact.ok"), "ok");
          phone.value = "";
        })
        .catch(function () { setMsg(t("contact.err"), "error"); })
        .then(function () {
          btn.disabled = false;
          setBtnLabel(btn, t("contact.button"));
        });
    });
  }

  // The submit button holds a label span plus an arrow icon.
  function setBtnLabel(btn, text) {
    var label = btn.querySelector("span") || btn;
    label.textContent = text;
  }

  function setMsg(text, kind) {
    if (!msg) return;
    msg.textContent = text;
    msg.className = "form__msg form__msg--" + kind;
  }

  // ---------- Появление при прокрутке (lpUp, задержки — через --d) ----------
  var reveals = document.querySelectorAll(".reveal");
  if ("IntersectionObserver" in window && !reduceMotion) {
    var io = new IntersectionObserver(function (entries) {
      entries.forEach(function (en) {
        if (en.isIntersecting) { en.target.classList.add("is-in"); io.unobserve(en.target); }
      });
    }, { rootMargin: "0px 0px -8% 0px" });
    reveals.forEach(function (el) { io.observe(el); });
  } else {
    reveals.forEach(function (el) { el.classList.add("is-in"); });
  }

  document.querySelectorAll("[data-year]").forEach(function (el) { el.textContent = new Date().getFullYear(); });

  applyLang(lang);
})();
