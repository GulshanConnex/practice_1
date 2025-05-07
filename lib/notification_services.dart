import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';

/// Background message handler must be a top-level function
Future<void> backgroundMessageHandler(RemoteMessage message) async {
  log("🔵 Background message received: ${message.notification?.title}");
}

class NotificationServices {
  static Future<void> initialize() async {
    // Request permission for iOS/Android 13+
    NotificationSettings settings = await FirebaseMessaging.instance.requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log("✅ Notifications authorized");

      // Handle background messages
      FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);

      // Foreground messages
      FirebaseMessaging.onMessage.listen((message) {
        log("🟢 Foreground message: ${message.notification?.title}");
        // Show alert, snackbar, etc., if needed
      });

      // When app is opened from a terminated state by tapping notification
      RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
      if (initialMessage != null) {
        log("⚪ Notification opened app from terminated state: ${initialMessage.notification?.title}");
      }

      // When app is opened from background by tapping notification
      FirebaseMessaging.onMessageOpenedApp.listen((message) {
        log("🟡 Notification opened app from background: ${message.notification?.title}");
      });

      // Get device token
      String? token = await FirebaseMessaging.instance.getToken();
      log("📱 FCM Token: $token");

      // Handle token refresh
      FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
        log("🔄 FCM Token refreshed: $newToken");
      });
    } else {
      log("❌ Notifications NOT authorized");
    }
  }
}













//
// import 'dart:developer';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
//
// Future<void> backgroundMessageHandler(RemoteMessage remoteMessage) async {
//   log("Background message received: ${remoteMessage.notification?.title}");
// }
//
// class NotificationServices {
//   static Future<void> initialize() async {
//     NotificationSettings notificationSettings =
//     await FirebaseMessaging.instance.requestPermission();
//
//     if (notificationSettings.authorizationStatus == AuthorizationStatus.authorized) {
//       FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
//       FirebaseMessaging.onMessage.listen((message) {
//         log("Foreground message received: ${message.notification?.title}");
//       });
//       log("Notifications authorized");
//     } else {
//       log("Notifications NOT authorized");
//     }
//   }
// }
