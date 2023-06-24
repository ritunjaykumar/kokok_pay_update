import 'package:flutter/material.dart';
import 'package:kokok_pay/models/model/error_model.dart';
import 'package:kokok_pay/screens/widgets/dialog/dialog_impl.dart';
import 'package:kokok_pay/service/toast/toast_manager.dart';

import '../../service/network/dio_config/dio_config.dart';
import '../../service/storage/shared_preferences.dart';
import '../widgets/dialog/dialog_util.dart';
import '/application/application.dart';
import '/service/network/repository/repository.dart';
import '/service/network/repository/repository_impl.dart';

class BaseViewModel extends ChangeNotifier {
  @protected
  final Repository repository;
  @protected
  final DioImpl dioImpl;
  @protected
  final BuildContext context;
  @protected
  final LocalStorage localStorage;
  @protected
  final ProgressDialog progressDialog;
  @protected
  final DialogUtil dialogUtil;

  @protected
  final NativeToastService nativeToast;

  BaseViewModel(this.context)
      : repository = instance<RepositoryImpl>(),
        dioImpl = instance<DioImpl>(),
        localStorage = instance<LocalStorage>(),
        dialogUtil = instance<DialogUtil>(),
        nativeToast = NativeToastService(),
        progressDialog = ProgressDialog(context);

  @protected
  void checkSession(Failure failure) {
    var respCode = failure.respCode;
    if (respCode is String && respCode == 'MPAY007') {
      //todo navigate to login page
    }
    dialogUtil.showFailureDialog(context, failure);
  }
}
