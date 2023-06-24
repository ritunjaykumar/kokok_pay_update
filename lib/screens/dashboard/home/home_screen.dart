import 'package:flutter/material.dart';
import 'package:kokok_pay/resources/asset_manager.dart';
import 'package:kokok_pay/screens/dashboard/home/home_provider.dart';
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
              _topPartWidget(),
              Expanded(child: _bottomPartWidget()),
            ],
          ),
          Positioned(
            right: 20,
            bottom: 10,
            child: FloatingActionButton.extended(
              onPressed: () {},
              label: const Text('Scan & Pay'),
              icon: const Icon(Icons.qr_code_scanner),
            ),
          )
        ],
      ),
    );
  }

  Widget _topPartWidget() {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     colors: [
      //       colorScheme.primary,
      //       colorScheme.primaryContainer,
      //     ],
      //
      //   )
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(height: 20),
          Text(
            'Hello',
            style: textTheme.bodyLarge?.copyWith(
              color: colorScheme.onPrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Mr. Inpone',
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Text(
          //   'Available Balance',
          //   style: textTheme.bodyMedium?.copyWith(
          //     color: colorScheme.onPrimary,
          //   ),
          // ),
          Consumer<HomeProvider>(
            builder: (ctx, homeProvider, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    homeProvider.isAmountHidden ? '₭ ${homeProvider.amount}' : 'XXXXXXXXXXX',
                    style: textTheme.titleLarge?.copyWith(
                      color: colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: homeProvider.amountHiddenToggle,
                        icon: Icon(
                          homeProvider.isAmountHidden ? Icons.visibility_off : Icons.visibility,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.refresh),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  label: const Text('My Qr'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(colorScheme.primaryContainer),
                    foregroundColor: MaterialStatePropertyAll<Color>(colorScheme.primary),
                  ),
                  icon: Image.asset(
                    ImagesFile.scanQr,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  label: const Text('Add Money'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(colorScheme.primaryContainer),
                    foregroundColor: MaterialStatePropertyAll<Color>(colorScheme.primary),
                  ),
                  icon: Image.asset(
                    ImagesFile.addMoney,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ],
          ),
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
          topRight: Radius.circular(32),
          topLeft: Radius.circular(32),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Transactions',
                  style: textTheme.titleLarge,
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
                return ListView.builder(
                  itemCount: homeProvider.transactionData.length,
                  itemBuilder: (ctx, i) {
                    TransactionData transactionData = homeProvider.transactionData[i];
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
}
