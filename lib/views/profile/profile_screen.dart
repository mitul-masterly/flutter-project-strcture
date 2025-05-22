import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/bloc/my_app/localisation_bloc.dart';
import 'package:flutter_project_structure/bloc/user/profile_bloc.dart';
import 'package:flutter_project_structure/components/bottom_sheet/image_picker_option_bottom_sheet.dart';
import 'package:flutter_project_structure/data/repository/auth_repo.dart';
import 'package:flutter_project_structure/data/repository/user_repo.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';
import 'package:flutter_project_structure/theme/font_styles.dart';
import 'package:flutter_project_structure/theme/status_bar_config.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:flutter_project_structure/utils/utils.dart';
import 'package:flutter_project_structure/views/profile/widget/logout_bottom_sheet.dart';
import 'package:flutter_project_structure/views/profile/widget/profile_header_widget.dart';
import 'package:flutter_project_structure/views/profile/widget/profile_options_widget.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen();

  @override
  Widget build(final BuildContext buildContext) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: lightStatusBarTransparent,
      child: BlocBuilder<LocalisationBloc, LocalisationState>(builder:
          (final BuildContext localisationContext,
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
                  builder: (final BuildContext ccontext) => LogoutBottomSheet(
                    onTapLogout: () {
                      context.read<ProfileBloc>().add(CallLogoutApi());
                    },
                  ),
                );
              }
              if (state.showProfilePhotoEditSheet) {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  useRootNavigator: true,
                  builder: (final BuildContext ccontext) =>
                      ImagePickerOptionBottomSheet(
                    onTapCamera: () async {
                      final PermissionStatus status =
                          await Utils.checkCameraPermission(ccontext);
                      if (status.isGranted) {
                        final Media? profileMedia =
                            await Utils.pickImage(PhotoPickerType.camera);
                        if (profileMedia != null) {
                          context.read<ProfileBloc>().add(OnSelectProfilePhoto(
                              imagePath: profileMedia.path ?? ''));
                        }
                      }
                    },
                    onTapGallery: () async {
                      final PermissionStatus status =
                          await Utils.checkPhotosPermission(ccontext);
                      if (status.isGranted || status.isLimited) {
                        final Media? profileMedia =
                            await Utils.pickImage(PhotoPickerType.photos);
                        if (profileMedia != null) {
                          context.read<ProfileBloc>().add(OnSelectProfilePhoto(
                              imagePath: profileMedia.path ?? ''));
                        }
                      }
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
                body: Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.colorPrimary500,
                        gradient: LinearGradient(
                          colors: <Color>[
                            AppColors.colorA478D1,
                            AppColors.color4478D1
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          60.height,
                          Text(
                            'Profile'.tr(buildContext),
                            style: dMSansW700.copyWith(
                                color: AppColors.white, fontSize: 20),
                          ),
                          50.height,
                          ProfileHeaderWidget(),
                          18.height,
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(top: 20),
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
