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

  const AppButton(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.width,
      required this.type,
      required this.icon,
      required this.isLoading});

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
                  ? AppColors.color003366
                  : type == AppButtonType.secondary
                      ? AppColors.color990033
                      : AppColors.white),
          backgroundColor:
              WidgetStateProperty.all<Color>(type == AppButtonType.primary
                  ? AppColors.color003366
                  : type == AppButtonType.secondary
                      ? AppColors.color003366
                      : AppColors.white),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              side: BorderSide(
                  color: type == AppButtonType.thirdB
                      ? AppColors.color003366
                      : Colors.transparent),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        onPressed: onPressed,
        child: isLoading
            ? const CircularProgressIndicator()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  icon ?? 0.width,
                  SizedBox(width: icon != null ? 10 : 0),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: rubikW500.copyWith(
                        color: type == AppButtonType.primary ||
                                type == AppButtonType.secondary
                            ? AppColors.white
                            : AppColors.color003366),
                  ),
                ],
              ),
      ),
    );
  }
}
