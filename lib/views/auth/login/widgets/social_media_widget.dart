import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/Components/common_button_widget.dart';
import 'package:flutter_project_structure/Utils/utils.dart';
import 'package:flutter_project_structure/bloc/auth/social_media/social_media_bloc.dart';
import 'package:flutter_project_structure/gen/assets.gen.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({super.key});

  @override
  Widget build(final BuildContext buildContext) {
    return BlocProvider<SocialMediaBloc>(
      create: (final BuildContext context) => SocialMediaBloc(),
      child: BlocBuilder<SocialMediaBloc, SocialMediaState>(
        builder: (final BuildContext context, final SocialMediaState state) {
          final SocialMediaBloc bloc = context.read<SocialMediaBloc>();
          return Column(
            children: <Widget>[
              AppButton(
                bgColor: AppColors.white,
                title: 'Sign up with Google'.tr(buildContext),
                width: double.maxFinite,
                isLoading: state.status == CommonScreenState.initial &&
                    state.socialMediaStatus == SocialMediaLoginState.google,
                icon: Assets.svg.icGoogle.svg(),
                titleColor: AppColors.black,
                loadingIndicatorColor: AppColors.colorPrimary500,
                onPressed: () async {
                  bloc.add(SignUpWithGoogleEvent(context: context));
                },
                type: AppButtonType.primary,
              ),
              10.height,
              Platform.isIOS
                  ? AppButton(
                      bgColor: AppColors.white,
                      title: 'Sign up with Apple'.tr(buildContext),
                      width: double.maxFinite,
                      isLoading: state.status == CommonScreenState.initial &&
                          state.socialMediaStatus ==
                              SocialMediaLoginState.apple,
                      icon: Assets.svg.icApple.svg(),
                      titleColor: AppColors.black,
                      loadingIndicatorColor: AppColors.colorPrimary500,
                      onPressed: () {
                        bloc.add(SignUpWithAppleEvent(context: context));
                      },
                      type: AppButtonType.primary,
                    )
                  : SizedBox(),
              Platform.isIOS ? 10.height : SizedBox(),
              /*   AppButton(
                bgColor: AppColors.white,
                title: 'Sign up with Facebook'.tr(buildContext),
                width: double.maxFinite,
                isLoading: state.status == CommonScreenState.initial &&
                    state.socialMediaStatus == SocialMediaLoginState.facebook,
                icon: Assets.svg.icFacebook.svg(),
                titleColor: AppColors.black,
                loadingIndicatorColor: AppColors.colorPrimary500,
                onPressed: () {
                  bloc.add(SignUpWithFacebookEvent(context: context));
                },
                type: AppButtonType.primary,
              ),
              10.height,*/
            ],
          );
        },
      ),
    );
  }
}
