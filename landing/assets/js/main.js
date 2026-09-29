(function () {
  "use strict";

  var FORM_ENDPOINT = "https://api.pharmiq.uz/api/v1/web/form";
  var STORE_LINKS = {
    ios: "https://apps.apple.com/in/app/pharmiq/id6448833841",
    android: "https://play.google.com/store/apps/details?id=uz.iqacademy.platform_app"
  };
  var FAQ_COUNT = 10;

  var dict = window.I18N || {};
  var lang = pickLang();

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
    return key in d ? d[key] : (dict.ru[key] || "");
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

    renderFaq();
  }

  document.querySelectorAll("[data-lang]").forEach(function (b) {
    b.addEventListener("click", function () { applyLang(b.getAttribute("data-lang")); });
  });

  // ---------- FAQ ----------
  function renderFaq() {
    var list = document.getElementById("faq-list");
    if (!list) return;
    var open = list.querySelector("details[open]");
    var openIdx = open ? open.getAttribute("data-i") : null;
    var html = "";
    for (var i = 1; i <= FAQ_COUNT; i++) {
      html +=
        '<details class="faq__item" data-i="' + i + '"' + (String(i) === openIdx ? " open" : "") + ">" +
        "<summary>" + esc(t("faq.q" + i)) + '<span class="faq__icon" aria-hidden="true"></span></summary>' +
        "<p>" + esc(t("faq.a" + i)) + "</p></details>";
    }
    list.innerHTML = html;
  }

  function esc(s) {
    return String(s).replace(/[&<>"]/g, function (c) {
      return { "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;" }[c];
    });
  }

  // Ссылки-якоря прокручивают страницу, но не оставляют #раздел в адресе:
  // иначе при следующем открытии браузер сразу уводит на этот раздел.
  document.querySelectorAll('a[href^="#"]').forEach(function (a) {
    a.addEventListener("click", function (e) {
      var id = a.getAttribute("href").slice(1);
      var target = id ? document.getElementById(id) : null;
      if (!target) return;
      e.preventDefault();
      target.scrollIntoView({ behavior: matchMedia("(prefers-reduced-motion: reduce)").matches ? "auto" : "smooth", block: "start" });
      if (id !== "top") target.setAttribute("tabindex", "-1"), target.focus({ preventScroll: true });
      history.replaceState(null, "", location.pathname + location.search);
    });
  });

  // ---------- Mobile menu ----------
  var burger = document.querySelector(".burger");
  var nav = document.getElementById("nav");
  if (burger && nav) {
    burger.addEventListener("click", function () {
      var isOpen = burger.getAttribute("aria-expanded") === "true";
      burger.setAttribute("aria-expanded", String(!isOpen));
      document.body.classList.toggle("menu-open", !isOpen);
    });
    nav.addEventListener("click", function (e) {
      if (e.target.closest("a")) {
        burger.setAttribute("aria-expanded", "false");
        document.body.classList.remove("menu-open");
      }
    });
  }

  // ---------- Header shadow ----------
  var header = document.querySelector(".header");
  function onScroll() { header && header.classList.toggle("is-scrolled", window.scrollY > 8); }
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

  // ---------- Tabs ----------
  var tabs = Array.prototype.slice.call(document.querySelectorAll('[role="tab"]'));
  function selectTab(tab) {
    tabs.forEach(function (tb) {
      var on = tb === tab;
      tb.setAttribute("aria-selected", String(on));
      tb.tabIndex = on ? 0 : -1;
      document.getElementById(tb.getAttribute("aria-controls")).hidden = !on;
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

  if (form) {
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

  // ---------- Reveal on scroll ----------
  var reveals = document.querySelectorAll(".reveal");
  if ("IntersectionObserver" in window && !matchMedia("(prefers-reduced-motion: reduce)").matches) {
    var io = new IntersectionObserver(function (entries) {
      entries.forEach(function (en) {
        if (en.isIntersecting) { en.target.classList.add("is-visible"); io.unobserve(en.target); }
      });
    }, { rootMargin: "0px 0px -8% 0px" });
    reveals.forEach(function (el) { io.observe(el); });
  } else {
    reveals.forEach(function (el) { el.classList.add("is-visible"); });
  }

  document.querySelectorAll("[data-year]").forEach(function (el) { el.textContent = new Date().getFullYear(); });

  applyLang(lang);
})();
