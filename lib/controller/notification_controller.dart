import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationController extends GetxController {
  var notificationCount = 0.obs; // Observable for notification count

  @override
  void onInit() {
    super.onInit();
    _initializeFCM();
    _loadNotificationCount();
  }

  void _initializeFCM() {
    // Request permission for notifications
    FirebaseMessaging.instance.requestPermission();

    // Handle messages when the app is in the foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _incrementNotificationCount();
    });

    // Handle background messages (when the app is in the background)
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Handle messages when the app is opened from a terminated state
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        _incrementNotificationCount();
      }
    });

    // Handle when the app is resumed or opened from the background by a notification click
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _incrementNotificationCount();
    });
  }

  // Background message handler
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Increment count in a thread-safe manner
    int currentCount = prefs.getInt('notificationCount') ?? 0;
    prefs.setInt('notificationCount', currentCount + 1);
    // Consider using a batch operation if handling multiple notifications
  }

  // Load notification count from SharedPreferences
  void _loadNotificationCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    notificationCount.value = prefs.getInt('notificationCount') ?? 0;
  }

  // Increment notification count
  void _incrementNotificationCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int currentCount = (prefs.getInt('notificationCount') ?? 0) + 1;
    notificationCount.value = currentCount;
    prefs.setInt('notificationCount', currentCount);
  }

  // Clear notification count (for example, when the user opens the notification page)
  void clearNotificationCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('notificationCount', 0);
    notificationCount.value = 0;
  }
}
