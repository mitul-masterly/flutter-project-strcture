import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_structure/data/models/response_model/device_info_model.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';
import 'package:intl/intl.dart';

class Utils {
  static OutlineInputBorder inputBorder(final color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 1.0),
      borderRadius: BorderRadius.circular(10.0),
    );
  }

  static BoxDecoration borderBox(
      {final Color? color,  final Color? borderColor, final double? radius}) {
    return BoxDecoration(
      color: color,
      border: Border.all(color: borderColor ?? AppColors.white),
      borderRadius: BorderRadius.circular(radius ?? 8.0),
    );
  }

  static String parseDateToFormat(final String date, final dynamic format) {
    final DateTime dateTime = DateTime.parse(date);
    final String formattedDate = DateFormat(format).format(dateTime);
    return formattedDate;
  }

  static Opacity loaderBrier() => Opacity(
        opacity: 0.8,
        child: ModalBarrier(
            dismissible: false, color: Colors.black.withValues(alpha: 0.4)),
      );

  static Center loaderWid() => Center(
        child: Platform.isIOS
            ? CupertinoActivityIndicator(
                radius: 16.0,
                color: AppColors.colorPrimary500,
              )
            : CircularProgressIndicator(
                color: AppColors.colorPrimary500,
              ),
      );

  static Future<DeviceInfoModel> getDeviceInfo() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    Map<String, String?> allInfo = <String, String?>{};
    if (Platform.isAndroid) {
      final AndroidDeviceInfo build = await deviceInfoPlugin.androidInfo;
      allInfo = <String, String?>{
        'user_device_id': build.device,
        'user_device_name': build.brand,
        'device_id': build.id,
        'app_name': '${build.brand} ${build.model}',
        'device_type': 'android',
        'device_type_id': 'android - ${build.id}'
      };
    } else if (Platform.isIOS) {
      final IosDeviceInfo build = await deviceInfoPlugin.iosInfo;
      allInfo = <String, String?>{
        'user_device_id': build.identifierForVendor,
        'user_device_name': build.model,
        'device_id': build.identifierForVendor,
        'app_name': build.name,
        'device_type': 'ios',
        'device_type_id': 'ios - ${build.identifierForVendor}'
      };
    }

    return DeviceInfoModel.fromJson(allInfo);
  }

  static String formatDate(final DateTime date, final String format) {
    if(date != DateTime.parse('0001-01-01T00:00:00')){
      final String newDate = DateFormat(format).format(date);
      return newDate;
    }
    else{
      return '';
    }
  }

}

extension EmptySpace on num {
  SizedBox get height => SizedBox(height: toDouble());

  SizedBox get width => SizedBox(width: toDouble());
}
