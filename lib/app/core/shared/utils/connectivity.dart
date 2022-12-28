import 'package:connectivity_plus/connectivity_plus.dart';

abstract class VerifyConnectivity {
  static Future<bool> isConnected({bool showMsg = true}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
