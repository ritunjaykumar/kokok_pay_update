import 'package:flutter/material.dart';
import 'package:kokok_pay/screens/dashboard/message/message_provider.dart';
import 'package:provider/provider.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MessageProvider>(
      create: (ctx) => MessageProvider(context),
      child: const _MessageScreenMain(),
    );
  }
}

///
class _MessageScreenMain extends StatefulWidget {
  const _MessageScreenMain({Key? key}) : super(key: key);

  @override
  State<_MessageScreenMain> createState() => _MessageScreenMainState();
}

class _MessageScreenMainState extends State<_MessageScreenMain> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [Text('message screen')],
    );
  }
}
