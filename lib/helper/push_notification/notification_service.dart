import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_project_structure/helper/pref_helper/shared_pref_helper.dart';
import 'package:flutter_project_structure/utils/flavors.dart';

/// Top-level background message handler for Firebase Messaging
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(
    final RemoteMessage message) async {
  debugPrint('Handling Firebase Background Message: ${message.messageId}');
  debugPrint('Title: ${message.notification?.title}');
  debugPrint('Body: ${message.notification?.body}');
  // You can also initialize Firebase here if needed
  // await Firebase.initializeApp();
}

/// Top-level background handler for Local Notifications
@pragma('vm:entry-point')
void onDidReceiveBackgroundNotificationResponse(
    final NotificationResponse details) {
  final String? payload = details.payload;
  if (payload != null && payload.isNotEmpty) {
    debugPrint('Background Local Notification Payload: $payload');
    // Handle redirection logic based on payload
    final Map<String, dynamic> messagePayload = json.decode(payload);
    NotificationService.handleNotificationRedirection(payload: messagePayload);
  }
}

class NotificationService {
  static NotificationService shared = NotificationService();

  final SharedPreferenceHelper sharedPref = SharedPreferenceHelper();
  late AndroidNotificationChannel androidChannel;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// Initialize notification service for both FCM and local notifications
  Future<void> initNotification() async {
    // Firebase Messaging Foreground Notification Options
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);

    // Register FCM Background Handler (Important to register at init)
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    // iOS permission
    await apnsPermission();

    // Get and manage FCM token
    getFCMToken();

    // iOS foreground notification enable
    await enableIOSNotifications();

    // Create Android channel
    androidChannel = androidNotificationChannel();

    // Setup notification listeners
    await registerNotificationListeners();
  }

  /// Get and refresh FCM Token
  void getFCMToken() {
    FirebaseMessaging.instance.onTokenRefresh.listen((final String newToken) {
      debugPrint('New FCM token: $newToken');
      if (sharedPref.fcmToken != newToken) {
        sharedPref.saveFcmToken(newToken);
      }
    });

    FirebaseMessaging.instance.getToken().then((final String? value) {
      debugPrint('Initial FCM token: $value');
      if (sharedPref.fcmToken != (value ?? '')) {
        sharedPref.saveFcmToken(value ?? '');
      }
    });
  }

  /// Register Local Notification with handlers
  Future<void> registerLocalNotification() async {
    // Android Channel
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidChannel);

    // Initialization settings
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@drawable/ic_notification');
    const DarwinInitializationSettings iOSSettings =
        DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: false,
      requestAlertPermission: true,
    );
    const InitializationSettings initSettings =
        InitializationSettings(android: androidSettings, iOS: iOSSettings);

    // Initialize Local Notifications
    flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (final NotificationResponse details) {
        final String? payload = details.payload;
        if (payload != null && payload.isNotEmpty) {
          final Map<String, dynamic> messagePayload = json.decode(payload);
          debugPrint('Foreground Local Notification Payload: $messagePayload');
          handleNotificationRedirection(payload: messagePayload);
        }
      },
      onDidReceiveBackgroundNotificationResponse:
          onDidReceiveBackgroundNotificationResponse,
    );
  }

  /// Register FCM listeners and show local notification on foreground
  Future<void> registerNotificationListeners() async {
    await registerLocalNotification();

    // Foreground message listener
    FirebaseMessaging.onMessage.listen((final RemoteMessage? message) async {
      debugPrint('Foreground Message Data: ${message?.data}');
      debugPrint('Title: ${message?.notification?.title}');
      debugPrint('Body: ${message?.notification?.body}');
      displayNotification(message);
    });

    // App open via notification
    FirebaseMessaging.onMessageOpenedApp
        .listen((final RemoteMessage message) async {
      debugPrint('App Opened via Notification: ${message.data}');
      handleNotificationRedirection(payload: message.data);
    });
  }

  /// Display notification using Flutter Local Notifications
  Future<void> displayNotification(final RemoteMessage? message) async {
    if (message?.notification != null) {
      await flutterLocalNotificationsPlugin.show(
        message!.notification!.hashCode,
        message.notification?.title ?? FlavorConfig.title,
        message.notification?.body,
        payload: jsonEncode(message.data),
        NotificationDetails(
          android: AndroidNotificationDetails(
            androidChannel.id,
            androidChannel.name,
            channelDescription: androidChannel.description,
            icon: '@drawable/ic_notification',
          ),
          iOS: const DarwinNotificationDetails(
              presentAlert: true, presentSound: true),
        ),
      );
    }
  }

  /// iOS Foreground Notification Options
  Future<void> enableIOSNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  /// Request APNS Permission
  static Future<void> apnsPermission() async {
    final FirebaseMessaging messaging = FirebaseMessaging.instance;
    try {
      final NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      debugPrint('iOS Permission: ${settings.authorizationStatus}');
    } catch (e) {
      debugPrint('APNS Permission Error: $e');
    }
  }

  /// Android Notification Channel
  AndroidNotificationChannel androidNotificationChannel() =>
      const AndroidNotificationChannel(
        'flutter_base_notification_channel', // ID
        'High Importance Notifications', // Name
        description: 'Channel for important notifications.', // Description
        importance: Importance.max,
      );

  /// Handle Navigation or Redirection via payload
  static void handleNotificationRedirection(
      {required final Map<String, dynamic> payload}) {
    debugPrint('Handle Notification Redirection Payload: $payload');
    // TODO: Implement your redirection logic here.
  }
}
