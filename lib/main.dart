import 'dart:developer';
import 'package:devotee/chat/firebase_options.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/controller/notification_controller.dart';
import 'package:devotee/pages/splash_Screen/splash_screen.dart';
import 'package:devotee/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_notification_channel/flutter_notification_channel.dart';
import 'package:flutter_notification_channel/notification_importance.dart';
import 'package:get/get.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeFirebase();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  Get.put(NotificationController()); // Initialize the NotificationController
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.primaryColor,
  ));
  await disableScreenshots(); //Disable screenshots for the entire app
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'matrimony',
      home: const SplashScreen(),
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.routes,
      // initialBinding: MyBindings(),
    );
  }
}

Future<void> _initializeFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  var result = await FlutterNotificationChannel.registerNotificationChannel(
      description: 'For Showing Message Notification',
      id: 'chats',
      importance: NotificationImportance.IMPORTANCE_HIGH,
      name: 'Chats');

  log('\nNotification Channel Result: $result');
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message: ${message.messageId}');
}

Future<void> disableScreenshots() async {
  // This will prevent screenshots and screen recording for the whole app
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
}
