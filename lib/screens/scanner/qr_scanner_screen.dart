import 'package:flutter/material.dart';
import 'package:kokok_pay/screens/scanner/qr_scanner_provider.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({Key? key}) : super(key: key);

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QrScannerProvider>(
      create: (ctx) => QrScannerProvider(context)..init(),
      child: const _QrScannerScreenMain(),
    );
  }
}

///
class _QrScannerScreenMain extends StatefulWidget {
  const _QrScannerScreenMain({Key? key}) : super(key: key);

  @override
  State<_QrScannerScreenMain> createState() => _QrScannerScreenMainState();
}

class _QrScannerScreenMainState extends State<_QrScannerScreenMain> {
  final MobileScannerController _mobileScannerController = MobileScannerController(
    detectionSpeed: DetectionSpeed.normal,
    facing: CameraFacing.back,
  );

  bool _doingProcess = true;

  void _onQrDetect(BarcodeCapture? capture) {
    if (_doingProcess) {
      _doingProcess = false;
      if()


      List<Map<String,dynamic>> rawData = capture!.raw;
      print('raw data: $rawData');


      _doingProcess = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan and pay'),
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: _mobileScannerController,
            onDetect: _onQrDetect,
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  backgroundColor: colorScheme.primary,
                  child: ValueListenableBuilder(
                    valueListenable: _mobileScannerController.torchState,
                    builder: (context, state, child) {
                      return Icon(
                        state == TorchState.off ? Icons.flash_off : Icons.flash_on,
                        color: colorScheme.onPrimary,
                      );
                    },
                  ),
                  onPressed: () => _mobileScannerController.toggleTorch(),
                ),
                const SizedBox(width: 20),
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: colorScheme.primary,
                  child: Icon(
                    Icons.image,
                    color: colorScheme.onPrimary,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
//Icon(_torchEnable ? Icons.flash_on : Icons.flash_off)
