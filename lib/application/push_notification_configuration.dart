import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'application.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_important_channel',
  'High Important Notification',
  description: 'This channel is used for important notification',
  importance: Importance.high,
  playSound: true,
  enableLights: true,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  logger.i('A bg message just showed up: ${message.messageId}');
}

class FirebaseInfo {
  final String fcmToken;

  const FirebaseInfo(this.fcmToken);

  AndroidNotificationDetails get androidNotificationDetails {
    return AndroidNotificationDetails(
      channel.id,
      channel.name,
      channelDescription: channel.description,
      color: Colors.blue,
      playSound: true,
      icon: '@mipmap/ic_launcher',
    );
  }
}
