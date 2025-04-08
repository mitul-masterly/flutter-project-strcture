import 'package:flutter/material.dart';
import 'package:flutter_project_structure/gen/assets.gen.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Assets.svg.icSplashBg.svg(),
         /* Center(
            child: Text(
              AppStrings.login.tr(context),
              style: dMSansW700.copyWith(
                  color: AppColors.colorPrimary500, fontSize: 25),
            ),
          ),*/
        ]);
  }
}
