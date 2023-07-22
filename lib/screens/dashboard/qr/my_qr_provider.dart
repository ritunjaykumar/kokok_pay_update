import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:kokok_pay/application/application.dart';
import 'package:kokok_pay/models/model/model_resp.dart';
import 'package:kokok_pay/resources/asset_manager.dart';
import 'package:kokok_pay/screens/base/base_view_model.dart';
import 'dart:ui' as ui;

import 'package:kokok_pay/screens/dashboard/qr/my_qr_screen.dart';
import 'package:kokok_pay/screens/widgets/common/bank_logo.dart';
import 'package:kokok_pay/service/toast/toast_data.dart';
import 'package:share_plus/share_plus.dart';

class MyQrProvider extends BaseViewModel {
  MyQrProvider(super.context);

  BankDataResp? _bankDataResp;
  String _qrString =
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
    Map<Object?, Object?> result = await ImageGallerySaver.saveImage(image);
    if(result['isSuccess'] != null && result['isSuccess'] as bool){
      nativeToast.showToast(ToastData.success(message: 'file saved: ${result['filePath']}'));
      logger.i(result['filePath']);
    }else{
      nativeToast.showToast(ToastData.success(message: 'qr did not save'));
    }
  }

  void qrAmountBottomSheet() {
    _showBottomSheetDialog();
  }

  void _showBottomSheetDialog() async {
    var qrData = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      builder: (ctx) {
        return const DynamicQrEditor();
      },
    );
    logger.i('qrData: $qrData');
    if (qrData != null && qrData is Map<String, dynamic>) {
      Map<String, dynamic> qrDataMap = qrData;
      var amount = qrDataMap['amount'];
      var description = qrDataMap['description'];
      _qrString = '$_qrString$amount$description';
      notifyListeners();
    }
  }

  void showBankListBottomSheet() async {
    _bankDataResp = await showModalBottomSheet(
      context: context,
      isDismissible: false,
      builder: (ctx) {
        return SelectBankWidget(
          bankList: _getDummyData(),
        );
      },
    );
    if (_bankDataResp != null) {
      notifyListeners();
    }
  }

  List<BankDataResp> _getDummyData() {
    return <BankDataResp>[
      BankDataResp(
          icon: '', url: BankLogoAsset.ib, bankId: '', name: 'Ib Bank', iosAppId: '', iosId: '', androidId: ''),
      BankDataResp(
          icon: '', url: BankLogoAsset.bic, bankId: '', name: 'Bic Bank', iosAppId: '', iosId: '', androidId: ''),
      BankDataResp(
          icon: '', url: BankLogoAsset.bankOfChina, bankId: '', name: 'Bank of china', iosAppId: '', iosId: '', androidId: ''),
      BankDataResp(
          icon: '', url: BankLogoAsset.bcel, bankId: '', name: 'Bcel', iosAppId: '', iosId: '', androidId: ''),
      BankDataResp(
          icon: '', url: BankLogoAsset.ldb, bankId: '', name: 'LDB', iosAppId: '', iosId: '', androidId: ''),
      BankDataResp(
          icon: '', url: BankLogoAsset.vietinBank, bankId: '', name: 'Vietin Bank', iosAppId: '', iosId: '', androidId: ''),
    ];
  }

  BankDataResp? get bankDataResp => _bankDataResp;

  bool _skipMultipleTap = true;

  void shareImage(GlobalKey repaintKey) async {
    if(_bankDataResp == null){
      nativeToast.showToast(ToastData.warning(message: 'please select bank'));
      return;
    }
    if (_skipMultipleTap) {
      _skipMultipleTap = false;
      var qrToImage = await _qrToImage(repaintKey);
      if (qrToImage == null) return;
      Share.shareXFiles(
        [
          XFile.fromData(
            qrToImage,
            name: 'ib_qr.png',
            mimeType: 'image/png',
            lastModified: DateTime.now(),
          ),
        ],
      );
      _skipMultipleTap = true;
    }
  }
}
