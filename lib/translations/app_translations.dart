import 'package:flutter/material.dart';
import 'package:flutter_project_structure/translations/ar_IN/ar_in_translations.dart';
import 'package:flutter_project_structure/translations/en_US/en_us_translations.dart';
import 'package:flutter_project_structure/translations/gu_IN/gu_in_translations.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';

Map<String, Map<String, String>> translations = <String, Map<String, String>>{
  SupportedLangCode.english.langCode: enUs,
  SupportedLangCode.arabic.langCode: arIN,
  SupportedLangCode.gujarati.langCode: guIN
  ,
};

class AppTranslation {
  static Locale currentLocale = Locale(SupportedLangCode.english.langCode,
      SupportedLangCode.english.countryCode);

  static Map<String, Map<String, String>> get keys => translations;

  // static String translate(final String key, final Locale locale) {
  //   return translations[locale.languageCode]?[key] ?? key;
  // }

  static String translate(
    final String key,
    final Locale locale, {
    final Map<String, String>? namedArgs,
    final List<String>? args,
  }) {
    final Map<String, String>? translationsForLocale =
        translations[locale.languageCode];
    String? template = translationsForLocale?[key];

    if (template == null) return key; // Return key if translation is missing

    // Handle named arguments like {name}, {place}
    if (namedArgs != null) {
      namedArgs.forEach((final String placeholder, final String value) {
        template = template!.replaceAll('{$placeholder}', value);
      });
    }

    // Handle positional arguments like {0}, {1}
    if (args != null) {
      for (int i = 0; i < args.length; i++) {
        template = template!.replaceAll('{$i}', args[i]);
      }
    }

    return template!;
  }

  static void changeLocale(final Locale language) {
    currentLocale = language;
  }
}
