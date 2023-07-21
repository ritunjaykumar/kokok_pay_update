import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      appBar: AppBar(
        title: const Text('Favorite'),
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: colorScheme.background,
        ),
      ),
      body: Stack(
        children: [
          Padding(
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
                      return _recentFavoriteTxn(
                          context.read<FavoriteProvider>().recentTxnDataList[i]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('All Favorites', style: textTheme.titleMedium),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: context.read<FavoriteProvider>().favoriteDataList.length,
                    itemBuilder: (ctx, i) {
                      return _favoriteItem(
                        context.read<FavoriteProvider>().favoriteDataList[i],
                        context.watch<FavoriteProvider>().check,
                        () {
                          context.read<FavoriteProvider>().checkToggle(true);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          if (context.watch<FavoriteProvider>().check)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.read<FavoriteProvider>().delete();
                      },
                      icon: const Icon(Icons.delete),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<FavoriteProvider>().clearItem();
                      },
                      icon: const Icon(Icons.cancel),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _recentFavoriteTxn(RecentTxnData recentTxnData) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    const double width = 60;
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              width: width,
              height: width,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width / 2),
                border: Border.all(
                  color: colorScheme.primary,
                  width: 2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(width / 2),
                child: Image.asset(
                  recentTxnData.image,
                  fit: BoxFit.fill,
                  width: width,
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
      ),
    );
  }

  Widget _favoriteItem(FavoriteData favoriteData, bool select, VoidCallback callback) {
    IconData iconData() {
      if (favoriteData.type == 'wallet') {
        return Icons.wallet;
      } else if (favoriteData.type == 'edl') {
        return Icons.electric_bolt_outlined;
      } else if (favoriteData.type == 'water') {
        return Icons.water_drop;
      } else {
        return Icons.favorite;
      }
    }

    return ListTile(
      key: UniqueKey(),
      title: Text(favoriteData.name),
      subtitle: Text('${favoriteData.type} | ${favoriteData.consId}'),
      leading: CircleAvatar(child: Icon(iconData())),
      trailing: select
          ? Checkbox(
              value: favoriteData.selected,
              onChanged: (checked) {
                favoriteData.selected = checked!;
                setState(() {});
              })
          : IconButton(
              onPressed: () {},
              icon: const Icon(Icons.payments),
            ),
      onLongPress: select ? null : callback,
    );
  }
}
