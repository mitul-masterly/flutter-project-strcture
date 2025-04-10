import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/Utils/utils.dart';
import 'package:flutter_project_structure/bloc/user/profile_bloc.dart';
import 'package:flutter_project_structure/gen/assets.gen.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';
import 'package:flutter_project_structure/theme/font_styles.dart';
import 'package:flutter_project_structure/views/profile/widget/profile_image_widget.dart';

class ProfileHeaderWidget extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
        builder: (final BuildContext context, final ProfileState state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: ProfileImageWidget(
              imageUrl: state.userData?.userProfileImageUrl ?? '',
              canEdit: true,
              onTapCamera: () {
                // Redirect to edit profile
              },
            ),
          ),
          7.height,
          Text(
            state.userData?.fullName ?? '',
            style: dMSansW700.copyWith(fontSize: 25),
          ),
          7.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Assets.svg.icEmail.svg(
                  colorFilter: ColorFilter.mode(
                AppColors.colorPrimary500,
                BlendMode.srcIn,
              )),
              7.width,
              Text(
                state.userData?.emailId ?? '',
                style: dMSansW400.copyWith(
                    fontSize: 14, color: AppColors.colorPrimary500),
              ),
            ],
          )
        ],
      );
    });
  }
}
