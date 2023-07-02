import 'package:flutter/material.dart';
import 'package:kokok_pay/resources/asset_manager.dart';
import 'package:kokok_pay/screens/support/support_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SupportProvider>(
      create: (ctx) => SupportProvider(context)..init(),
      child: const _SupportScreenMain(),
    );
  }
}

///
class _SupportScreenMain extends StatefulWidget {
  const _SupportScreenMain({Key? key}) : super(key: key);

  @override
  State<_SupportScreenMain> createState() => _SupportScreenMainState();
}

class _SupportScreenMainState extends State<_SupportScreenMain> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: colorScheme.onPrimary,
      appBar: AppBar(
        title: const Text('Support'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Lottie.asset(LottieFile.contactUs, height: 200),
                        Text(
                          'Need Support',
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Have any issue while using the app, please feel free to reach us',
                          style: textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  _getListTile('Contact us', '+856 20598543526', Icons.phone_android),
                  _getListTile('Message Us', 'Text us your query', Icons.message),
                  _getListTile('Mail Us', 'info@kokkokpay.com', Icons.email),
                  _getListTile('Contact us', '+856 20598543526', Icons.phone),
                  _getListTile(
                      'WhatsApp Chat', 'Click here to chat with us on WhatsApp', Icons.call),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
                'Note: Our support service is active during office time only. You can contact us from 9.00 am to 6.00 pm'),
          ),
        ],
      ),
    );
  }

  Widget _getListTile(String title, String subTitle, IconData icon) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle, maxLines: 2),
      subtitleTextStyle: textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      titleTextStyle: textTheme.bodyMedium,
      leading: CircleAvatar(
        child: Icon(icon),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_sharp, size: 18, color: Colors.grey),
    );
  }
}
