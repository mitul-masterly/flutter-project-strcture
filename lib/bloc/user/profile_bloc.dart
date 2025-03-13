import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/data/models/response_model/auth/user_data_model.dart';
import 'package:flutter_project_structure/data/repository/user_repo.dart';
import 'package:flutter_project_structure/utils/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepo userRepo;

  ProfileBloc({required this.userRepo}) : super(ProfileState.initial()) {
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
      }
    });
  }
}
