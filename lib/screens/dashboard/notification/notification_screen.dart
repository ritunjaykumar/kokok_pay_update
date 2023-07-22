import 'package:flutter/material.dart';
import 'package:kokok_pay/screens/dashboard/notification/notification_provider.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NotificationProvider>(
      create: (ctx) => NotificationProvider(context)..init(),
      child: const _NotificationScreenMain(),
    );
  }
}

///
class _NotificationScreenMain extends StatefulWidget {
  const _NotificationScreenMain({Key? key}) : super(key: key);

  @override
  State<_NotificationScreenMain> createState() => _NotificationScreenMainState();
}

class _NotificationScreenMainState extends State<_NotificationScreenMain> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Consumer<NotificationProvider>(
        builder: (ctx, notificationProvider, child){
          return ListView.builder(
            itemCount: notificationProvider.notificationDataList.length,
            itemBuilder: (ctx, i) {
              var notificationDataList = notificationProvider.notificationDataList;
              return _getNotificationItem(notificationDataList[i]);
            },
          );
        },
      ),
    );
  }

  Widget _getNotificationItem(NotificationData notificationData) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 5,
            decoration: const BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              tileColor: Colors.white,
              title: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(notificationData.title),
              ),
              subtitle: Text(notificationData.subtitle),
              titleTextStyle: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              trailing: Text(notificationData.days),
            ),
          ),
        ],
      ),
    );
  }
}
