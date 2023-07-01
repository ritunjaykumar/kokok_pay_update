import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:kokok_pay/resources/asset_manager.dart';
import 'package:lottie/lottie.dart';

import '../../application/push_notification_configuration.dart';
import '../painter/login_painter.dart';

class UnknownScreen extends StatefulWidget {
  const UnknownScreen({Key? key}) : super(key: key);

  @override
  State<UnknownScreen> createState() => _UnknownScreenState();
}

class _UnknownScreenState extends State<UnknownScreen> {
  int counter = 0;

  void showNotification() {
    setState(() {
      counter++;
    });
    flutterLocalNotificationsPlugin.show(
      0,
      'Testing $counter',
      'how you doing?',
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          color: Colors.blue,
          importance: Importance.high,
          playSound: true,
          icon: '@mipmap/ic_launcher',
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    /*FirebaseMessaging.onMessage.listen(
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
    );*/
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Under Development'),
        elevation: 0,
      ),
      /*floatingActionButton: FloatingActionButton(
          onPressed: showNotification,
          child: const Icon(Icons.add),
        ),*/
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              LottieFile.notFoundLottie,
              addRepaintBoundary: true,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            Text(
              'Under Development',
              style: theme.textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

/*
Padding(
        padding: const EdgeInsets.all(SizeResource.value_16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  Lottie.asset(
                    LottieFile.notFoundLottie,
                    addRepaintBoundary: true,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    'Under construction! please contact to bank',
                    style: theme.textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ],
        ),
      ),
 */
