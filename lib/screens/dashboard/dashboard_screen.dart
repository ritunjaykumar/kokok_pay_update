import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kokok_pay/resources/asset_manager.dart';
import 'package:kokok_pay/screens/dashboard/dashboard_provider.dart';
import 'package:kokok_pay/screens/dashboard/more/more_provider.dart';
import 'package:kokok_pay/screens/widgets/menu/bottom_navigation.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DashboardProvider>(
      create: (ctx) => DashboardProvider(context)..init(),
      child: const _DashboardScreenMain(),
    );
  }
}

///
class _DashboardScreenMain extends StatefulWidget {
  const _DashboardScreenMain({Key? key}) : super(key: key);

  @override
  State<_DashboardScreenMain> createState() => _DashboardScreenMainState();
}

class _DashboardScreenMainState extends State<_DashboardScreenMain> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Consumer<DashboardProvider>(
          builder: (ctx, dashboardProvider, child) {
            return Text(dashboardProvider.title);
          },
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: colorScheme.onPrimary,
        ),
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              ImagesFile.myPic,
              fit: BoxFit.fill,
            ),
          ),
        ),
        actions: [
          /*Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Badge(
              label: const Text('34'),
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorScheme.onPrimary,
                ),
                child: Icon(
                  Icons.notifications_rounded,
                  color: colorScheme.primary,
                ),
              ),
            ),
          ),*/
          PopupMenuButton<String>(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            icon: const Icon(Icons.menu),
            onSelected: (String path){
             Navigator.of(context).pushNamed(path);
            },
            itemBuilder: (ctx) {
              return context.read<DashboardProvider>().menuItems.map(
                (e) {
                  return PopupMenuItem<String>(
                    value: e.path,
                    child: _getMenuItem(e),
                  );
                },
              ).toList();
            },
          ),
        ],
      ),
      body: Consumer<DashboardProvider>(
        builder: (ctx, dashboardProvider, child) {
          return dashboardProvider.screen;
        },
      ),
      bottomNavigationBar: Consumer<DashboardProvider>(
        builder: (ctx, dashboardProvider, child) {
          return AnimatedNavigationWidget(
            onTap: dashboardProvider.navigationListener,
            currentIndex: dashboardProvider.currentIndex,
            item: dashboardProvider.menuItem,
            navigationDecoration: NavigationDecoration(
              duration: const Duration(milliseconds: 400),
              backgroundColor: colorScheme.primary,
              selectedColor: colorScheme.primary,
              unselectedColor: colorScheme.secondary,
            ),
          );
        },
      ),
    );
  }

  Widget _getMenuItem(MenuItemData menuItem) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Icon(
          menuItem.icon,
          color: Colors.black,
        ),
        const SizedBox(width: 4),
        Text(menuItem.title, style: textTheme.titleSmall)
      ],
    );
  }
}
