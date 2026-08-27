import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kai/Routes/routes.dart';
import 'package:kai/Screens/SplashScreen/splash_screen.dart';

import 'Utils/languages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  // Fire-and-forget: ad SDK init shouldn't block app startup, and the app
  // must still work fine if it's slow or fails (e.g. no network yet).
  unawaited(MobileAds.instance.initialize());
  runApp(const MyApp());
}

final Locale deviceLocale =
    PlatformDispatcher.instance.implicitView!.platformDispatcher.locale;
final String languageCode = deviceLocale.languageCode == 'tr' ? 'tr' : 'en';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Locale appLocale = (deviceLocale.languageCode == 'tr')
        ? const Locale('tr', 'TR')
        : const Locale('en', 'US');

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: Languages(),
        locale: appLocale,
        getPages: appRoutes(),
        home: const SplashPage());
  }
}
