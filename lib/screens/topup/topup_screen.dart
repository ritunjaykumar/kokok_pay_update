
import 'package:flutter/material.dart';
import 'package:kokok_pay/screens/topup/topup_provider.dart';
import 'package:provider/provider.dart';


class TopupScreen extends StatefulWidget {
  const TopupScreen({Key? key}) : super(key: key);

  @override
  State<TopupScreen> createState() => _TopupScreenState();
}

class _TopupScreenState extends State<TopupScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TopupProvider>(
      create: (ctx) => TopupProvider(context)..init(),
      child: const _TopupScreenMain(),
    );
  }
}
///
class _TopupScreenMain extends StatefulWidget {
  const _TopupScreenMain({Key? key}) : super(key: key);

  @override
  State<_TopupScreenMain> createState() => _TopupScreenMainState();
}

class _TopupScreenMainState extends State<_TopupScreenMain> {
  @override
  Widget build(BuildContext context) {
  final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(),
        body: Column(
            children: [],
        ),
    );
  }
}
