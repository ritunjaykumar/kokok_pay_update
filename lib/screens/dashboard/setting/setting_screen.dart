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
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _getSettingChild(
                        'Profile', 'see and update your profile details', Icons.person),
                    _getSettingChild('Security Pin', 'change your login pin', Icons.security),
                    _getSettingChild(
                        'Biometry Login', 'Change your biometric preferences', Icons.fingerprint),
                    _getSettingChild(
                        'E-KYC', 'update your E-kyc', Icons.verified_user_outlined, true),
                    _getSettingChild('Logout', 'Logout your KokKok pay', Icons.logout),
                    _getSettingChild('Share App', 'share with your friends', Icons.share),
                    _getSettingChild(
                        'Clear Data', 'clear all cached data', Icons.cleaning_services_rounded),
                    _getSettingChild('1.1.0', 'app version', Icons.info_outline),
                    _getSettingChild('Delete Account', 'suspended your account',
                        Icons.delete_forever, false, Colors.red),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _getSettingChild(String title, String subTitle, IconData icon,
      [bool verify = false, Color? color]) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 60,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        titleTextStyle: textTheme.titleSmall!.copyWith(
          fontWeight: FontWeight.bold,
          color: color,
        ),
        subtitleTextStyle: textTheme.bodyMedium,
        leading: CircleAvatar(
          backgroundColor: colorScheme.primary,
          radius: 18,
          child: Icon(icon, color: colorScheme.onPrimary, size: 22),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        trailing: verify
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
