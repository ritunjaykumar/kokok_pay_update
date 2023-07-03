import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kokok_pay/resources/asset_manager.dart';
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
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: colorScheme.background,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 175,
            width: 350,
            margin: const EdgeInsets.all(16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [
                  colorScheme.secondary.withOpacity(0.5),
                  colorScheme.tertiary.withOpacity(0.5),
                  colorScheme.primary.withOpacity(0.5),
                ],
                transform: const GradientRotation(180),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'LAK 237874832',
                  style: textTheme.titleLarge?.copyWith(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 34,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    style: ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll<Color>(colorScheme.onPrimary),
                    ),
                    label: const Text('Add Money'),
                    icon: const Icon(Icons.add_circle_outline),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Mini Statement',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.date_range),
                )
              ],
            ),
          ),
          Expanded(
            child: Card(
              color: colorScheme.primaryContainer,
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Consumer<WalletProvider>(
                  builder: (ctx, walletProvider, child) {
                    return ListView.builder(
                      itemCount: walletProvider.miniStatements.length,
                      itemBuilder: (ctx, i) {
                        final msd = walletProvider.miniStatements[i];
                        return _getListTile(msd);
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getListTile(MiniStatementData msd) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      padding: const EdgeInsets.only(bottom: 3),
      decoration: BoxDecoration(
        color: _getColor(msd.type),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 3),
        padding: const EdgeInsets.only(bottom: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            ListTile(
              title: Text('${msd.currency} ${msd.amount}'),
              titleTextStyle: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
              subtitle: Text(msd.desc),
              subtitleTextStyle: textTheme.bodySmall,
              leading: _getStatusIndicator(msd.type),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(msd.date),
                  Text(
                    msd.type == 'sent' ? 'DR' : 'CR',
                    style: textTheme.bodyLarge?.copyWith(
                      color: _getColor(msd.type),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getStatusIndicator(String type) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: _getColor(type),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: _getColor(type),
          shape: BoxShape.circle,
        ),
        child: Icon(
          type == 'sent' ? Icons.arrow_upward : Icons.arrow_downward,
          color: Colors.white,
        ),
      ),
    );
  }

  Color _getColor(String type) {
    return type == 'sent' ? Colors.red : Colors.green;
  }
}
