
import 'package:flutter/material.dart';
import 'package:kokok_pay/screens/wallet/wallet_provider.dart';
import 'package:provider/provider.dart';


class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WalletProvider>(
      create: (ctx) => WalletProvider(context)..init(),
      child: const _WalletScreenMain(),
    );
  }
}
///
class _WalletScreenMain extends StatefulWidget {
  const _WalletScreenMain({Key? key}) : super(key: key);

  @override
  State<_WalletScreenMain> createState() => _WalletScreenMainState();
}

class _WalletScreenMainState extends State<_WalletScreenMain> {
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
