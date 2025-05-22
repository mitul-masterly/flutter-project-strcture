import 'package:flutter/material.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';

class ProfileOptionsModel {
  Icon icon;
  ProfileOption option;
  Function(BuildContext)? onTap;

  ProfileOptionsModel({
    required this.icon,
    required this.option,
    required this.onTap,
  });
}
