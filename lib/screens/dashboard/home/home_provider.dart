import 'package:kokok_pay/screens/base/base_view_model.dart';

class HomeProvider extends BaseViewModel {
  HomeProvider(super.context);

  final double _amount = 88778787;
  bool _isAmountHidden = true;

  final List<TransactionData> _transactionData = [];

  void init() {
    _transactionsData();
  }

  void amountHiddenToggle() {
    _isAmountHidden = !_isAmountHidden;
    notifyListeners();
  }

  void _transactionsData() {
    _transactionData.addAll([
      TransactionData('txnId', 56832, '₭', 'Kouprasith Abhay', 'receive', '2023-05-12 12:23 am'),
      TransactionData('txnId', 56765, '₭', 'Alexandra Bounxouei', 'receive', '2023-05-13 12:23 am'),
      TransactionData('txnId', 12379, '₭', 'Anouvong', 'sent', '2023-04-10 12:23 am'),
      TransactionData('txnId', 71453, '₭', 'Boua', 'receive', '2023-03-15 12:23 am'),
      TransactionData('txnId', 9835, '₭', 'Bounkhong', 'sent', '2023-05-13 12:23 am'),
      TransactionData('txnId', 3674, '₭', 'Bouasone Bouphavanh.', 'sent', '2023-05-17 12:23 am'),
      TransactionData('txnId', 5672, '₭', 'Laasaenthai Bouvanaat', 'sent', '2023-05-19 12:23 am'),
      TransactionData('txnId', 7865, '₭', 'General Cheng', 'receive', '2023-06-10 12:23 am'),
      TransactionData('txnId', 98087, '₭', 'Laasaenthai Bouvanaat', 'sent', '2023-05-16 12:23 am'),
      TransactionData('txnId', 45309, '₭', 'Bouasone Bouphavanh', 'receive', '2023-04-26 12:23 am'),
      TransactionData('txnId', 5634, '₭', 'Anouvong', 'sent', '2023-04-02 12:23 am'),
      TransactionData('txnId', 71453, '₭', 'Boua', 'receive', '2023-03-15 12:23 am'),
      TransactionData('txnId', 9835, '₭', 'Bounkhong', 'sent', '2023-05-13 12:23 am'),
    ]);
  }

  List<TransactionData> get transactionData => _transactionData;

  bool get isAmountHidden => _isAmountHidden;

  double get amount => _amount;
}

class TransactionData {
  String txnId;
  double amount;
  String cur;
  String to;
  String type;
  String date;

  TransactionData(this.txnId, this.amount, this.cur, this.to, this.type, this.date);
}
