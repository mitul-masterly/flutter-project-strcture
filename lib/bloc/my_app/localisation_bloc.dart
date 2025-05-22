import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/translations/app_translations.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_auth/local_auth.dart';

part 'localisation_bloc.freezed.dart';

part 'localisation_event.dart';

part 'localisation_state.dart';

class LocalisationBloc extends Bloc<LocalisationEvent, LocalisationState> {
  final LocalAuthentication localAuth = LocalAuthentication();

  LocalisationBloc() : super(LocalisationState.initial()) {
    on<OnChangeLanguage>(
            (final OnChangeLanguage event,
            final Emitter<LocalisationState> emit) {
          AppTranslation.changeLocale(event.language); // Example of usage
          emit(state.copyWith(language: event.language));
        });
  }
}
