import 'package:flutter/material.dart';
import 'package:flutter_project_structure/gen/assets.gen.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';
import 'package:flutter_project_structure/theme/font_styles.dart';
import 'package:flutter_project_structure/utils/utils.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Assets.svg.icLogoWhite
              .svg(key: Key('ic_splash'), height: 80, width: 80),
          20.height,
          Text(
            'Welcome Back'.tr(context),
            style: dMSansW600.copyWith(color: AppColors.white, fontSize: 25),
          ),
          Text(
            'Please sign in to continue'.tr(context),
            style: dMSansW400.copyWith(color: AppColors.white),
          ),
        ]);
  }
}
