import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_structure/Routes/routes_name.dart';
import 'package:flutter_project_structure/components/common_snack_bar.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

part 'social_media_event.dart';

part 'social_media_state.dart';

part 'social_media_bloc.freezed.dart';

class SocialMediaBloc extends Bloc<SocialMediaEvent, SocialMediaState> {
  SocialMediaBloc() : super(SocialMediaState.initial()) {
    on<SignUpWithGoogleEvent>((final SignUpWithGoogleEvent event,
        final Emitter<SocialMediaState> emit) async {
      final User? user = await signInWithGoogle();
      if (user != null) {
        Navigator.pushNamed(event.context, RouteName.tabNavigationView);
      } else {
        showErrorSnackBar(
          'Failed to sign in'.tr(event.context),
        );
      }
    });

    on<SignUpWithAppleEvent>((final SignUpWithAppleEvent event,
        final Emitter<SocialMediaState> emit) async {
      try {
        final AuthorizationCredentialAppleID credential =
            await SignInWithApple.getAppleIDCredential(
          scopes: <AppleIDAuthorizationScopes>[
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
        );
        showErrorSnackBar(
          'Apple Sign-In successful:'.tr(event.context),
        );
        debugPrint('Apple Sign-In successful: ${credential.email}');
      } catch (error) {
        debugPrint('Error: $error');
        showErrorSnackBar('Error: $error');
      }
    });

    on<SignUpWithFacebookEvent>((final SignUpWithFacebookEvent event,
        final Emitter<SocialMediaState> emit) async {
    /*  final FacebookLogin facebookLogin = await FacebookLogin();
      final FacebookLoginResult result = await facebookLogin.logIn(customPermissions: <String>['email']);
      switch (result.status) {
        case FacebookLoginStatus.success:
        // You're logged in with Facebook, use result.accessToken to make API calls.
          break;
        case FacebookLoginStatus.cancel:
        // User cancelled the login.
          break;
        case FacebookLoginStatus.error:
        // There was an error during login.
          break;
      }*/

    });
  }



  Future<User?> signInWithGoogle() async {
    final FirebaseAuth auth = await FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = await GoogleSignIn();
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
}
