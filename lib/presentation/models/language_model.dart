import 'package:easy_localization/easy_localization.dart';

class Language {
  int id;
  String code;
  String icon;
  String title;

  Language(this.id, this.code, this.icon, this.title);

  static List<Language> languages() {
    return <Language> [
      Language(0, "en", "assets/flags/en.svg", "settings.english".tr()), //TODO: not updating names of languages
      Language(1, "uk", "assets/flags/ua.svg", "settings.ukrainian".tr()),
    ];
  }
}