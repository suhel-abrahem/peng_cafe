import '../enums/connection_state.dart';

import '../enums/assets_type_enum.dart';

String get assetsPath {
  return 'assets/';
}

String get lottiesPath {
  return "${assetsPath}lotties/";
}

String get imagePath {
  return "${assetsPath}images/";
}

String get iconPath {
  return "${assetsPath}icons/";
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
  static const String coffeeMug = 'coffee_mug.json';
}

class ImagesName {
  static const String defaultUser = 'user.jpeg';
  static const String freshBeverages = 'fresh-beverages.jpg';
}

class IconsName {
  static const String bypass = "bypassIcon.png";
  static const String select = "select.svg";
  static const String byteXLogo = "bytex_logo.png";
  static const String coffeeMug = "coffee_mug.png";
  static const String cans = "cans.png";
  static const String bytexLogoSmall = "bytex_logo_small.png";
  static const String expand = "expand.png";
  static const String coffeeBeans = "coffee-beans.png";
  static const String coffeeBag = "coffee-bag.png";
  static const String latteArt = "latte-art.png";
  static const String cafe = "cafe.png";
  static const String shisha = "shisha.png";
}
