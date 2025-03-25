import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_structure/Utils/utils.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';
import 'package:flutter_project_structure/theme/font_styles.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';

class AppButton extends StatelessWidget {
  final String title;
  final double width;
  final AppButtonType type;
  final VoidCallback? onPressed;
  final Widget? icon;
  final bool isLoading;
  final Color? loadingIndicatorColor;
  final Color? bgColor;
  final Color? titleColor;

  const AppButton(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.width,
      required this.type,
      required this.icon,
      required this.isLoading,
      this.loadingIndicatorColor,
      this.bgColor,
      this.titleColor
      });

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      width: width,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.all(0)),
          foregroundColor:
              WidgetStateProperty.all<Color>(type == AppButtonType.primary
                  ?AppColors.colorPrimary500
                  : type == AppButtonType.secondary
                      ? AppColors.colorError500
                      : AppColors.white),
          backgroundColor:
              WidgetStateProperty.all<Color>(type == AppButtonType.primary
                  ? bgColor ??  AppColors.colorPrimary500
                  : type == AppButtonType.secondary
                      ? AppColors.colorPrimary500
                      : AppColors.white),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              side: BorderSide(
                  color: type == AppButtonType.thirdB
                      ? AppColors.colorPrimary500
                      : Colors.transparent),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        onPressed: onPressed,
        child: isLoading
            ? Platform.isIOS
                ? CupertinoActivityIndicator(
                    color: loadingIndicatorColor ?? AppColors.white,
                  )
                : CircularProgressIndicator(
                    color: loadingIndicatorColor ?? AppColors.white,
                  )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  icon ?? 0.width,
                  SizedBox(width: icon != null ? 10 : 0),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: dMSansW400.copyWith(
                        color: type == AppButtonType.primary ||
                                type == AppButtonType.secondary
                            ? titleColor ??  AppColors.white
                            : titleColor ??  AppColors.colorPrimary500),
                  ),
                ],
              ),
      ),
    );
  }
}
