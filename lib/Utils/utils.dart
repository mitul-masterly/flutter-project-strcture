import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_project_structure/Utils/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static inputBorder(color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 1.0),
      borderRadius: BorderRadius.circular(10.0),
    );
  }

  static borderBox(color, Color? borderColor, double? radius) {
    return BoxDecoration(
      color: color,
      border: Border.all(color: borderColor ?? AppColors.whiteColor),
      borderRadius: BorderRadius.circular(radius ?? 8.0),
    );
  }

  static String parseDateToFormate(String date, format) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat(format).format(dateTime);
    return formattedDate;
  }

  static showToast(message, isSuccess) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 3,
        backgroundColor:
            isSuccess ? AppColors.whiteColor : AppColors.blackColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static loaderBrier() => Opacity(
        opacity: 0.8,
        child: ModalBarrier(
            dismissible: false, color: Colors.black.withOpacity(0.4)),
      );

  static loaderWid() => Center(
        child: CupertinoActivityIndicator(
          radius: 16.0,
          color: AppColors.primaryColor,
        ),
      );
}

extension EmptySpace on num {
  SizedBox get height => SizedBox(height: toDouble());

  SizedBox get width => SizedBox(width: toDouble());
}
