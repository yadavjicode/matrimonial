
// import 'package:flutter/material.dart';
// import 'package:badges/badges.dart' as badges;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';


// class NotificationCountWidget extends StatefulWidget {

//   NotificationCountWidget();

//   @override
//   State<NotificationCountWidget> createState() => _NotificationCountWidgetState();
// }

// class _NotificationCountWidgetState extends State<NotificationCountWidget> {
//  int _notificationCount = 0;

//   Future<void> _incrementNotificationCount() async {
//   final prefs = await SharedPreferences.getInstance();
//   int currentCount = prefs.getInt('notification_count') ?? 0;
//   await prefs.setInt('notification_count', currentCount + 1);
// }

// Future<int> _getNotificationCount() async {
//   final prefs = await SharedPreferences.getInstance();
//   return prefs.getInt('notification_count') ?? 0;
// }

// void _setupFirebaseMessaging() {
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//     await _incrementNotificationCount();
//     // You can also display a notification or update UI here
//   });
// }


// Future<void> _showLocalNotification() async {
//   final prefs = await SharedPreferences.getInstance();
//   int currentCount = prefs.getInt('notification_count') ?? 0;
//   await prefs.setInt('notification_count', currentCount + 1);

//   const AndroidNotificationDetails androidPlatformChannelSpecifics =
//       AndroidNotificationDetails('your_channel_id', 'your_channel_name',
//           importance: Importance.max,
//           priority: Priority.high);
//   const NotificationDetails platformChannelSpecifics =
//       NotificationDetails(android: androidPlatformChannelSpecifics);

//   await FlutterLocalNotificationsPlugin().show(
//     0,
//     'New Notification',
//     'You have a new notification',
//     platformChannelSpecifics,
//   );
// } 

// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _loadNotificationCount();
//   }

//     Future<void> _loadNotificationCount() async {
//     int count = await _getNotificationCount();
//     setState(() {
//       _notificationCount = count;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<int>(
      
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator(); // Show a loading indicator while fetching
//         } else if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         } else if (snapshot.hasData) {
//           final count = snapshot.data!;
//           return badges.Badge(
//             badgeContent: Text("${_notificationCount}"),
//             child: Icon(Icons.notifications),
//           );
//         } else {
//           return Text('No notifications');
//         }
//       },
//     );
//   }
// }


import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int notificationCount = 0;

  @override
  void initState() {
    super.initState();
    initializeFCM();
    loadNotificationCount();
  }

  // Initialize Firebase Cloud Messaging
  void initializeFCM() {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      incrementNotificationCount();
    });
  }

  // Increment notification count
  void incrementNotificationCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int currentCount = prefs.getInt('notificationCount') ?? 0;
    setState(() {
      notificationCount = currentCount + 1;
    });
    prefs.setInt('notificationCount', notificationCount);
  }

  // Load notification count on app start
  void loadNotificationCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      notificationCount = prefs.getInt('notificationCount') ?? 0;
    });
  }

  // Clear notification count (for example, when user opens notification screen)
  void clearNotificationCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('notificationCount', 0);
    setState(() {
      notificationCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications ($notificationCount)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Total Notifications: $notificationCount'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: clearNotificationCount,
              child: Text('Clear Notifications'),
            ),
          ],
        ),
      ),
    );
  }
}