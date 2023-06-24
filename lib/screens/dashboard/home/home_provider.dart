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
      TransactionData('txnId', 12345, '₭', 'Surya', 'sent', '2023-05-20 12:23 am'),
      TransactionData('txnId', 45345, '₭', 'Ritu', 'sent', '2023-05-12 12:23 am'),
      TransactionData('txnId', 56832, '₭', 'Rakesh', 'receive', '2023-05-12 12:23 am'),
      TransactionData('txnId', 56765, '₭', 'Rajesh', 'receive', '2023-05-13 12:23 am'),
      TransactionData('txnId', 12379, '₭', 'Riya', 'sent', '2023-04-10 12:23 am'),
      TransactionData('txnId', 9876, '₭', 'Ramesh', 'receive', '2023-04-23 12:23 am'),
      TransactionData('txnId', 71453, '₭', 'Ritesh', 'receive', '2023-03-15 12:23 am'),
      TransactionData('txnId', 9835, '₭', 'Raviraj', 'sent', '2023-05-13 12:23 am'),
      TransactionData('txnId', 3674, '₭', 'Rituraj', 'sent', '2023-05-17 12:23 am'),
      TransactionData('txnId', 5672, '₭', 'Rani', 'sent', '2023-05-19 12:23 am'),
      TransactionData('txnId', 7865, '₭', 'Rakhi', 'receive', '2023-06-10 12:23 am'),
      TransactionData('txnId', 98087, '₭', 'Raviteja', 'sent', '2023-05-16 12:23 am'),
      TransactionData('txnId', 45309, '₭', 'Ravindara', 'receive', '2023-04-26 12:23 am'),
      TransactionData('txnId', 5634, '₭', 'Rahul', 'sent', '2023-04-02 12:23 am'),
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
