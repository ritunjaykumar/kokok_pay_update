import 'package:flutter/material.dart';
import 'package:kokok_pay/resources/asset_manager.dart';
import 'package:kokok_pay/resources/routes_manager.dart';
import 'package:kokok_pay/screens/dashboard/home/home_provider.dart';
import 'package:kokok_pay/screens/dashboard/more/more_provider.dart';
import 'package:kokok_pay/screens/dashboard/more/more_screen.dart';
import 'package:kokok_pay/screens/painter/background_painter.dart';
import 'package:kokok_pay/screens/painter/qr_screen_painter.dart';
import 'package:kokok_pay/screens/widgets/widget/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
      create: (ctx) => HomeProvider(context)..init(),
      child: const _HomeScreenMain(),
    );
  }
}

///
class _HomeScreenMain extends StatefulWidget {
  const _HomeScreenMain({Key? key}) : super(key: key);

  @override
  State<_HomeScreenMain> createState() => _HomeScreenMainState();
}

class _HomeScreenMainState extends State<_HomeScreenMain> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);
    return Container(
      // color: colorScheme.primary,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primary,
            colorScheme.primaryContainer,
          ],
          begin: Alignment.topCenter,
          end: Alignment.center,
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              // _topPartWidget(),
              _cardUi(),

              ///
              // const MoreScreen(),
              Expanded(child: _bottomPartWidget()),
            ],
          ),
          Positioned(
            right: 20,
            bottom: 10,
            child: FloatingActionButton.extended(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.qrScannerScreen);
              },
              label: Text(
                'Scan & Pay',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onPrimary,
                ),
              ),
              icon: Icon(
                Icons.qr_code_scanner,
                color: colorScheme.onPrimary,
              ),
            ),
          )
        ],
      ),
    );
  }


  Widget _bottomPartWidget() {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        color: colorScheme.background,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(22),
          topLeft: Radius.circular(22),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Transactions',
                  style: textTheme.titleMedium,
                ),
                IconButton(
                  onPressed: () {},
                  splashColor: colorScheme.secondary,
                  icon: Icon(
                    Icons.filter_list,
                    color: colorScheme.primary,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Consumer<HomeProvider>(
              builder: (ctx, homeProvider, child) {
                var length = homeProvider.transactionData.length;
                return ListView.builder(
                  //I added 1 for extra space in bottom
                  itemCount: length,
                  itemBuilder: (ctx, i) {
                    TransactionData transactionData = homeProvider.transactionData[i];
                    if (length == i + 1) {
                      return const ListTile();
                    } else {
                      return ListTile(
                        minVerticalPadding: 0,
                        title: Text(transactionData.to),
                        subtitle: Text(
                          '${transactionData.cur} ${transactionData.amount}',
                          style: textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: _getStatusIndicator(transactionData.type),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(transactionData.date),
                            Text(
                              transactionData.type,
                              style: textTheme.bodyMedium?.copyWith(
                                color: _getColor(transactionData.type),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  // separatorBuilder: (BuildContext context, int index) {
                  //   return const Padding(
                  //     padding: EdgeInsets.symmetric(horizontal: 16),
                  //     child: Divider(),
                  //   );
                  // },
                );
              },
            ),
          )
        ],
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

  Widget _cardUi() {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    Widget getCardUiItem(MenuItemData menuItemData) {
      return InkWell(
        onTap: () {
          if (menuItemData.path! == 'billPayment') {
            _showBillPaymentOption();
            return;
          }
          Navigator.of(context).pushNamed(menuItemData.path!);
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(child: Icon(menuItemData.icon)),
              const SizedBox(height: 4),
              Text(menuItemData.title),
            ],
          ),
        ),
      );
    }

    Widget getBottomCardUi(String title, IconData icon, String path) {
      return InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(path);
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
          child: Row(
            children: [
              // CircleAvatar(child: Icon(icon)),
              Icon(
                icon,
                color: Colors.black,
              ),
              const SizedBox(width: 12),
              Text(title),
            ],
          ),
        ),
      );
    }

    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Mr. Inpone', style: textTheme.titleMedium),
                  Text(
                    '₭ 7236474',
                    style: textTheme.bodyLarge?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:
                  context.read<HomeProvider>().menuItems.map((e) => getCardUiItem(e)).toList(),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getBottomCardUi('Favorite', Icons.favorite, Routes.favoriteScreen),
                getBottomCardUi('Support', Icons.support_agent, Routes.supportScreen),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _showBillPaymentOption() {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    Widget getItem(String title, String route, String image ,[Object? args]) {
      return ListTile(
        leading: CircleAvatar(child: Image.asset(image,height: 32, width: 32,)),
        title: Text(title),
        onTap: () {
          Navigator.of(context).pushReplacementNamed(route, arguments: args);
        },
        trailing: const Icon(
          Icons.arrow_forward_ios_sharp,
          size: 18,
        ),
        titleTextStyle: textTheme.titleMedium,
      );
    }

    showDialog(
        context: context,
        builder: (ctx) {
          return Dialog(
            insetPadding: const EdgeInsets.all(24),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const DialogAppbar(title: 'Select Option'),
                getItem('Top up', Routes.topupScreen, UtilLogo.unitel),
                getItem('EDL', Routes.edlScreen, UtilLogo.edl, {'provider': 'edl'}),
                getItem('Nam Papa', Routes.edlScreen, UtilLogo.nampapa, {'provider': 'nampapa'}),
                getItem('Insurance',Routes.insuranceScreen, UtilLogo.insurance),
                getItem('Leasing', 'Routes.edlScreen', UtilLogo.leasing),
                getItem('Tax', '', UtilLogo.tax),
                const SizedBox(height: 18),
              ],
            ),
          );
        });
  }
}

/////////////////////////////////
/*

class HorizontalPopupMenu<T> extends PopupMenuEntry<T>{
  const HorizontalPopupMenu({super.key, required this.menuHeight, required this.child});

  final double menuHeight;
  final Widget child;




  @override
  State<StatefulWidget> createState() =>_PopupMenuWidgetState();

  @override
  double get height => menuHeight;

  @override
  bool represents(T? value) {
    // TODO: implement represents
    throw UnimplementedError();
  }

}

class _PopupMenuWidgetState extends State<PopupMenuWidget> {
  @override
  Widget build(BuildContext context) => widget.child;
}









class PopupMenuWidget<T> extends PopupMenuEntry<T> {
  const PopupMenuWidget({ required Key key, required this.height, required this.child }) : super(key: key);

  @override
  final Widget child;

  @override
  final double height;

  @override
  bool get enabled => false;

  @override
  PopupMenuWidgetState createState() => PopupMenuWidgetState();

  @override
  bool represents(T? value) {
    // TODO: implement represents
    throw UnimplementedError();
  }
}

class PopupMenuWidgetState extends State<PopupMenuWidget> {
  @override
  Widget build(BuildContext context) => widget.child;
}*/
