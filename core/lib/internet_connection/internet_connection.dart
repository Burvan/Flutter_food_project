import 'package:core/core.dart';

class InternetConnection {
  InternetConnection();

  static Future<bool> isInternetConnection() async {
    final ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.mobile ||
            connectivityResult == ConnectivityResult.wifi
        ? true
        : false;
  }
}
