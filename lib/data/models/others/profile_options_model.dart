import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileOptionsModel {
  SvgPicture icon;
  String title;
  Function(BuildContext)? onTap;

  ProfileOptionsModel({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}
