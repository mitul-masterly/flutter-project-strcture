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
    return BlocProvider(
      create: (final BuildContext context) => SocialMediaBloc(),
      child: BlocBuilder<SocialMediaBloc, SocialMediaState>(
        builder: (final BuildContext context, final SocialMediaState state) {
          final SocialMediaBloc bloc = context.read<SocialMediaBloc>();
          return Column(
            children: [
              AppButton(
                bgColor: AppColors.white,
                title: 'Sign up with Google'.tr(buildContext),
                width: double.maxFinite,
                isLoading: state.status == CommonScreenState.loading,
                icon: Assets.svg.icGoogle.svg(),
                titleColor: AppColors.black,
                onPressed: () async {
                  //   bloc.add(SignUpWithGoogleEvent(context: context));
                },
                type: AppButtonType.primary,
              ),
              10.height,
              AppButton(
                bgColor: AppColors.white,
                title: 'Sign up with Apple'.tr(buildContext),
                width: double.maxFinite,
                isLoading: state.status == CommonScreenState.loading,
                icon: Assets.svg.icApple.svg(),
                titleColor: AppColors.black,
                onPressed: () {},
                type: AppButtonType.primary,
              ),
              10.height,
              AppButton(
                bgColor: AppColors.white,
                title: 'Sign up with Facebook'.tr(buildContext),
                width: double.maxFinite,
                isLoading: state.status == CommonScreenState.loading,
                icon: Assets.svg.icFacebook.svg(),
                titleColor: AppColors.black,
                onPressed: () {},
                type: AppButtonType.primary,
              ),
              10.height,
            ],
          );
        },
      ),
    );
  }
}
