import 'package:connectivity_plus/connectivity_plus.dart';
import '/application/application.dart';

class InternetStatus {
  Future<bool> isConnected() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      logger.i('connected with mobile data');
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      logger.i('connected with wifi');
      return true;
    }else if(connectivityResult == ConnectivityResult.ethernet){
      logger.i('connected with ethernet');
      return true;
    }
    logger.i('no internet connection is available');
    return false;
  }
}
