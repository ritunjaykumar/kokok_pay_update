import 'package:kokok_pay/resources/asset_manager.dart';
import 'package:kokok_pay/screens/base/base_view_model.dart';

class FavoriteProvider extends BaseViewModel {
  FavoriteProvider(super.context);
  late final List<RecentTxnData> _recentTxnDataList;
  @override
  void init() {
    super.init();
    _initRecentTxnDataList();
  }


  List<RecentTxnData> get recentTxnDataList => _recentTxnDataList;

  void _initRecentTxnDataList(){
    _recentTxnDataList = [
      RecentTxnData(name: 'Anouvong', image: ImagesFile.electricity, txnType: 'EDL'),
      RecentTxnData(name: 'Boua', image: ImagesFile.electricity, txnType: 'EDL'),
      RecentTxnData(name: 'Bounkhong', image: ImagesFile.avatar, txnType: 'Wallet'),
      RecentTxnData(name: 'Kouprasith Abhay', image: ImagesFile.avatar, txnType: 'Water'),
      RecentTxnData(name: 'Alexandra Bounouei', image: ImagesFile.placeholder, txnType: 'Wallet'),
      RecentTxnData(name: 'General Cheng', image: ImagesFile.waterDrop, txnType: 'Water'),
    ];
  }
  
}

class RecentTxnData {
  String name;
  String image;
  String txnType;

  RecentTxnData({
    required this.name,
    required this.image,
    required this.txnType,
  });
}
