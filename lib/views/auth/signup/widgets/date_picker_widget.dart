import 'package:flutter/material.dart';
import 'package:flutter_project_structure/Utils/utils.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';
import 'package:flutter_project_structure/theme/font_styles.dart';

class DatePickerWidget extends StatelessWidget {
  final String? selectedDate;
  final Function onPressed;

  const DatePickerWidget({
    super.key,
    required this.selectedDate,
    required this.onPressed,
  });

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDatePicker(
          context: context,
          firstDate: DateTime.now().subtract(const Duration(days: 70 * 365)),
          lastDate: DateTime.now().subtract(Duration(days: 13 * 365)),
        ).then(
          (final DateTime? value) {
            if (value != null) {
              onPressed(value);
            }
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration:
            Utils.borderBox(borderColor: AppColors.baseColorWhite85, radius: 8),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          selectedDate != null
              ? Text(
                  selectedDate!.tr(context),
                  style: dMSansW500,
                )
              : Text(
                  'Select Date of Birth',
                  style: dMSansW400.copyWith(
                      fontSize: 13, color: AppColors.baseColorWhite45),
                ),
          Icon(Icons.calendar_month),
        ]),
      ),
    );
  }
}
