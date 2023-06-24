// import 'package:flutter/material.dart';
// import 'package:kokok_pay/models/enums/enums.dart';
// import 'package:kokok_pay/models/model/error_model.dart';
// import 'package:kokok_pay/models/model/model_resp.dart';
// import 'package:kokok_pay/models/model/models.dart';
// import 'package:kokok_pay/resources/routes_manager.dart';
// import 'package:kokok_pay/screens/base/base_view_model.dart';
// import 'package:kokok_pay/screens/qr/qr_screen/qr_amount_screen.dart';
// import 'package:kokok_pay/screens/qr/qr_screen/qr_screen.dart';
// import 'package:kokok_pay/utils/extensions/string_extension.dart';
//
// import '../../../models/request/request_dto.dart';
// import '../../widgets/dialog/dialog_impl.dart';
//
// class QrProvider extends BaseViewModel {
//   QrProvider(super.context);
//
//   String qrString = '';
//   late UserProfileResp userProfileResp;
//   bool isLoadUserProfile = false;
//   List<BankDataResp> bankDataResp = [];
//   BankDataResp? _selectedBank;
//
//   void getProfileInfo() async {
//     /*progressDialog.show();
//     (await repository.getUserDetails()).fold(
//       (Failure failure) {
//         progressDialog.dismiss();
//         dialogUtil.showFailureDialog(context, failure);
//       },
//       (UserProfileResp userProfileResp) {
//         progressDialog.dismiss();
//         this.userProfileResp = userProfileResp;
//         isLoadUserProfile = true;
//         notifyListeners();
//         qrGenerate();
//       },
//     );*/
//
//     //delete it
//     userProfileResp = UserProfileResp(
//       address: 'address',
//       district: 'district',
//       firstName: 'Ritunjay',
//       lastName: 'Kumar',
//       email: 'ritunajy@cashlinkglobal.com',
//       dob: DateTime.now(),
//       gender: Gender.male,
//       kycStatus: 'y',
//       mobile: '8083816290',
//       nationality: 'Indian',
//       userId: '1234',
//       userType: 'user type',
//     );
//     isLoadUserProfile = true;
//     notifyListeners();
//     qrGenerate();
//   }
//
//   void qrGenerate({String? amount, String? purpose}) async {
//    /* QrReqDto qrReqDto = QrReqDto(amount, '418', purpose, 'W', null, userProfileResp.mobile);
//     progressDialog.show();
//     (await repository.qrGenerate(qrReqDto)).fold(
//       (Failure failure) {
//         progressDialog.dismiss();
//         dialogUtil.showFailureDialog(context, failure);
//       },
//       (String qrString) {
//         progressDialog.dismiss();
//         this.qrString = qrString;
//         notifyListeners();
//       },
//     );*/
//     qrString = 'This is ritunjay kumar, having 2 years experience with full stack mobile application development This is ritunjay kumar, having 2 years experience with full stack mobile application development';
//     notifyListeners();
//   }
//
//   void getBankData() async {
//     progressDialog.show();
//     (await repository.getBankDetails()).fold(
//       (Failure failure) {
//         progressDialog.dismiss();
//         checkSession(failure);
//       },
//       (List<BankDataResp> bdr) {
//         progressDialog.dismiss();
//         bankDataResp = bdr;
//         _showBankDataDialog();
//       },
//     );
//   }
//
//   void routeQrAmountScreen() async {
//     Map<String?, String?>? amountData =
//         await Navigator.of(context).pushNamed(Routes.qrAmountScreen) as Map<String?, String?>?;
//
//     if (amountData != null) {
//       String amount = amountData[QrAmountScreen.amountKey] ?? '0';
//       String description = amountData[QrAmountScreen.descriptionKey].notNull();
//
//       if (amount.isNotEmpty || description.isNotEmpty) {
//         qrGenerate(amount: amount, purpose: description);
//       }
//     }
//   }
//
//   void _showBankDataDialog() {
//     BankDataDialog bankDataDialog = BankDataDialog(context, bankDataResp, _onSelectBankId);
//     bankDataDialog.show();
//   }
//
//   void _onSelectBankId(BankDataResp bankData) {
//     _selectedBank = bankData;
//     notifyListeners();
//   }
//
//   BankDataResp? get selectedBank => _selectedBank;
// }
