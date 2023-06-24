import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';

import '../../../models/model/model_resp.dart';
import '../../../models/model/models.dart';
import '/resources/asset_manager.dart';
import '/resources/size_manager.dart';

part 'dialog_impl.widget.dart';

abstract class BaseDialog {
  @protected
  final BuildContext context;

  const BaseDialog(this.context);

  void show();

  void dismiss() {
    if (_isDialogOpen()) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }

  bool _isDialogOpen() {
    return ModalRoute.of(context)?.isCurrent != true;
  }
}

class ErrorDialog extends BaseDialog {
  const ErrorDialog(super.context, [this.msg]);

  final String? msg;

  @override
  void show() {
    showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          child: _ErrorDialogWidget(dismiss, errorMsg: msg),
        );
      },
    );
  }
}

class ProgressDialog extends BaseDialog {
  const ProgressDialog(super.context);

  @override
  void show() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: const Dialog(
            shape: CircleBorder(),
            insetPadding: EdgeInsets.all(SizeResource.value_120),
            child: _ProgressDialogWidget(),
          ),
        );
      },
    );
  }
}

class NetworkErrorDialog extends BaseDialog {
  const NetworkErrorDialog(super.context, this._retry);

  final VoidCallback _retry;

  @override
  void show() {
    showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          child: _NetworkErrorDialogWidget(
            dismiss,
            _retry,
          ),
        );
      },
    );
  }
}

class SuccessDialog extends BaseDialog {
  const SuccessDialog(super.context, this._message, this._okCallback);

  final VoidCallback? _okCallback;
  final String _message;

  @override
  void show() {
    showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          child: _SuccessDialogWidget(_message, dismiss, _okCallback),
        );
      },
    );
  }
}

class ConfirmationDialog extends BaseDialog {
  ConfirmationDialog(
    super.context, {
    required this.title,
    required this.body,
    required this.callback,
  });

  final String title;
  final String body;
  VoidCallback callback;

  @override
  void show() {
    showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          child: _ConfirmationDialogWidget(
            title,
            body,
            dismiss,
            callback,
          ),
        );
      },
    );
  }
}

class BankDataDialog extends BaseDialog {
  BankDataDialog(super.context, this.bankData, this.callback);

  final List<BankDataResp> bankData;
  final void Function(BankDataResp bakData) callback;

  @override
  void show() {
    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext ctx, Animation<double> a1, Animation<double> a2) {
        return Container();
      },
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: Dialog(
              child: _BankDialogWidget(
                bankData: bankData,
                onTabCallback: callback,
                dismissCallback: dismiss,
              ),
            ),
          ),
        );
      },
    );
  }
}

class YesNoDialog extends BaseDialog {
  const YesNoDialog(
    super.context,
    this.yesNoDialogData,
    this._yesCallback, [
    this._dismissCallback,
  ]);

  final YesNoDialogData yesNoDialogData;
  final VoidCallback _yesCallback;
  final VoidCallback? _dismissCallback;

  @override
  void show() {
    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext ctx, Animation<double> a1, Animation<double> a2) {
        return Container();
      },
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: Dialog(
              child: _YesNoDialogWidget(
                _yesCallback,
                dismiss,
                _dismissCallback,
                yesNoDialogData: yesNoDialogData,
              ),
            ),
          ),
        );
      },
    );

    /* showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          child: _YesNoDialogWidget(
            _yesCallback,
            dismiss,
            yesNoDialogData: yesNoDialogData,
          ),
        );
      },

    );*/
  }
}
