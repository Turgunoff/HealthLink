# HealthLink: Sog'lig'ingizga Tezkor Yo'l

[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/YOUR_USERNAME/YOUR_REPOSITORY/blob/master/LICENSE)
[![GitHub issues](https://img.shields.io/github/issues/YOUR_USERNAME/YOUR_REPOSITORY.svg)](https://github.com/YOUR_USERNAME/YOUR_REPOSITORY/issues)

"HealthLink" - bu bemorlarga shifokorlar bilan bog'lanishni, qabulga yozilishni va tibbiy ma'lumotlarini boshqarishni osonlashtiruvchi innovatsion mobil ilova. Bu ilova orqali siz o'zingizga mos shifokorni topishingiz, elektron tibbiy karta yaratishingiz, qabul vaqtini belgilashingiz va masofadan turib shifokor bilan maslahatlashishingiz mumkin.

## Texnologiyalar:

- **Flutter:** Zamonaviy va ko'p platformali foydalanuvchi interfeyslarini yaratish uchun.
- **Dart:** Flutter uchun kuchli va tezkor dasturlash tili.
- **Firebase:** Real vaqt rejimida ma'lumotlar bazasi, autentifikatsiya va xabarlarni boshqarish uchun.
- **BLoC (Business Logic Component):** Ilova mantig'ini tashkil qilish va boshqarish uchun.
- **Yandex Map:** Shifokorlar joylashuvini ko'rsatish va navigatsiya uchun.
- **REST API:** Backend xizmatlari bilan integratsiya qilish uchun.
- **Hive:** Mahalliy ma'lumotlarni saqlash uchun yuqori unumdor va oson ishlatiladigan NoSQL ma'lumotlar bazasi.

## Funksiyalar:

- **Shifokorni topish:** Ism, mutaxassislik, joylashuv va reyting bo'yicha shifokorlarni qidirish.
- **Elektron tibbiy karta:** Bemorlarning tibbiy ma'lumotlarini (tashxislar, dori-darmonlar, allergiyalar va boshqalar) saqlash.
- **Qabulga yozilish:** Mavjud bo'sh vaqtlarni ko'rib, shifokor qabuliga yozilish.
- **Masofaviy maslahat:** Shifokor bilan audio yoki video qo'ng'iroq orqali maslahatlashish.
- **Xabarlashish:** Shifokorlar va bemorlar o'rtasida xabar almashish.
- **Eslatmalar:** Qabul vaqtini, dori ichish vaqtini va boshqa muhim ma'lumotlarni eslatish.

**Project struktura:**
lib/  
├── app/  
│   ├── app.dart  
│   ├── bloc_observer.dart  
│   ├── config/  
│   │   ├── constants.dart  
│   │   ├── theme.dart  
│   │   ├── routes.dart  
│   │   ├── localization.dart  
├── core/  
│   ├── data/  
│   │   ├── datasources/  
│   │   │   ├── remote/  
│   │   │   │   ├── api_service.dart  
│   │   │   ├── local/  
│   │   │   │   ├── hive_service.dart  
│   │   ├── models/  
│   │   │   ├── user.dart  
│   │   │   ├── doctor.dart  
│   │   │   ├── hospital.dart  
│   │   │   ├── appointment.dart  
│   │   ├── repositories/  
│   │   │   ├── user_repository_impl.dart  
│   │   │   ├── doctor_repository_impl.dart  
│   │   │   ├── hospital_repository_impl.dart  
│   │   │   ├── appointment_repository_impl.dart  
│   ├── domain/  
│   │   ├── entities/  
│   │   │   ├── user.dart  
│   │   │   ├── doctor.dart  
│   │   │   ├── hospital.dart  
│   │   │   ├── appointment.dart  
│   │   ├── repositories/  
│   │   │   ├── user_repository.dart  
│   │   │   ├── doctor_repository.dart  
│   │   │   ├── hospital_repository.dart  
│   │   │   ├── appointment_repository.dart  
│   │   ├── usecases/  
│   │   │   ├── get_user.dart  
│   │   │   ├── get_doctors.dart  
│   │   │   ├── get_hospitals.dart  
│   │   │   ├── book_appointment.dart  
│   ├── utils/  
│   │   ├── location_service.dart  
│   │   ├── network_info.dart  
├── features/  
│   ├── home/  
│   │   ├── presentation/  
│   │   │   ├── home_screen.dart  
│   │   │   ├── widgets/  
│   │   │   │   ├── doctor_card.dart  
│   │   │   │   ├── hospital_card.dart  
│   │   │   │   ├── appointment_card.dart  
│   │   ├── logic/  
│   │   │   ├── home_bloc.dart  
│   │   │   ├── home_event.dart  
│   │   │   ├── home_state.dart  
│   ├── search/  
│   │   ├── presentation/  
│   │   │   ├── search_screen.dart  
│   │   │   ├── widgets/  
│   │   │   │   ├── search_bar.dart  
│   │   │   │   ├── search_results.dart  
│   │   ├── logic/  
│   │   │   ├── search_bloc.dart  
│   │   │   ├── search_event.dart  
│   │   │   ├── search_state.dart  
│   ├── bookings/  
│   ├── chat/  
│   ├── profile/  
├── main.dart  
