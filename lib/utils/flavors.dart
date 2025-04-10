import 'package:flutter_project_structure/utils/app_enums.dart';

class FlavorConfig {
  final Flavor flavor;
  static late FlavorConfig instance;

  FlavorConfig({required this.flavor}) {
    instance = this;
  }

  static bool get isStaging => instance.flavor == Flavor.staging;
  static bool get isProd => instance.flavor == Flavor.prod;

  static String get title {
    switch (instance.flavor) {
      case Flavor.staging:
        return 'Flutter Base Staging';
      case Flavor.prod:
        return 'Flutter Base';
    }
  }
}