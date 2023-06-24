import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/resources/asset_manager.dart';
import '/resources/size_manager.dart';
import '/screens/before/start/start_provider.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => StartProvider(context),
      child: const _StartScreenMain(),
    );
  }
}

class _StartScreenMain extends StatefulWidget {
  const _StartScreenMain({Key? key}) : super(key: key);

  @override
  State<_StartScreenMain> createState() => _StartScreenMainState();
}

class _StartScreenMainState extends State<_StartScreenMain> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: Padding(
        padding: const EdgeInsets.all(SizeResource.value_12),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(SizeResource.value_22),
                    child: Image.asset(
                      ImagesFile.startLogo,
                    ),
                  ),
                  SizedBox(
                    width: SizeResource.value_100,
                    child: OutlinedButton(
                      onPressed: context.read<StartProvider>().routeTermConditionScreen,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: theme.colorScheme.background,
                        side: BorderSide(color: theme.colorScheme.background),
                      ),
                      child: const Text('Start'),
                    ),
                  ),
                ],
              ),
            ),
            const _VersionInfoWidget(),
          ],
        ),
      ),
    );
  }
}

class _VersionInfoWidget extends StatelessWidget {
  const _VersionInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<StartProvider>(
      builder: (ctx, startProvider, child) {
        return Column(
          children: [
            Text(
              startProvider.appPackageInfo.version,
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.tertiary,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'App Version',
              style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.background),
            ),
          ],
        );
      },
    );
  }
}
