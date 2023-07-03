import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kokok_pay/models/model/model_resp.dart';
import 'package:kokok_pay/utils/util/date_time_formatter.dart';
import 'package:provider/provider.dart';

import '/resources/asset_manager.dart';
import '/resources/size_manager.dart';
import '/screens/home/home_provider.dart';
import '../../models/enums/enums.dart';
import '../painter/home_background_clipper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
      create: (ctx) => HomeProvider(ctx),
      child: const _HomeScreenMain(),
    );
  }
}

class _HomeScreenMain extends StatefulWidget {
  const _HomeScreenMain({Key? key}) : super(key: key);

  @override
  State<_HomeScreenMain> createState() => _HomeScreenMainState();
}

class _HomeScreenMainState extends State<_HomeScreenMain> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<HomeProvider>().getMiniStatement();
    });
  }

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    Locale selectedLocale = Localizations.localeOf(context);
    return const Scaffold(
      bottomNavigationBar: _BottomNavigationWidget(),
      body: Column(
        children: [
          _TopContainer(),
          _TopBackgroundWidget(),
          _ProfilesDetails(),
          _RecentTransactionHeading(),
          Expanded(child: _RecentTransaction()),
          _BottomMenu(),
        ],
      ),
    );
  }
}

//

//bottom navigation Bar
class _BottomNavigationWidget extends StatelessWidget {
  const _BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (ctx, homeProvider, child) {
        return BottomNavigationBar(
          onTap: homeProvider.onBottomNavigationSelected,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.contact_support_outlined), label: 'Support'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Messages'),
            BottomNavigationBarItem(icon: Icon(Icons.person_3_outlined), label: 'Profile'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
            BottomNavigationBarItem(icon: Icon(Icons.keyboard_double_arrow_up), label: 'More'),
          ],
        );
      },
    );
  }
}

//top Container
class _TopContainer extends StatelessWidget {
  const _TopContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: SizeResource.value_36,
      color: theme.colorScheme.primary,
    );
  }
}

//bottom menu
class _BottomMenu extends StatelessWidget {
  const _BottomMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: SizeResource.value_8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BottomMenuItem(
            title: 'My Qr',
            image: ImagesFile.homeQr,
            callback: context.read<HomeProvider>().routeQrScreen,
          ),
          _BottomMenuItem(
            title: 'Scan & Pay',
            image: ImagesFile.scanQr,
            height: SizeResource.value_90,
            callback: () {},
          ),
          _BottomMenuItem(
            title: 'Add Money',
            image: ImagesFile.addMoney,
            callback: () {},
          ),
        ],
      ),
    );
  }
}

//bottom menu item

class _BottomMenuItem extends StatelessWidget {
  const _BottomMenuItem({
    Key? key,
    required this.title,
    required this.image,
    this.height = SizeResource.value_70,
    required this.callback,
  }) : super(key: key);
  final String image;
  final double height;
  final VoidCallback callback;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(SizeResource.value_22),
          onTap: callback,
          splashColor: theme.colorScheme.primary,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(SizeResource.value_22),
            child: Image.asset(
              image,
              height: height,
            ),
          ),
        ),
        Text(title)
      ],
    );
  }
}

//recent transaction
class _RecentTransactionHeading extends StatelessWidget {
  const _RecentTransactionHeading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: SizeResource.value_12,
        vertical: SizeResource.value_12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.notifications),
              Text(
                'Recent Transaction',
                style: theme.textTheme.titleMedium,
              ),
            ],
          ),
          Text(
            'My Payments',
            style: theme.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}

class _RecentTransaction extends StatelessWidget {
  const _RecentTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: SizeResource.value_12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeResource.value_12),
        color: theme.colorScheme.onPrimary,
      ),
      child: Consumer<HomeProvider>(
        builder: (_, homeProvider, child) {
          return homeProvider.miniStatements.isEmpty
              ? child!
              : ListView.separated(
                  itemCount: homeProvider.miniStatements.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (ctx, i) {
                    return _RecentItemWidget(
                      homeProvider.miniStatements[i],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      color: theme.colorScheme.secondaryContainer,
                      width: double.infinity,
                      height: 1,
                    );
                  },
                );
        },
        child: const Center(
          child: Text('Transaction not found'),
        ),
      ),
    );
  }
}

//recent items
class _RecentItemWidget extends StatelessWidget {
  const _RecentItemWidget(this.miniStatement, {Key? key}) : super(key: key);
  final StatementResp miniStatement;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: _StatusWidget(txnMode: miniStatement.txnMode),
      title: Text(miniStatement.txnMode.getMessage()),
      // titleTextStyle: theme.textTheme.titleMedium?.copyWith(
      //   color: theme.colorScheme.error,
      //   fontWeight: FontWeight.w600,
      // ),
      subtitle: Text(miniStatement.txnDesc),
      // subtitleTextStyle: theme.textTheme.bodySmall,
      selectedTileColor: Colors.blueGrey,
      contentPadding: const EdgeInsets.symmetric(horizontal: SizeResource.value_8),
      horizontalTitleGap: SizeResource.value_8,
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(DateTimeFormatter().getFullFormat(miniStatement.txnDate)),
          Text(
            '${miniStatement.txnAmount} ${miniStatement.txnCurrency == 416 ? 'LAK' : "LAK"}',
            style: theme.textTheme.bodyMedium
                ?.copyWith(color: theme.colorScheme.error, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

//leading status widget

class _StatusWidget extends StatelessWidget {
  const _StatusWidget({Key? key, required this.txnMode}) : super(key: key);
  final TxnMode txnMode;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(SizeResource.value_4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: theme.colorScheme.primary,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(SizeResource.value_2),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          shape: BoxShape.circle,
        ),
        child: Icon(
          txnMode == TxnMode.debit ? Icons.arrow_upward : Icons.arrow_downward,
          color: theme.colorScheme.onPrimary,
        ),
      ),
    );
  }
}

//profiles widget
class _ProfilesDetails extends StatelessWidget {
  const _ProfilesDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<HomeProvider>(
      builder: (ctx, homeProvider, child) {
        return ListTile(
          title: Text(
            'Hello, ${homeProvider.currentUser.fullName}',
            style: theme.textTheme.titleMedium,
          ),
          subtitle: homeProvider.canShowBalance
              ? Text(
                  '${homeProvider.walletBalance.amount}',
                  style: theme.textTheme.titleLarge,
                )
              : child!,
          trailing: OutlinedButton(
            onPressed: homeProvider.getBalance,
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(
                  horizontal: SizeResource.value_8,
                ),
              ),
            ),
            child: const Text('Show Balance'),
          ),
        );
      },
      child: const Text(''),
    );
  }
}

//for background
class _TopBackgroundWidget extends StatelessWidget {
  const _TopBackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        ClipPath(
          clipper: HomeBackgroundClipper(),
          child: Image.asset(
            ImagesFile.homeBackground,
          ),
        ),
        Positioned.fill(
          top: 80,
          child: ClipPath(
            clipper: HomeBackgroundClipperBottom(),
            child: Padding(
              padding: const EdgeInsets.only(top: 22),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: context.read<HomeProvider>().logoutDialog,
                    icon: const Icon(Icons.power_settings_new_sharp),
                    color: theme.colorScheme.primary,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.language),
                    color: theme.colorScheme.primary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
