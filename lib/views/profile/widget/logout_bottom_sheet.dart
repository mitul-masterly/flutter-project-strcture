import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_project_structure/Components/common_button_widget.dart';
import 'package:flutter_project_structure/Utils/utils.dart';
import 'package:flutter_project_structure/components/bottom_sheet/bottom_sheet_drag_line.dart';
import 'package:flutter_project_structure/gen/assets.gen.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';
import 'package:flutter_project_structure/theme/font_styles.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';

class LogoutBottomSheet extends StatelessWidget {
  const LogoutBottomSheet({super.key, required this.onTapLogout});

  final VoidCallback onTapLogout;

  @override
  Widget build(final BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          BottomSheetDragLine(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                32.height,
                Container(
                  height: 72,
                  width: 72,
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: AppColors.color808080.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(36),
                  ),
                  child: Assets.svg.icLogout.svg(),
                ),
                20.height,
                Text(
                  'Logout'.tr(context),
                  style: rubikW700.copyWith(fontSize: 22.0),
                ),
                8.height,
                Text(
                  textAlign: TextAlign.center,
                  'Are you sure you want to Logout this\naccount?'.tr(context),
                  style: rubikW500.copyWith(color: AppColors.black),
                ),
                24.height,
                AppButton(
                  title: 'Yes, Logout'.tr(context),
                  onPressed: () {
                    Navigator.pop(context);
                    onTapLogout.call();
                  },
                  width: double.maxFinite,
                  type: AppButtonType.primary,
                  isLoading: false,
                  icon: null,
                ),
                10.height,
                AppButton(
                  title: 'Cancel'.tr(context),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  width: double.maxFinite,
                  type: AppButtonType.thirdB,
                  isLoading: false,
                  icon: null,
                ),
                (MediaQuery.of(context).padding.bottom > 0
                        ? MediaQuery.of(context).padding.bottom
                        : 16)
                    .height,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
