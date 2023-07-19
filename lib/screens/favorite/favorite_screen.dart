import 'package:flutter/material.dart';
import 'package:kokok_pay/resources/asset_manager.dart';
import 'package:kokok_pay/screens/favorite/favorite_provider.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FavoriteProvider>(
      create: (ctx) => FavoriteProvider(context)..init(),
      child: const _FavoriteScreenMain(),
    );
  }
}

///
class _FavoriteScreenMain extends StatefulWidget {
  const _FavoriteScreenMain({Key? key}) : super(key: key);

  @override
  State<_FavoriteScreenMain> createState() => _FavoriteScreenMainState();
}

class _FavoriteScreenMainState extends State<_FavoriteScreenMain> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Recent Transactions User', style: textTheme.titleMedium),
            const SizedBox(height: 10),
            SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: context.read<FavoriteProvider>().recentTxnDataList.length,
                itemBuilder: (ctx, i) {
                  return _recentFavoriteTxn(context.read<FavoriteProvider>().recentTxnDataList[i]);
                },
              ),
            ),
          ],

        ),
      ),
    );
  }

  Widget _recentFavoriteTxn(RecentTxnData recentTxnData) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {},
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            width: 80,
            height: 80,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: colorScheme.primary,
                width: 2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                recentTxnData.image,
                fit: BoxFit.fill,
                width: 80,
              ),
            ),
          ),
          Text(
            '${recentTxnData.name.substring(
              0,
              recentTxnData.name.length < 8 ? recentTxnData.name.length : 8,
            )} ${recentTxnData.name.length > 8 ? '..' : ''}',
            style: textTheme.titleSmall,
          ),
          Text(recentTxnData.txnType, style: textTheme.bodySmall),
        ],
      ),
    );
  }
}
