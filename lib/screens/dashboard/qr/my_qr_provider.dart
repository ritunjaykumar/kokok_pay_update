import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kokok_pay/application/application.dart';
import 'package:kokok_pay/screens/base/base_view_model.dart';
import 'dart:ui' as ui;

import 'package:kokok_pay/screens/dashboard/qr/my_qr_screen.dart';

class MyQrProvider extends BaseViewModel {
  MyQrProvider(super.context);

  final String _qrString =
      'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz';

  String get qrString => _qrString;

  Future<Uint8List?> _qrToImage(GlobalKey repaintKey) async {
    RenderRepaintBoundary? renderObject =
        repaintKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
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

  void saveImage(GlobalKey repaintKey) async {
    var image = await _qrToImage(repaintKey);
    if (image == null) return;
  }

  void qrAmountBottomSheet() {
    _showBottomSheetDialog();
  }

  void _showBottomSheetDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      builder: (ctx) {
        return const DynamicQrEditor();
      },
    );
  }

  void shareImage(GlobalKey repaintKey) async {}
}
