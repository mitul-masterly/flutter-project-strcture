import 'package:flutter/material.dart';
import 'package:flutter_project_structure/Utils/utils.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';
import 'package:flutter_project_structure/theme/font_styles.dart';

class ProfileCell extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.color808080)),
      child: Row(
        children: [
          Icon(Icons.privacy_tip_outlined),
          10.width,
          Text(
            'Privacy Policy',
            style: rubikW500,
          ),
        ],
      ),
    );
  }
}
