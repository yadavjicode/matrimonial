import 'dart:developer';
import 'package:devotee/chat/firebase_options.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/controller/notification_controller.dart';
import 'package:devotee/pages/splash_Screen/splash_screen.dart';
import 'package:devotee/routes/app_routes.dart';
import 'package:devotee/utils/size.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification_channel/flutter_notification_channel.dart';
import 'package:flutter_notification_channel/notification_importance.dart';
import 'package:get/get.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:just_audio_background/just_audio_background.dart';

/// Local notification plugin instance
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Step 1: Firebase Initialization
  await _initializeFirebase();

  // Step 2: Firebase Messaging for Background Handling
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Step 3: Initialize Local Notifications
  await _initializeLocalNotification();

  // Step 4: Initialize GetX Controller for Notifications
  Get.put(NotificationController());

  // Step 5: Set System UI Overlay
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.primaryColor,
  ));

  // Step 6: Disable Screenshots
  await disableScreenshots();

  // Step 7: Run the App
  runApp(const MyApp());
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'matrimony',
      home: const SplashScreen(),
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.routes,
    );
  }
}

/// Initialize Firebase
Future<void> _initializeFirebase() async {
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    var result = await FlutterNotificationChannel.registerNotificationChannel(
        description: 'For Showing Message Notification',
        id: 'chats',
        importance: NotificationImportance.IMPORTANCE_HIGH,
        name: 'Chats');
    log('Notification Channel Result: $result');
  } catch (e) {
    log('Error initializing Firebase: $e');
  }
}

// Handle background Firebase messages
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  try {
    await Firebase.initializeApp();
    log('Handling a background message: ${message.messageId}');
  } catch (e) {
    log('Error handling background message: $e');
  }
}

/// Disable screenshots and screen recording
Future<void> disableScreenshots() async {
  try {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    log('Screenshots disabled.');
  } catch (e) {
    log('Error disabling screenshots: $e');
  }
}

/// Initialize local notification settings
Future<void> _initializeLocalNotification() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  try {
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
        if (notificationResponse.payload != null) {
          log('Notification Payload: ${notificationResponse.payload}');
        }
      },
    );
    log('Local Notifications initialized.');
  } catch (e) {
    log('Error initializing local notifications: $e');
  }
}
