import 'package:flutter/material.dart';
import 'package:kokok_pay/application/application.dart';
import 'package:kokok_pay/models/enums/enums.dart';
import 'package:kokok_pay/models/model/error_model.dart';
import 'package:kokok_pay/models/model/model_resp.dart';
import 'package:kokok_pay/models/model/models.dart';
import 'package:kokok_pay/screens/widgets/dialog/dialog_impl.dart';

import '../../resources/routes_manager.dart';
import '../base/base_view_model.dart';

class HomeProvider extends BaseViewModel {
  HomeProvider(super.context);

  final CurrentUserDetails currentUser = instance<CurrentUserDetails>();
  WalletBalanceResp walletBalance = WalletBalanceResp(0, 418);
  bool _canShowBalance = false;
  List<StatementResp> miniStatements = [];

  void onBottomNavigationSelected(int selected) {}

  void logoutDialog() {
    YesNoDialogData yesNoDialogData = YesNoDialogData(
      title: 'Warning',
      subTitle: 'Do you want to Logout?',
      iconData: Icons.help_outline,
    );
    YesNoDialog yesNoDialog = YesNoDialog(context, yesNoDialogData, _logout);
    yesNoDialog.show();
  }

  void _logout() async {
    progressDialog.show();
    (await repository.logout()).fold(
      (Failure failure) {
        progressDialog.dismiss();
        dialogUtil.showFailureDialog(context, failure);
      },
      (void v) {
        progressDialog.dismiss();
        Navigator.of(context).pushReplacementNamed(Routes.loginScreen);
      },
    );
  }

  void getBalance() async {
    /*progressDialog.show();
    (await repository.getWalletBalance()).fold(
      (Failure failure) {
        progressDialog.dismiss();
        dialogUtil.showFailureDialog(context, failure);
      },
      (WalletBalanceResp walletBalance) {
        progressDialog.dismiss();
        this.walletBalance = walletBalance;
        _canShowBalance = true;
        notifyListeners();
      },
    );*/

    //delete it

    walletBalance = WalletBalanceResp(23454, 432);
    _canShowBalance = true;
    notifyListeners();
  }

  void routeQrScreen() {
    Navigator.of(context).pushNamed(Routes.qrScreen);
  }

  void getMiniStatement() async {
    // progressDialog.show();
    // (await repository.getMiniStatement()).fold(
    //   (Failure failure) {
    //     progressDialog.dismiss();
    //     dialogUtil.showFailureDialog(context, failure);
    //   },
    //   (List<StatementResp> statements) {
    //     progressDialog.dismiss();
    //     miniStatements = statements;
    //     notifyListeners();
    //   },
    // );

    //delete it
    currentUser.fullName = 'Ritunjay kumar';
    miniStatements.addAll([
      StatementResp(3243242, 420, 'txn description', TxnMode.credit, 'Success', DateTime.now(),
          'txnRefId', 'billRefId'),
      StatementResp(3243242, 420, 'txn description', TxnMode.credit, 'Success', DateTime.now(),
          'txnRefId', 'billRefId'),
      StatementResp(3243242, 420, 'txn description', TxnMode.credit, 'Success', DateTime.now(),
          'txnRefId', 'billRefId'),
      StatementResp(3243242, 420, 'txn description', TxnMode.credit, 'Success', DateTime.now(),
          'txnRefId', 'billRefId'),
      StatementResp(3243242, 420, 'txn description', TxnMode.credit, 'Success', DateTime.now(),
          'txnRefId', 'billRefId'),
      StatementResp(3243242, 420, 'txn description', TxnMode.credit, 'Success', DateTime.now(),
          'txnRefId', 'billRefId'),
      StatementResp(3243242, 420, 'txn description', TxnMode.credit, 'Success', DateTime.now(),
          'txnRefId', 'billRefId'),
      StatementResp(3243242, 420, 'txn description', TxnMode.credit, 'Success', DateTime.now(),
          'txnRefId', 'billRefId'),
      StatementResp(3243242, 420, 'txn description', TxnMode.credit, 'Success', DateTime.now(),
          'txnRefId', 'billRefId'),
      StatementResp(3243242, 420, 'txn description', TxnMode.credit, 'Success', DateTime.now(),
          'txnRefId', 'billRefId'),
      StatementResp(3243242, 420, 'txn description', TxnMode.credit, 'Success', DateTime.now(),
          'txnRefId', 'billRefId'),
      StatementResp(3243242, 420, 'txn description', TxnMode.credit, 'Success', DateTime.now(),
          'txnRefId', 'billRefId'),
      StatementResp(3243242, 420, 'txn description', TxnMode.credit, 'Success', DateTime.now(),
          'txnRefId', 'billRefId'),
      StatementResp(3243242, 420, 'txn description', TxnMode.credit, 'Success', DateTime.now(),
          'txnRefId', 'billRefId'),
      StatementResp(3243242, 420, 'txn description', TxnMode.credit, 'Success', DateTime.now(),
          'txnRefId', 'billRefId'),
    ]);
    notifyListeners();
  }

  bool get canShowBalance => _canShowBalance;
}
