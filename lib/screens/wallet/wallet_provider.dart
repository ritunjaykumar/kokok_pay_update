import 'package:kokok_pay/screens/base/base_view_model.dart';

class WalletProvider extends BaseViewModel {
  WalletProvider(super.context);

  late final List<MiniStatementData> _miniStatements;

  @override
  void init() {
    super.init();
    _initMiniStatementData();
  }


  List<MiniStatementData> get miniStatements => _miniStatements;

  void _initMiniStatementData() {
    _miniStatements = <MiniStatementData>[
      MiniStatementData(
        type: 'sent',
        amount: '263478',
        desc: 'Wallet top-up|987489272344|Ref:32748597328947',
        date: '2023-03-12 12:23:54',
      ),
      MiniStatementData(
        type: 'sent',
        amount: '263478',
        desc: 'Wallet top-up|987489272344|Ref:32748597328947',
        date: '2023-03-12 12:23:54',
      ),
      MiniStatementData(
        type: 'receive',
        amount: '263478',
        desc: 'Wallet top-up|987489272344|Ref:32748597328947',
        date: '2023-03-12 12:23:54',
      ),
      MiniStatementData(
        type: 'receive',
        amount: '263478',
        desc: 'Wallet top-up|987489272344|Ref:32748597328947',
        date: '2023-03-12 12:23:54',
      ),
      MiniStatementData(
        type: 'receive',
        amount: '263478',
        desc: 'Wallet top-up|987489272344|Ref:32748597328947',
        date: '2023-03-12 12:23:54',
      ),
      MiniStatementData(
        type: 'sent',
        amount: '263478',
        desc: 'Wallet top-up|987489272344|Ref:32748597328947',
        date: '2023-03-12 12:23:54',
      ),
      MiniStatementData(
        type: 'sent',
        amount: '263478',
        desc: 'Wallet top-up|987489272344|Ref:32748597328947',
        date: '2023-03-12 12:23:54',
      ),
      MiniStatementData(
        type: 'receive',
        amount: '263478',
        desc: 'Wallet top-up|987489272344|Ref:32748597328947',
        date: '2023-03-12 12:23:54',
      ),
      MiniStatementData(
        type: 'sent',
        amount: '263478',
        desc: 'Wallet top-up|987489272344|Ref:32748597328947',
        date: '2023-03-12 12:23:54',
      ),
      MiniStatementData(
        type: 'receive',
        amount: '263478',
        desc: 'Wallet top-up|987489272344|Ref:32748597328947',
        date: '2023-03-12 12:23:54',
      ),
      MiniStatementData(
        type: 'sent',
        amount: '263478',
        desc: 'Wallet top-up|987489272344|Ref:32748597328947',
        date: '2023-03-12 12:23:54',
      ),
      MiniStatementData(
        type: 'receive',
        amount: '263478',
        desc: 'Wallet top-up|987489272344|Ref:32748597328947',
        date: '2023-03-12 12:23:54',
      ),
    ];
  }
}

class MiniStatementData {
  String type;
  String amount;
  String currency;
  String desc;
  String date;

  MiniStatementData({
    required this.type,
    required this.amount,
    this.currency = 'LAK',
    required this.desc,
    required this.date,
  });
}
