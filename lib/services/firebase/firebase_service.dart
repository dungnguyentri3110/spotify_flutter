import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:spotify_flutter/firebase_options.dart';
import 'package:spotify_flutter/services/push_notify/push_notify.dart';

class FirebaseService {
  FlutterLocalNotificationsPlugin localNotify =
      FlutterLocalNotificationsPlugin();

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    importance: Importance.max,
    description: 'This channel is used for important notifications.',
  );

  late PushNotify pushNotify;

  late AndroidNotificationDetails androidNotifyDetail;

  void initInstance() async {
    final token = await messaging.getToken();
    print('token $token');
    channel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      importance: Importance.max,
      description: 'This channel is used for important notifications.',
    );
    localNotify = FlutterLocalNotificationsPlugin();
    await messaging.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);
    createChanel();
    androidNotifyDetail = AndroidNotificationDetails(channel.id, channel.name,
        importance: Importance.max, icon: 'app_icon');
    pushNotify = PushNotify(
        plugin: localNotify,
        androidChanel: channel,
        androidNotifyDetail: androidNotifyDetail);
    onListenMessage();
  }

  final FlutterLocalNotificationsPlugin plugin =
      FlutterLocalNotificationsPlugin();

  void createChanel() async {
    plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel)
        .whenComplete(() => print("create chanel success"));
  }

  void handleBackgroundMessage() {
    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
  }

  Future<void> onBackgroundMessage(RemoteMessage message) async {
    handleRecieveMessage(message);
  }

  void onListenMessage() {
    FirebaseMessaging.onMessage.listen(handleRecieveMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleRecieveMessage);
  }

  void handleRecieveMessage(RemoteMessage message) async {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');
    pushNotify.showNotify(message);
    // RemoteNotification? notification = message.notification;
    // AndroidNotification? android = message.notification?.android;

    // if (message.notification != null) {
    //   if (android != null) {
    //     print(
    //         'Message also contained a notification: ${localNotify.toString()}');
    //     final detail = NotificationDetails(
    //       android: androidNotifyDetail,
    //     );
    //     // print('Message also contained a notification: ${channel.name}');
    //     // print('Message also contained a notification: ${channel.description} ');

    //     await localNotify.show(0, "hello", "Fuck", detail);
    //   }
    // }
  }
}
