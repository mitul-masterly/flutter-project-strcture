import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/app/my_app.dart';
import 'package:flutter_project_structure/helper/firebase_options.dart';
import 'package:flutter_project_structure/helper/pref_helper/shared_pref_helper.dart';
import 'package:flutter_project_structure/helper/push_notification/notification_service.dart';
import 'package:flutter_project_structure/routes/app_providers.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:flutter_project_structure/utils/flavors.dart';

Future<void> main() async {
  FlavorConfig(flavor: Flavor.prod);
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceHelper().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  await NotificationService.shared.initNotification();
  if (kReleaseMode) {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  }
  runApp(
    MultiRepositoryProvider(
      providers: getRepoProviders(),
      child: MultiBlocProvider(
        providers: getAppProviders(),
        child: const MyApp(),
      ),
    ),
  );
}
