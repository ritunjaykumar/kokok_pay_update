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
      RecentTxnData(
          name: 'Anouvong', image: ImagesFile.electricity, type: 'edl', id: '23456789876'),
      RecentTxnData(name: 'Boua', image: ImagesFile.electricity, type: 'edl', id: '643526456456'),
      RecentTxnData(name: 'Bounkhong', image: ImagesFile.avatar, type: 'wallet', id: '45678256457'),
      RecentTxnData(
          name: 'Kouprasith Abhay', image: ImagesFile.avatar, type: 'wallet', id: '835635645'),
      RecentTxnData(
          name: 'Alexandra Bounouei',
          image: ImagesFile.placeholder,
          type: 'wallet',
          id: '84565326545'),
      RecentTxnData(
          name: 'General Cheng', image: ImagesFile.waterDrop, type: 'edl', id: '25645645666345'),
    ];
  }

  void _initFavoriteDataList() {
    _favoriteDataList = [
      FavoriteData(name: 'Anouvong', type: 'edl', consId: '23456789876'),
      FavoriteData(name: 'Bounkhong', type: 'edl', consId: '643526456456'),
      FavoriteData(name: 'Kouprasith Abhay', type: 'wallet', consId: '45678256457'),
      FavoriteData(name: 'Alexandra Bounouei', type: 'wallet', consId: '835635645'),
      FavoriteData(name: 'General Cheng', type: 'edl', consId: '84565326545'),
      FavoriteData(name: 'Boua', type: 'edl', consId: '25645645666345'),
      FavoriteData(name: 'Anuson', type: 'wallet', consId: '246547485'),
      FavoriteData(name: 'Deesabun', type: 'wallet', consId: '83563534'),
      FavoriteData(name: 'Atsawin', type: 'edl', consId: '5652654365'),
      FavoriteData(name: 'Lawan', type: 'wallet', consId: '84653665463456'),
    ];
  }
}

class RecentTxnData {
  String name;
  String image;
  String type;
  String id;

  RecentTxnData({
    required this.name,
    required this.image,
    required this.type,
    required this.id,
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
