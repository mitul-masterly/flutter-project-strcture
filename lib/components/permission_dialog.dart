import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_project_structure/Components/common_button_widget.dart';
import 'package:flutter_project_structure/Utils/utils.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';
import 'package:flutter_project_structure/theme/font_styles.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionDialog extends StatelessWidget {
  const PermissionDialog({super.key, required this.message});

  final String message;

  @override
  Widget build(final BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
      child: AlertDialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(16.0), // Set the corner radius here
        ),
        title: Text(
          textAlign: TextAlign.start,
          'Permission Required'.tr(context),
          style: dMSansW700.copyWith(fontSize: 18),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              message,
              style: dMSansW400.copyWith(fontSize: 16),
            ),
            50.height,
            Row(
              children: <Widget>[
                Expanded(
                  child: AppButton(
                    width: double.maxFinite,
                    type: AppButtonType.primary,
                    isLoading: false,
                    icon: null,
                    title: 'Cancel'.tr(context),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    titleColor: AppColors.white,
                  ),
                ),
                17.width,
                Expanded(
                  child: AppButton(
                    width: double.maxFinite,
                    type: AppButtonType.thirdB,
                    isLoading: false,
                    icon: null,
                    onPressed: () async {
                      Navigator.pop(context);
                      await openAppSettings();
                    },
                    title: 'Settings'.tr(context),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
