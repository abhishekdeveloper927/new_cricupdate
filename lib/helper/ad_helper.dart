import 'dart:io';

class AdHelper {
  static String appId = 'ca-app-pub-3719997032363804~9016635612';

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3719997032363804/3908613310";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3719997032363804/3908613310";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get interstitialUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3678842784001702/6681469865";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3678842784001702/6681469865";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
