import 'package:flutter/material.dart';
import 'package:flutter_project_structure/Utils/app_strings.dart';
import 'package:flutter_project_structure/gen/assets.gen.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';
import 'package:flutter_project_structure/theme/font_styles.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Assets.svg.icLogo.svg(),
          Center(
            child: Text(
              AppStrings.login.tr(context),
              style: rubikW700.copyWith(
                  color: AppColors.color003366, fontSize: 25),
            ),
          ),
        ]);
  }
}
