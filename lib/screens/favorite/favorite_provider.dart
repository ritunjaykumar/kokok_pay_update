import 'package:kokok_pay/resources/asset_manager.dart';
import 'package:kokok_pay/screens/base/base_view_model.dart';

class FavoriteProvider extends BaseViewModel {
  FavoriteProvider(super.context);

  late final List<RecentTxnData> _recentTxnDataList;
  late final List<FavoriteData> _favoriteDataList;
  bool _check = false;

  @override
  void init() {
    super.init();
    _initRecentTxnDataList();
    _initFavoriteDataList();
  }

  void clearItem() {
    for (FavoriteData fd in _favoriteDataList) {
      fd.selected = false;
    }
    checkToggle(false);
    // notifyListeners();
  }

  void delete() {
    _favoriteDataList.removeWhere((element) => element.selected);
    checkToggle(false);
  }

  void checkToggle(check) {
    _check = check;
    notifyListeners();
  }

  bool get check => _check;

  List<RecentTxnData> get recentTxnDataList => _recentTxnDataList;

  List<FavoriteData> get favoriteDataList => _favoriteDataList;

  void _initRecentTxnDataList() {
    _recentTxnDataList = [
      RecentTxnData(name: 'Anouvong', image: ImagesFile.electricity, txnType: 'EDL'),
      RecentTxnData(name: 'Boua', image: ImagesFile.electricity, txnType: 'EDL'),
      RecentTxnData(name: 'Bounkhong', image: ImagesFile.avatar, txnType: 'Wallet'),
      RecentTxnData(name: 'Kouprasith Abhay', image: ImagesFile.avatar, txnType: 'Water'),
      RecentTxnData(name: 'Alexandra Bounouei', image: ImagesFile.placeholder, txnType: 'Wallet'),
      RecentTxnData(name: 'General Cheng', image: ImagesFile.waterDrop, txnType: 'Water'),
    ];
  }

  void _initFavoriteDataList() {
    _favoriteDataList = [
      FavoriteData(name: 'Ritunjay kumar', type: 'edl', consId: '23456789876'),
      FavoriteData(name: 'Ritunjay kumar', type: 'water', consId: '23456789876'),
      FavoriteData(name: 'Ritunjay kumar', type: 'wallet', consId: '23456789876'),
      FavoriteData(name: 'Ritunjay kumar', type: 'wallet', consId: '23456789876'),
      FavoriteData(name: 'Ritunjay kumar', type: 'edl', consId: '23456789876'),
      FavoriteData(name: 'Ritunjay kumar', type: 'water', consId: '23456789876'),
      FavoriteData(name: 'Ritunjay kumar', type: 'water', consId: '23456789876'),
      FavoriteData(name: 'Ritunjay kumar', type: 'water', consId: '23456789876'),
      FavoriteData(name: 'Ritunjay kumar', type: 'water', consId: '23456789876'),
      FavoriteData(name: 'Ritunjay kumar', type: 'water', consId: '23456789876'),
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

class FavoriteData {
  String name;
  String type;
  String consId;
  bool selected;

  FavoriteData({
    required this.name,
    required this.type,
    required this.consId,
    this.selected = false,
  });

  @override
  String toString() {
    return 'FavoriteData{name: $name, type: $type, consId: $consId, selected: $selected}';
  }
}
