import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_media_bloc.freezed.dart';
part 'social_media_event.dart';
part 'social_media_state.dart';

class SocialMediaBloc extends Bloc<SocialMediaEvent, SocialMediaState> {
  SocialMediaBloc() : super(SocialMediaState.initial()) {}
}
