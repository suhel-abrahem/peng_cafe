import '../enums/connection_state.dart';

import '../enums/assets_type_enum.dart';

String get assetsPath {
  return 'assets/';
}

String get lottiesPath {
  return 'lotties/';
}

String get imagePath {
  return "images/";
}

String get iconPath {
  return "icons/";
}

class LottiesName {
  static const String login = 'login.json';
  static const String noInternet = 'no_internet.json';
  static const String noData = 'no_data.json';
  static const String error = 'error.json';
  static const String loading = 'loading.json';
  static const String expire = 'expire.json';
  static const String warehouse = 'warehouse.json';
  static const String bill = 'bill.json';
  static const String warehouseManagment = 'warehouse_managment.json';
  static const String warehouseEmu = 'warehouse_emu.json';
  static const String workers = 'workers.json';
  static const String imageError = 'image_error.json';
}

class ImagesName {
  static const String defaultUser = 'user.jpeg';
}

class IconsName {
  static const String bypass = "bypassIcon.png";
  static const String select = "select.svg";
}

String getAssetsPath({
  required String assetsName,
  required AssetsType assetsType,
}) {
  String output = '';
  switch (assetsType) {
    case AssetsType.lotties:
      output = '$assetsPath$lottiesPath$assetsName';
    case AssetsType.image:
      output = '$assetsPath$imagePath$assetsName';
    case AssetsType.icon:
      output = '$assetsPath$iconPath$assetsName';
    default:
      output = '';
  }
  return output;
}
