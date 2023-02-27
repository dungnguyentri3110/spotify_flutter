import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotify {
  final FlutterLocalNotificationsPlugin plugin;
  final AndroidNotificationChannel androidChanel;
  final AndroidNotificationDetails androidNotifyDetail;

  PushNotify(
      {required this.plugin,
      required this.androidChanel,
      required this.androidNotifyDetail});

  Future<void> showNotify(RemoteMessage message) async {
    try {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (message.notification != null) {
        if (android != null && plugin != null) {
          print(
              'Message also contained a notification: ${notification?.title}');
          print('Message also contained a notification: ${notification?.body}');
          print(
              'Message also contained a notification: ${notification?.hashCode}');
          print(
              'Message also contained a notification: ${androidNotifyDetail != null}');
          NotificationDetails details =
              NotificationDetails(android: androidNotifyDetail);
          await plugin.show(notification.hashCode, notification?.title ?? '',
              notification?.body ?? '', details);
        }
      }
    } catch (e) {
      print("error $e");
    }
  }
}
