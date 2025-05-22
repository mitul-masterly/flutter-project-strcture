import 'package:flutter/material.dart';
import 'package:flutter_project_structure/Utils/utils.dart';
import 'package:flutter_project_structure/data/models/others/profile_options_model.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';
import 'package:flutter_project_structure/theme/font_styles.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';

class ProfileCell extends StatelessWidget {
  final ProfileOptionsModel item;

  const ProfileCell({super.key, required this.item});

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: () {
        item.onTap?.call(context);
      },
      child: Container(
        padding: EdgeInsets.only(left: 18, right: 12, top: 12, bottom: 12),
        margin: EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.2),
                  blurRadius: 4,
                  offset: Offset(0, 0),
                  spreadRadius: 2)
            ]),
        child: Row(
          children: <Widget>[
            item.icon,
            20.width,
            Expanded(
              child: Text(
                item.option.title.tr(context),
                style: dMSansW500.copyWith(
                  fontSize: 16,
                  color: item.option == ProfileOption.logout
                      ? AppColors.colorError500
                      : AppColors.color4478D1,
                ),
              ),
            ),
            10.width,
            Icon(Icons.arrow_forward_ios,
                size: 16, color: AppColors.baseColorWhite85)
          ],
        ),
      ),
    );
  }
}
