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
      create: (ctx) => SettingProvider(context)..init(),
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
              child: const SizedBox(
                width: double.infinity,
                height: 150,
              ),
            ),
            Positioned(
              bottom: 20,
              left: 70,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: colorScheme.background,
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(52),
                  child: Image.asset(
                    ImagesFile.myPic,
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 80,
              child: Text(
                'Mr Inpone',
                style: textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Card(
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 8,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: context
                      .read<SettingProvider>()
                      .settingDataList
                      .map((settingData) => _getSettingChild(settingData))
                      .toList(),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _getSettingChild(SettingData settingData) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 60,
      child: ListTile(
        title: Text(settingData.title),
        subtitle: Text(settingData.subTitle),
        titleTextStyle: textTheme.titleSmall!.copyWith(
          fontWeight: FontWeight.bold,
          color: settingData.color,
        ),
        subtitleTextStyle: textTheme.bodyMedium,
        leading: CircleAvatar(
          backgroundColor: colorScheme.primary,
          radius: 18,
          child: Icon(settingData.icon, color: colorScheme.onPrimary, size: 22),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        trailing: settingData.verify
            ? const Icon(
                Icons.check_circle,
                color: Colors.green,
              )
            : const Icon(
                Icons.arrow_forward_ios_sharp,
                size: 18,
              ),
        onTap: () {},
      ),
    );
  }
}
