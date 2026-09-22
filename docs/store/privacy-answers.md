# Ответы на анкеты о данных

Совпадает с `ios/Runner/PrivacyInfo.xcprivacy` и страницей https://pharmview.uz/privacy. Если меняете одно — меняйте всё.

## Apple — App Privacy («Data Used to Track You» — НЕТ, трекинга нет)
Все типы ниже: **Linked to the user = Yes**, **Used for tracking = No**, **Purpose = App Functionality**.

| Категория Apple | Что именно |
|---|---|
| Contact Info → Name | ФИО |
| Contact Info → Phone Number | телефон (вход, SMS) |
| Contact Info → Email Address | email от Google/Apple при входе через них |
| Contact Info → Other User Contact Info | город, аптека/клиника |
| Health & Fitness → Health | на фото бланков могут быть данные пациентов |
| User Content → Photos or Videos | фото чеков и бланков |
| User Content → Other User Content | переписка с поддержкой, ответы на опросы |
| Identifiers → User ID | ID аккаунта, Telegram ID, ID Google/Apple |
| Identifiers → Device ID | токен push-уведомлений |
| Usage Data → Product Interaction | прохождение курсов, тестов, квестов |

## Google Play — Data safety
- Собираются ли данные: **Да**. Передаются третьим лицам: **Да** — компаниям-партнёрам программы (активность участника в объёме программы).
- Шифрование при передаче: **Да**. Удаление по запросу: **Да** → https://pharmview.uz/delete-account
- Все типы ниже: собирается, обязательный, цель — **App functionality** (+ **Account management** для имени/телефона/email/ID).

| Раздел Google | Тип | Передаётся партнёрам |
|---|---|---|
| Personal info | Name, Email address, User IDs, Phone number, Other info (город, аптека/клиника, специальность) | Имя, аптека, город — медпреду компании |
| Health and fitness | Health info (данные пациентов на бланках) | Нет |
| Photos and videos | Photos | Нет |
| Messages | Other in-app messages (поддержка) | Нет |
| App activity | App interactions, Other user-generated content (опросы) | Сводные показатели — компаниям-партнёрам |
| Device or other IDs | Device or other IDs (push-токен) | Нет |

## Возрастной рейтинг
**Apple (анкета):** Medical or Treatment-Focused Content — *Infrequent/Mild*; Contests — *Frequent* («Супер Сапёр»);
Simulated Gambling — *None* (ставок на деньги нет); остальное — None. Ожидаемый рейтинг: 12+ или 17+ — решает Apple.
**Google (IARC):** категория «Образование»; «Азартные игры/розыгрыши» — указать наличие акции с призами за баллы,
реальных денег нет, покупок нет. Целевая аудитория: 18+ (профессионалы).
