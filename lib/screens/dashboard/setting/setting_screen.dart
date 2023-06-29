import 'package:flutter/material.dart';
import 'package:kokok_pay/resources/asset_manager.dart';
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
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Stack(
          children: [
            CustomPaint(
              painter: SettingPainter(color: colorScheme.primary),
              child:  Container(
                width: double.infinity,
                color: Colors.red,
                height: 150,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Image.asset(
                  ImagesFile.myPic,
                  width: 60,
                  height: 60,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
