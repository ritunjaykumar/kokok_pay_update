import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '/resources/asset_manager.dart';
import '/screens/before/splash/splash_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SplashProvider>(
      create: (ctx) => SplashProvider(ctx),
      child: const _SplashScreenMain(),
    );
  }
}

class _SplashScreenMain extends StatefulWidget {
  const _SplashScreenMain({Key? key}) : super(key: key);

  @override
  State<_SplashScreenMain> createState() => _SplashScreenMainState();
}

class _SplashScreenMainState extends State<_SplashScreenMain> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<SplashProvider>().checkScreenStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: colorScheme.primary
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        color: colorScheme.primary,
        child: LottieBuilder.asset(LottieFile.progressLottie),
      ),
    );
  }
}
