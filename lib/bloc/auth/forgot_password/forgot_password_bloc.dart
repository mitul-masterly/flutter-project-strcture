import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/data/api/either.dart';
import 'package:flutter_project_structure/data/errors/failure.dart';
import 'package:flutter_project_structure/data/repository/auth_repo.dart';
import 'package:flutter_project_structure/helper/regex_helper.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_bloc.freezed.dart';
part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthRepo authRepo;

  ForgotPasswordBloc({required this.authRepo})
      : super(ForgotPasswordState.initial()) {
    on<OnTapSubmit>((final OnTapSubmit event,
        final Emitter<ForgotPasswordState> emit) async {
      if ((state.email ?? '').isEmpty) {
        emit(state.copyWith(status: CommonScreenState.error));
      } else if (!RegexHelper.regexEmail.hasMatch(state.email ?? '')) {
        emit(state.copyWith(status: CommonScreenState.error));
      } else {
        emit(state.copyWith(status: CommonScreenState.loading));

        // call API
        final Either<Failure, int?> result =
            await authRepo.apiForgotPassword(email: state.email ?? '');
        result.fold((final Failure error) {
          emit(state.copyWith(status: CommonScreenState.error));
        }, (final int? statusCode) {
          emit(state.copyWith(
            status: statusCode == 200
                ? CommonScreenState.success
                : CommonScreenState.error,
          ));
        });
      }
    });

    on<OnChangeEmail>(
        (final OnChangeEmail event, final Emitter<ForgotPasswordState> emit) {
      emit(state.copyWith(email: event.email));
    });
  }
}
