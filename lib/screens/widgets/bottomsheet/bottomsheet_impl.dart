import 'package:flutter/material.dart';

import '/resources/size_manager.dart';
import '/screens/widgets/dialog/dialog_impl.dart';

part 'bottomsheet_imp.widget.dart';

class AlertBottomSheet extends BaseDialog {
  AlertBottomSheet(super.context, this.msg, this.title);

  final String msg;
  final String title;

  @override
  void show() {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      builder: (ctx) {
        return _AlertBottomSheetWidget(
          msg: msg,
          title: title,
          closeCallback: dismiss,
        );
      },
    );
  }
}
