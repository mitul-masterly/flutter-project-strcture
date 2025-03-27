import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/bloc/my_app/localisation_bloc.dart';
import 'package:flutter_project_structure/bloc/user/profile_bloc.dart';
import 'package:flutter_project_structure/components/common_app_bar.dart';
import 'package:flutter_project_structure/data/repository/auth_repo.dart';
import 'package:flutter_project_structure/data/repository/user_repo.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';
import 'package:flutter_project_structure/theme/status_bar_config.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:flutter_project_structure/utils/utils.dart';
import 'package:flutter_project_structure/views/profile/widget/logout_bottom_sheet.dart';
import 'package:flutter_project_structure/views/profile/widget/profile_header_widget.dart';
import 'package:flutter_project_structure/views/profile/widget/profile_options_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen();

  @override
  Widget build(final BuildContext buildContext) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: darkStatusBarTransparent,
      child: BlocBuilder<LocalisationBloc, LocalisationState>(builder:
          (final BuildContext context,
              final LocalisationState localisationState) {
        return BlocProvider<ProfileBloc>(
          create: (final BuildContext context) => ProfileBloc(
              userRepo: context.read<UserRepo>(), context.read<AuthRepo>())
            ..add(OnGetUserProfile()),
          child: BlocConsumer<ProfileBloc, ProfileState>(
            listener:
                (final BuildContext context, final ProfileState state) async {
              if (state.showLogoutSheet) {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  useRootNavigator: true,
                  builder: (final BuildContext context) => LogoutBottomSheet(
                    onTapLogout: () {
                      context.read<ProfileBloc>().add(CallLogoutApi());
                    },
                  ),
                );
              }
              if (state.navigateToLogin == true) {
                context.read<ProfileBloc>().navigateToLoginScreen(context);
              }
            },
            builder: (final BuildContext context, final ProfileState state) {
              return Scaffold(
                backgroundColor: AppColors.colorPrimary500.withValues(alpha: 0.3),
                appBar: CommonAppBar(
                  strTitle: 'Profile'.tr(buildContext),
                  isBack: false,
                ),
                body: Stack(
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          24.height,
                          ProfileHeaderWidget(),
                          18.height,
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(top: 33),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: ProfileOptionsWidget(),
                            ),
                          )
                        ],
                      ),
                    ),
                    if (state.status == CommonScreenState.loading)
                      Utils.loaderBrier(),
                    if (state.status == CommonScreenState.loading)
                      Utils.loaderWid(),
                  ],
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
