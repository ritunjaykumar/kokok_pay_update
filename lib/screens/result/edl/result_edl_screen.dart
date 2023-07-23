import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kokok_pay/application/application.dart';
import 'package:kokok_pay/resources/asset_manager.dart';
import 'package:kokok_pay/screens/result/edl/result_edl_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

import 'package:share_plus/share_plus.dart';

class ResultEdlScreen extends StatefulWidget {
  const ResultEdlScreen({Key? key}) : super(key: key);

  @override
  State<ResultEdlScreen> createState() => _ResultEdlScreenState();
}

class _ResultEdlScreenState extends State<ResultEdlScreen> {
  bool isFirstTime = true;
  late String screenType;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isFirstTime) {
      screenType = ModalRoute.of(context)?.settings.arguments as String;
      print('screenType: $screenType');
      isFirstTime = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ResultEdlProvider>(
      create: (ctx) => ResultEdlProvider(context,screenType)..init(),
      child: const _ResultEdlScreenMain(),
    );
  }
}

///
class _ResultEdlScreenMain extends StatefulWidget {
  const _ResultEdlScreenMain({Key? key}) : super(key: key);

  @override
  State<_ResultEdlScreenMain> createState() => _ResultEdlScreenMainState();
}

class _ResultEdlScreenMainState extends State<_ResultEdlScreenMain> {
  final GlobalKey _repaintKey = GlobalKey();
  bool _skipMultipleTap = true;

  void shareQr() async {
    if (_skipMultipleTap) {
      _skipMultipleTap = false;
      var qrToImage = await _qrToImage();
      if (qrToImage == null) return;
      Share.shareXFiles(
        [
          XFile.fromData(
            qrToImage,
            name: 'edl_txn_result.png',
            mimeType: 'image/png',
            lastModified: DateTime.now(),
          ),
        ],
      );
      _skipMultipleTap = true;
    }
  }

  Future<Uint8List?> _qrToImage() async {
    RenderRepaintBoundary? renderObject =
        _repaintKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    if (renderObject == null) {
      logger.i('unable to find the render object');
      return null;
    }
    ui.Image image = await renderObject.toImage(pixelRatio: 3.0);
    ByteData? imageByte = await image.toByteData(format: ui.ImageByteFormat.png);
    if (imageByte == null) {
      logger.i('image byte is null');
      return null;
    }
    return imageByte.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final screenType = context.read<ResultEdlProvider>().screenType;
    return Scaffold(
      appBar: AppBar(
        title: Text(screenType == 'edl' ? 'EDL Transaction' : 'Nam Papa Transaction'),
        actions: [
          IconButton(onPressed: shareQr, icon: const Icon(Icons.share)),
          IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Saved as favorite'),
                  ),
                );
              },
              icon: const Icon(Icons.star_border)),
          const SizedBox(width: 10)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Lottie.asset(
              LottieFile.successLottie2,
              width: 100,
              height: 100,
            ),
            RepaintBoundary(
              key: _repaintKey,
              child: Container(
                color: colorScheme.background,
                child: Column(
                  children: [
                    Text(
                      screenType == 'edl' ? 'EDL Bill Payment Success' : 'Nam Papa Payment Success',
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Bill Amount',
                          style: textTheme.bodyLarge,
                        ),
                        Text(
                          '₭ 1234780',
                          style: textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey.shade500,
                      margin: const EdgeInsets.only(top: 8),
                    ),
                    const SizedBox(height: 10),
                    Card(
                      margin: EdgeInsets.zero,
                      elevation: 0.8,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            _getTileList('Transaction fee', '₭ 10.0'),
                            _getTileList('Transaction Id', '1238763492347'),
                            _getTileList('Consumer Id', '873648728472384'),
                            _getTileList('Sender', 'Mr. Inpone'),
                            _getTileList('Receiver', 'EDL'),
                            _getTileList('Txn Date', '2023-06-20'),
                            _getTileList('Txn Time', '12:34:97 PM'),
                            _getTileList('Due Month', 'June'),
                            _getTileList('Due Year', '2023'),
                            _getTileList('Description',
                                screenType == 'edl' ? 'EDL Payment' : 'Nam papa Payment'),
                            _getTileList(
                                'Transaction type', screenType == 'edl' ? 'EDL' : 'Nam Papa'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Expanded(child: SizedBox()),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getTileList(String title, String value) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: textTheme.bodyMedium,
          ),
          Text(
            value,
            style: textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
