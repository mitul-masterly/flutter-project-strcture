import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'social_media_event.dart';

part 'social_media_state.dart';

part 'social_media_bloc.freezed.dart';

class SocialMediaBloc extends Bloc<SocialMediaEvent, SocialMediaState> {
  SocialMediaBloc() : super(SocialMediaState.initial()) {

      on<SignUpWithGoogleEvent>((final SignUpWithGoogleEvent event,
          final Emitter<SocialMediaState> emit) async {
        final User? user = await _signInWithGoogle();
        if (user != null) {
          ScaffoldMessenger.of(event.context).showSnackBar(
            SnackBar(content: Text('Signed in as ${user.displayName}')),
          );
        } else {
          ScaffoldMessenger.of(event.context).showSnackBar(
            SnackBar(content: Text('Failed to sign in')),
          );
        }
      });

  }
  Future<User?> _signInWithGoogle() async {
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
}

