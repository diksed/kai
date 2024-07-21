class FirebaseConnectionTexts {
  static const String electric = 'elektrik';
  static const String data = 'data';
  static const String naturalGas = 'dogalgaz';
  static const String warming = 'isinma';
  static const String fuelOil = 'fueloil';
  static const String coal = 'komur';
  static const String gasoline = 'benzin';
  static const String diesel = 'dizel';
  static const String vehicleLpg = 'aracLpg';
  static const String lpg = 'lpg';
  static const String fuel = 'yakit';
}

class KeyTexts {
  static const String recordKey = 'past_records';
  static const String kWh = 'kWh';
  static const String vehicleUse = 'vehicleUse';
  static const String warming = 'warming';
  static const String food = 'food';
  static const String info = 'info';
  static const String infoMessages = 'infoMessages';
  static const String infoMessagesEn = 'infoMessagesEn';
  static const String totalCo2 = 'totalCo2';
  static const String dateDay = 'dateDay';
  static const String dateMonth = 'dateMonth';
  static const String url = 'https://www.tema.org.tr/tek-seferlik-genel-bagis';
}

final List<Map<String, String>> months = [
  {'tr': 'Ocak', 'en': 'January', 'num': '1'},
  {'tr': 'Şubat', 'en': 'February', 'num': '2'},
  {'tr': 'Mart', 'en': 'March', 'num': '3'},
  {'tr': 'Nisan', 'en': 'April', 'num': '4'},
  {'tr': 'Mayıs', 'en': 'May', 'num': '5'},
  {'tr': 'Haziran', 'en': 'June', 'num': '6'},
  {'tr': 'Temmuz', 'en': 'July', 'num': '7'},
  {'tr': 'Ağustos', 'en': 'August', 'num': '8'},
  {'tr': 'Eylül', 'en': 'September', 'num': '9'},
  {'tr': 'Ekim', 'en': 'October', 'num': '10'},
  {'tr': 'Kasım', 'en': 'November', 'num': '11'},
  {'tr': 'Aralık', 'en': 'December', 'num': '12'}
];

const int averageCo2 = 6300;

class RoutesTexts {
  static const String introduction = '/introduction';
  static const String menu = '/menu';
  static const String calculation = '/calculation';
  static const String pastRecords = '/records';
  static const String splash = '/splash';
}

class ImagesPath {
  static const String carboonFootprint = 'assets/images/carboon_footprint.png';
  static const String electricConsumption =
      'assets/images/electric_consumption.png';
  static const String foodConsumption = 'assets/images/food_consumption.png';
  static const String fuelConsumption = 'assets/images/fuel_consumption.png';
  static const String waterConsumption = 'assets/images/water_consumption.png';
  static const String warmingConsumption =
      'assets/images/warming_consumption.png';
  static const String vehicleUse = 'assets/images/vehicle_use.png';
  static const String saveWorld = 'assets/images/save_world.png';
  static const String menuBackground = 'assets/images/menu_background.png';
  static const String calculateKai = 'assets/images/calculate_kai.png';
  static const String kaiLogo = 'assets/images/kai_logo.png';
  static const String donate = 'assets/images/donate.png';
  static const String facts = 'assets/images/facts.png';
  static const String pastRecords = 'assets/images/past_records.png';
  static const String pastRecordsBackground =
      'assets/images/past_records_background.png';
  static const String co2Icon = 'assets/images/co2_icon.png';
  static const String splash = 'assets/images/kai_splash.gif';
}
