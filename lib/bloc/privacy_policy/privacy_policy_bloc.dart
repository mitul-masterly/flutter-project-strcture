import 'package:bloc/bloc.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:webview_flutter/webview_flutter.dart';

part 'privacy_policy_bloc.freezed.dart';
part 'privacy_policy_event.dart';
part 'privacy_policy_state.dart';

class PrivacyPolicyBloc extends Bloc<PrivacyPolicyEvent, PrivacyPolicyState> {
  WebViewController webViewController = WebViewController();

  PrivacyPolicyBloc() : super(PrivacyPolicyState.initial()) {
    on<Initial>(
        (final Initial event, final Emitter<PrivacyPolicyState> emit) async {
      emit(state.copyWith(status: CommonScreenState.loading));
      if (event.url != null && event.url != '') {
        initWebViewController(url: event.url);
        emit(state.copyWith(controller: webViewController));
      }
      emit(state.copyWith(status: CommonScreenState.success));
    });
  }

  void initWebViewController({required final String url}) {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (final int progress) {
            if (progress == 100) {}
          },
          onPageStarted: (final String url) {},
          onPageFinished: (final String url) {},
          onWebResourceError: (final WebResourceError error) {},
          onNavigationRequest: (final NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
  }
}
