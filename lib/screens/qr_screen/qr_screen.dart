import 'package:flutter/material.dart';
import 'package:kokok_pay/resources/asset_manager.dart';
import 'package:kokok_pay/screens/qr_screen/qr_provider.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({Key? key}) : super(key: key);

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QrProvider>(
      create: (ctx) => QrProvider(context),
      child: const _QrScreenMain(),
    );
  }
}

///
class _QrScreenMain extends StatefulWidget {
  const _QrScreenMain({Key? key}) : super(key: key);

  @override
  State<_QrScreenMain> createState() => _QrScreenMainState();
}

class _QrScreenMainState extends State<_QrScreenMain> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My QR'),
      ),
      body: Column(
        children: [
          Consumer<QrProvider>(
            builder: (ctx, qrProvider, child) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: QrImageView(
                  data: qrProvider.qrString,
                  version: QrVersions.auto,
                  size: 320,
                  backgroundColor: theme.colorScheme.onPrimary,
                  embeddedImage: const AssetImage(
                    ImagesFile.laoQRLogo,
                  ),
                  embeddedImageStyle: const QrEmbeddedImageStyle(
                    size: Size(50, 50),
                  ),
                  errorStateBuilder: (cxt, err) {
                    return const Center(
                      child: Text(
                        "Uh oh! Something went wrong...",
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                  padding: const EdgeInsets.all(12),
                  semanticsLabel: 'Qr image',
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(ImagesFile.placeholder),
            ),
          ),
        ],
      ),
    );
  }
}
