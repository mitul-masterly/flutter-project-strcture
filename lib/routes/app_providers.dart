import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/bloc/auth/forgot_password/forgot_password_bloc.dart';
import 'package:flutter_project_structure/bloc/auth/login/login_bloc.dart';
import 'package:flutter_project_structure/bloc/auth/signup/signup_bloc.dart';
import 'package:flutter_project_structure/bloc/my_app/localisation_bloc.dart';
import 'package:flutter_project_structure/bloc/tab_navigation_cubit.dart';
import 'package:flutter_project_structure/bloc/user/profile_bloc.dart';
import 'package:flutter_project_structure/data/repository/auth_repo.dart';
import 'package:flutter_project_structure/data/repository/user_repo.dart';

List<BlocProvider<StateStreamableSource<Object?>>> getAppProviders() {
  return <BlocProvider<StateStreamableSource<Object?>>>[
    BlocProvider<LocalisationBloc>(
      create: (final BuildContext context) => LocalisationBloc(),
    ),
    BlocProvider(
        create: (final BuildContext context) =>
            LoginBloc(authRepo: context.read<AuthRepo>())),
    BlocProvider(
        create: (final BuildContext context) =>
            SignUpBloc(authRepo: context.read<AuthRepo>())),
    BlocProvider(create: (final BuildContext context) => TabNavigationCubit()),
    BlocProvider(
      create: (final BuildContext context) => ProfileBloc(
        context.read<AuthRepo>(),
        userRepo: context.read<UserRepo>(),
      ),
    ),
    BlocProvider(
      create: (final BuildContext context) => ForgotPasswordBloc(),
    ),
  ];
}

List<RepositoryProvider<dynamic>> getRepoProviders() {
  return <RepositoryProvider<dynamic>>[
    RepositoryProvider<AuthRepo>(
        create: (final BuildContext context) => AuthRepoImp()),
    RepositoryProvider<UserRepo>(
        create: (final BuildContext context) => UserRepoImp()),
  ];
}
