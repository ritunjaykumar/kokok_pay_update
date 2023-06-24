import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../application/application.dart';
import '../../application/push_notification_configuration.dart';
import '../../screens/base/base_view_model.dart';

class NotificationProvider extends BaseViewModel {
  NotificationProvider(super.context) {
    _initNotification();
  }

  void _initNotification() {
    logger.i('listener activated');
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage remoteMessage) {
        RemoteNotification? notification = remoteMessage.notification;
        AndroidNotification? androidNotification = remoteMessage.notification!.android;
        if (notification != null && androidNotification != null) {
          logger.i('got notification');
          flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ),
          );
        } else {
          logger.i('did not get notification');
        }
      },
    );
  }
}
