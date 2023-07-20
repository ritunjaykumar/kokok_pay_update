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
    return Column(
      children: [],
    );
  }
}
