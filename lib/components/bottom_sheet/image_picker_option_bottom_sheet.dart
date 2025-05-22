import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_project_structure/Utils/utils.dart';
import 'package:flutter_project_structure/components/bottom_sheet/bottom_sheet_drag_line.dart';
import 'package:flutter_project_structure/components/common_button_widget.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';
import 'package:flutter_project_structure/theme/font_styles.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';

class ImagePickerOptionBottomSheet extends StatelessWidget {
  ImagePickerOptionBottomSheet({
    required this.onTapCamera,
    required this.onTapGallery,
  });

  final VoidCallback onTapCamera;
  final VoidCallback onTapGallery;

  @override
  Widget build(final BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          BottomSheetDragLine(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                20.height,
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Select Any option'.tr(context),
                    style: dMSansW700.copyWith(
                      fontSize: 18.0,
                    ),
                  ),
                ),
                30.height,
                AppButton(
                  width: double.maxFinite,
                  type: AppButtonType.primary,
                  isLoading: false,
                  icon: null,
                  onPressed: () {
                    Navigator.pop(context);
                    onTapCamera.call();
                  },
                  title: 'Camera'.tr(context),
                  titleColor: AppColors.white,
                ),
                20.height,
                AppButton(
                  width: double.maxFinite,
                  type: AppButtonType.thirdB,
                  isLoading: false,
                  icon: null,
                  onPressed: () {
                    Navigator.pop(context);
                    onTapGallery.call();
                  },
                  title: 'Gallery'.tr(context),
                ),
                30.height
              ],
            ),
          ),
        ],
      ),
    );
  }
}
