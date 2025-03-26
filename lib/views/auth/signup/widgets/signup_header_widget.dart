import 'package:flutter/material.dart';
import 'package:flutter_project_structure/Utils/utils.dart';
import 'package:flutter_project_structure/gen/assets.gen.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';
import 'package:flutter_project_structure/theme/font_styles.dart';

class SignUpHeaderWidget extends StatelessWidget {
  const SignUpHeaderWidget({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Row(children: <Widget>[
    /*  Assets.svg.icLogo.svg(height: 80, width: 80),
      20.width,*/
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sign Up'.tr(context),
            style:
                dMSansW700.copyWith(color: AppColors.colorPrimary500, fontSize: 25),
          ),
          Text(
            'Create your account'.tr(context),
            style: dMSansW400.copyWith(color: AppColors.baseColorWhite45),
          ),
        ],
      ),
    ]);
  }
}
