import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kokok_pay/resources/asset_manager.dart';
import 'package:kokok_pay/screens/edl/edl_provider.dart';
import 'package:provider/provider.dart';

class EdlScreen extends StatefulWidget {
  const EdlScreen({Key? key}) : super(key: key);

  @override
  State<EdlScreen> createState() => _EdlScreenState();
}

class _EdlScreenState extends State<EdlScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EdlProvider>(
      create: (ctx) => EdlProvider(context)..init(),
      child: const _EdlScreenMain(),
    );
  }
}

///
class _EdlScreenMain extends StatefulWidget {
  const _EdlScreenMain({Key? key}) : super(key: key);

  @override
  State<_EdlScreenMain> createState() => _EdlScreenMainState();
}

class _EdlScreenMainState extends State<_EdlScreenMain> {
  // final Color color = const Color(0xFF74b6d9);
  final Color color = const Color(0xff55b5e1);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text('EDL'),
        backgroundColor: color,
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            ImagesFile.edlBanner,
            height: 200,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 28),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(22),
                  topLeft: Radius.circular(22),
                ),
              ),
              child: Column(
                children: [
                  Text('EDL Payment', style: textTheme.titleMedium),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///#74b6d9
