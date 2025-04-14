import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_project_structure/Routes/routes_name.dart';
import 'package:flutter_project_structure/components/common_snack_bar.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';
import 'package:flutter_project_structure/helper/pref_helper/shared_pref_helper.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

part 'social_media_bloc.freezed.dart';
part 'social_media_event.dart';
part 'social_media_state.dart';

class SocialMediaBloc extends Bloc<SocialMediaEvent, SocialMediaState> {
  SocialMediaBloc() : super(SocialMediaState.initial()) {
    on<SignUpWithGoogleEvent>((final SignUpWithGoogleEvent event,
        final Emitter<SocialMediaState> emit) async {
      emit(state.copyWith(socialMediaStatus: SocialMediaLoginState.google));
      final User? user = await signInWithGoogle();
      if (user != null) {
        emit(state.copyWith(socialMediaStatus: SocialMediaLoginState.success));
        SharedPreferenceHelper().saveIsLoggedIn(true);
        Navigator.pushNamed(event.context, RouteName.tabNavigationView);
      } else {
        emit(state.copyWith(socialMediaStatus: SocialMediaLoginState.error));
        showErrorSnackBar(
          'Failed to sign in'.tr(event.context),
        );
      }
    });

    on<SignUpWithAppleEvent>((final SignUpWithAppleEvent event,
        final Emitter<SocialMediaState> emit) async {
      emit(state.copyWith(socialMediaStatus: SocialMediaLoginState.apple));
      final User? user = await signInWithApple();
      if (user != null) {
        SharedPreferenceHelper().saveIsLoggedIn(true);
        emit(state.copyWith(socialMediaStatus: SocialMediaLoginState.success));
        Navigator.pushNamed(event.context, RouteName.tabNavigationView);
      } else {
        emit(state.copyWith(socialMediaStatus: SocialMediaLoginState.error));
        showErrorSnackBar(
          'Failed to sign in'.tr(event.context),
        );
      }
    });

    on<SignUpWithFacebookEvent>((final SignUpWithFacebookEvent event,
        final Emitter<SocialMediaState> emit) async {
      final LoginResult result = await FacebookAuth.instance.login();
      late AccessToken _accessToken;
      if (result.status == LoginStatus.success) {
        _accessToken = result.accessToken!;
        final Map<String, dynamic> userData =
            await FacebookAuth.instance.getUserData();
        debugPrint('userData_____${userData}');
      } else {
        debugPrint('Facebook login failed: ${result.message}');
      }
    });
  }

  Future<User?> signInWithGoogle() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final UserCredential userCredential =
          await auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      return null;
    }
  }

  Future<User?> signInWithApple() async {
    try {
      final AuthorizationCredentialAppleID appleCredential =
          await SignInWithApple.getAppleIDCredential(
        scopes: <AppleIDAuthorizationScopes>[
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      final OAuthCredential oauthCredential =
          OAuthProvider('apple.com').credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(oauthCredential);
      debugPrint('userCredential: ${userCredential}');
      return userCredential.user;
    } catch (e) {
      debugPrint('Apple Sign-in Error: $e');
      return null;
    }
  }
}

