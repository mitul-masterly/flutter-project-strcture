import 'package:flutter/material.dart';
import 'package:flutter_project_structure/Components/lable_widget.dart';
import 'package:flutter_project_structure/Utils/app_colors.dart';
import 'package:flutter_project_structure/Utils/constants.dart';
import 'package:flutter_project_structure/Utils/utils.dart';

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
  Widget build(BuildContext context) {
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
                  ? AppColors.primaryColor
                  : type == AppButtonType.secondary
                      ? AppColors.secondaryColor
                      : AppColors.whiteColor),
          backgroundColor:
              WidgetStateProperty.all<Color>(type == AppButtonType.primary
                  ? AppColors.primaryColor
                  : type == AppButtonType.secondary
                      ? AppColors.primaryColor
                      : AppColors.whiteColor),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              side: BorderSide(
                  color: type == AppButtonType.thirdB
                      ? AppColors.primaryColor
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
                children: [
                  icon ?? 0.width,
                  SizedBox(width: icon != null ? 10 : 0),
                  LabelWidget(
                    title: title,
                    size: 16.0,
                    align: TextAlign.center,
                    weight: FontWeight.w500,
                    color: type == AppButtonType.primary ||
                            type == AppButtonType.secondary
                        ? AppColors.whiteColor
                        : AppColors.primaryColor,
                  ),
                ],
              ),
      ),
    );
  }
}
