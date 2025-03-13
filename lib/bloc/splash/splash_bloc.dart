import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_bloc.freezed.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState.initial()) {
    on<SplashEvent>(
        (final SplashEvent event, final Emitter<SplashState> emit) async {
      if (event is InitialEvent) {
        await Future<void>.delayed(const Duration(seconds: 1));
        emit(state.copyWith(isNavigate: true));
      }
    });
  }
}
