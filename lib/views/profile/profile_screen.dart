import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/bloc/user/profile_bloc.dart';
import 'package:flutter_project_structure/data/repository/user_repo.dart';
import 'package:flutter_project_structure/theme/font_styles.dart';
import 'package:flutter_project_structure/utils/utils.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen();

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (final BuildContext context) =>
          ProfileBloc(userRepo: context.read<UserRepo>())
            ..add(OnGetUserProfile()),
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (final BuildContext context, final ProfileState state) {},
        builder: (final BuildContext context, final ProfileState state) {
          final ProfileBloc bloc = context.read<ProfileBloc>();
          return Stack(
            children: <Widget>[
              Scaffold(
                body: Center(
                  child: Text(
                    state.userData?.emailId ?? '',
                    style: rubikW400,
                  ),
                ),
              ),
              if (state.isLoading) Utils.loaderBrier(),
              if (state.isLoading) Utils.loaderWid(),
            ],
          );
        },
      ),
    );
  }
}
