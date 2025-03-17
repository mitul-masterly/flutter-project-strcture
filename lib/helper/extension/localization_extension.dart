import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/bloc/my_app/localisation_bloc.dart';
import 'package:flutter_project_structure/translations/app_translations.dart';

// extension LocalizationExt on String {
//   String tr(
//     final BuildContext context, {
//     final Map<String, String>? namedArgs,
//     final List<String>? args,
//   }) {
//     final locale = context.watch<LocalisationBloc>().state.language;
//     return AppTranslation.translate(this, locale);
//   }
// }

extension LocalizationExtension on String {
  String tr(
    final BuildContext context, {
    final Map<String, String>? namedArgs,
    final List<String>? args,
  }) {
    final Locale locale = context.read<LocalisationBloc>().state.language;
    return AppTranslation.translate(
      this,
      locale,
      namedArgs: namedArgs,
      args: args,
    );
  }
}
