import 'package:easy_localization/easy_localization.dart';

class Language {
  int id;
  String code;
  String icon;
  String title;

  Language(this.id, this.code, this.icon, this.title);

  //TODO: text

  static List<Language> languages() {
    return <Language> [
      Language(1, "en", "assets/flags/en.svg", "settings.english".tr()),
      Language(2, "uk", "assets/flags/ua.svg", "settings.ukrainian".tr()),
      Language(3, "ru", "assets/flags/ru.svg", "settings.russian".tr()),
    ];
  }
}