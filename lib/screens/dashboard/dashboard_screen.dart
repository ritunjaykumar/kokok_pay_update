import 'package:flutter/material.dart';
import 'package:kokok_pay/resources/asset_manager.dart';
import 'package:kokok_pay/screens/dashboard/dashboard_provider.dart';
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
        title: Consumer<DashboardProvider>(
          builder: (ctx, dashboardProvider, child) {
            return Text(dashboardProvider.title);
          },
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              ImagesFile.myPic,
              fit: BoxFit.fill,
            ),
          ),
        ),
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
}
