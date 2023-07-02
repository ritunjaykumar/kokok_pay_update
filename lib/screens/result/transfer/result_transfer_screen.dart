import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kokok_pay/application/application.dart';
import 'package:kokok_pay/resources/asset_manager.dart';
import 'package:kokok_pay/screens/result/transfer/result_transfer_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:ui' as ui;

class ResultTransferScreen extends StatefulWidget {
  const ResultTransferScreen({Key? key}) : super(key: key);

  @override
  State<ResultTransferScreen> createState() => _ResultTransferScreenState();
}

class _ResultTransferScreenState extends State<ResultTransferScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ResultTransferProvider>(
      create: (ctx) => ResultTransferProvider(context)..init(),
      child: const _ResultTransferScreenMain(),
    );
  }
}

///
class _ResultTransferScreenMain extends StatefulWidget {
  const _ResultTransferScreenMain({Key? key}) : super(key: key);

  @override
  State<_ResultTransferScreenMain> createState() => _ResultTransferScreenMainState();
}

class _ResultTransferScreenMainState extends State<_ResultTransferScreenMain> {

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
            name: 'transfer_txn_result.png',
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Result'),
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
                      'Payment Success',
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
                          'Transaction Amount',
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
                            _getTileList('transaction fee', '₭ 300'),
                            _getTileList('Transaction Id', '1238763492347'),
                            _getTileList('Sender', 'Mr. Inpone'),
                            _getTileList('Receiver', 'Mr. Fragrance'),
                            _getTileList('Date', '2023-06-20'),
                            _getTileList('Time', '12:34:97 PM'),
                            _getTileList('Description', 'test payment'),
                            _getTileList('transaction type', 'customer'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
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
