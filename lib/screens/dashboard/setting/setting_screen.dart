import 'package:flutter/material.dart';
import 'package:kokok_pay/screens/dashboard/setting/setting_provider.dart';
import 'package:kokok_pay/screens/painter/setting_painter.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SettingProvider>(
      create: (ctx) => SettingProvider(context),
      child: const _SettingScreenMain(),
    );
  }
}

///
class _SettingScreenMain extends StatefulWidget {
  const _SettingScreenMain({Key? key}) : super(key: key);

  @override
  State<_SettingScreenMain> createState() => _SettingScreenMainState();
}

class _SettingScreenMainState extends State<_SettingScreenMain> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Stack(
          children: [
            CustomPaint(
              painter: SettingPainter(),
              child: const SizedBox(
                width: double.infinity,
                height: 150,
              ),
            )
          ],
        )
      ],
    );
  }
}
