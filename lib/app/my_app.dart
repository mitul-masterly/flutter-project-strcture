import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_project_structure/Routes/routes_name.dart';
import 'package:flutter_project_structure/bloc/my_app/localisation_bloc.dart';
import 'package:flutter_project_structure/helper/pref_helper/shared_pref_helper.dart';
import 'package:flutter_project_structure/helper/push_notification/notification_service.dart';
import 'package:flutter_project_structure/routes/app_routes.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:flutter_project_structure/utils/flavors.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<LocalisationBloc, LocalisationState>(
        builder: (final BuildContext context, final LocalisationState state) {
      return MaterialApp(
        debugShowCheckedModeBanner: FlavorConfig.isStaging ? true : false,
        title: FlavorConfig.title,
        navigatorKey: navigatorKey,
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: AppColors.colorPrimary500),
          useMaterial3: true,
        ),
        initialRoute: _getInitialRoute(),
        routes: AppRoutes.getRoutes(),
        localizationsDelegates: <LocalizationsDelegate<Object>>[
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        locale: context.watch<LocalisationBloc>().state.language,
        supportedLocales: <Locale>[
          Locale(SupportedLangCode.english.langCode,
              SupportedLangCode.english.countryCode),
          Locale(SupportedLangCode.arabic.langCode,
              SupportedLangCode.arabic.countryCode),
          Locale(SupportedLangCode.gujarati.langCode,
              SupportedLangCode.gujarati.countryCode),
          // Arabic (Saudi Arabia) or use 'ar_EG' for Egypt
        ],
        localeResolutionCallback:
            (final Locale? locale, final Iterable<Locale> supportedLocales) {
          for (Locale supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
      );
    });
  }

  String _getInitialRoute() {
    FirebaseMessaging.instance.getInitialMessage().then(
      (final RemoteMessage? remoteMessage) {
        if (remoteMessage != null) {
          NotificationService.handleNotificationRedirection(
              payload: remoteMessage.data);
        }
      },
    );

    if (SharedPreferenceHelper().isLoggedIn) {
      return RouteName.tabNavigationView;
    } else {
      return RouteName.loginScreen;
    }
  }
}
