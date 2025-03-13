import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/bloc/my_app/localisation_bloc.dart';
import 'package:flutter_project_structure/bloc/tab_navigation_cubit.dart';
import 'package:flutter_project_structure/data/models/others/profile_options_model.dart';
import 'package:flutter_project_structure/data/models/response_model/auth/user_data_model.dart';
import 'package:flutter_project_structure/data/repository/auth_repo.dart';
import 'package:flutter_project_structure/data/repository/user_repo.dart';
import 'package:flutter_project_structure/gen/assets.gen.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:flutter_project_structure/utils/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepo userRepo;
  final AuthRepo authRepo;

  ProfileBloc(this.authRepo, {required this.userRepo})
      : super(ProfileState.initial()) {
    on<OnGetUserProfile>(
        (final OnGetUserProfile event, final Emitter<ProfileState> emit) async {
      emit(state.copyWith(isLoading: true, userData: null));

      try {
        final UserDataModel user = await userRepo.getUserProfileApi();
        user.authToken = sharedPreferenceHelper.user?.authToken;
        sharedPreferenceHelper.saveUser(user);
        emit(state.copyWith(isLoading: false, userData: user));
      } catch (e) {
        debugPrint('error message $e');
        emit(state.copyWith(isLoading: false, userData: null));
        emit(state.copyWith(isLoading: false, userData: null));
      }
    });

    on<OnTapLogout>(
        (final OnTapLogout event, final Emitter<ProfileState> emit) async {
          emit(state.copyWith(showLogoutSheet: true));
          await Future.delayed(Duration(milliseconds: 200)); // Small delay to ensure UI responds
          emit(state.copyWith(showLogoutSheet: false));
    });

    on<CallLogoutApi>((final CallLogoutApi event, final Emitter<ProfileState> emit) async {
      emit(state.copyWith(isLoading: true, isLoggedOut: false));
      try {
        final Map<String, dynamic> params = <String, dynamic>{
          'authToken': sharedPreferenceHelper.user?.authToken,
          'userRegistrationId': sharedPreferenceHelper.user?.userRegistrationId,
        };
        final int? statusCode = await authRepo.apiLogout(requestParams: params);
        emit(state.copyWith(isLoading: false, isLoggedOut: statusCode == 200));
      } catch (e) {
        debugPrint('error message $e');
        emit(state.copyWith(isLoading: false, isLoggedOut: false));
      }
    });
  }

  List<ProfileOptionsModel> get arrProfileOptions => <ProfileOptionsModel>[
        ProfileOptionsModel(
            icon: Assets.svg.icPerson.svg(),
            title: 'My Profile',
            onTap: (final BuildContext context) {
              context.read<TabNavigationCubit>().updateTab(0);
            }),
        ProfileOptionsModel(
            icon: Assets.svg.icLocationPin.svg(),
            title: 'Address Details',
            onTap: (final BuildContext context) {}),
        ProfileOptionsModel(
            icon: Assets.svg.icLocationPin.svg(),
            title: 'Change Language',
            onTap: (final BuildContext context) {
              if (context.read<LocalisationBloc>().state.language ==
                  Locale(SupportedLangCode.english.langCode,
                      SupportedLangCode.english.countryCode)) {
                context.read<LocalisationBloc>().add(
                    LocalisationEvent.onChangeLanguage(Locale(
                        SupportedLangCode.arabic.langCode,
                        SupportedLangCode.arabic.countryCode)));
              } else {
                context.read<LocalisationBloc>().add(
                    LocalisationEvent.onChangeLanguage(Locale(
                        SupportedLangCode.english.langCode,
                        SupportedLangCode.english.countryCode)));
              }
            }),
        ProfileOptionsModel(
            icon: Assets.svg.icLogout.svg(),
            title: 'Log Out',
            onTap: (final BuildContext context)  {
              context.read<ProfileBloc>().add(OnTapLogout());

            }),
      ];
}
