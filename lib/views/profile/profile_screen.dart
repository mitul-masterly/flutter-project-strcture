import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/bloc/user/profile_bloc.dart';
import 'package:flutter_project_structure/components/common_app_bar.dart';
import 'package:flutter_project_structure/data/repository/auth_repo.dart';
import 'package:flutter_project_structure/data/repository/user_repo.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';
import 'package:flutter_project_structure/utils/utils.dart';
import 'package:flutter_project_structure/views/auth/login/login_page.dart';
import 'package:flutter_project_structure/views/profile/widget/logout_bottom_sheet.dart';
import 'package:flutter_project_structure/views/profile/widget/profile_header_widget.dart';
import 'package:flutter_project_structure/views/profile/widget/profile_options_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen();

  @override
  Widget build(final BuildContext buildContext) {
    return BlocProvider<ProfileBloc>(
      create: (final BuildContext context) => ProfileBloc(
          userRepo: context.read<UserRepo>(), context.read<AuthRepo>())
        ..add(OnGetUserProfile()),
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (final BuildContext context, final ProfileState state) {
          if (state.isLoggedOut) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (final BuildContext context) => LoginScreen()),
              (final Route<dynamic> route) =>
                  false, // Remove all previous routes
            );
          } else if (state.showLogoutSheet) {
            showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: buildContext,
              builder: (final BuildContext contextt) => LogoutBottomSheet(
                onTapLogout: () {
                  context.read<ProfileBloc>().add(CallLogoutApi());
                },
              ),
            );
          }
        },
        builder: (final BuildContext context, final ProfileState state) {
          final ProfileBloc bloc = context.read<ProfileBloc>();
          return Scaffold(
            backgroundColor: AppColors.color003366.withValues(alpha: 0.3),
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
                if (state.isLoading) Utils.loaderBrier(),
                if (state.isLoading) Utils.loaderWid(),
              ],
            ),
          );
        },
      ),
    );
  }
}
