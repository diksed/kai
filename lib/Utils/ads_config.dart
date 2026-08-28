import 'dart:io';

/// AdMob configuration.
///
/// [useTestAds] defaults to `true` so the app never accidentally serves (or
/// requests) real ads — and never risks an AdMob policy strike from
/// developer-device impressions — until you deliberately switch it off.
///
/// Before releasing:
/// 1. Create an AdMob account + app entry at https://apps.admob.com.
/// 2. Replace [_androidAppId]/[_iosAppId] AND the matching values in
///    android/app/src/main/AndroidManifest.xml and ios/Runner/Info.plist
///    (the manifest/plist values are what the SDK actually reads at
///    startup — the constants below are only used to build ad requests).
/// 3. Create a banner ad unit and replace [_androidBannerUnitId] /
///    [_iosBannerUnitId] below.
/// 4. Flip [useTestAds] to false.
class AdsConfig {
  AdsConfig._();

  static const bool useTestAds = true;

  // Google's public sample IDs — safe to ship, always return test creatives.
  static const String _testAndroidBannerUnitId =
      'ca-app-pub-3940256099942544/6300978111';
  static const String _testIosBannerUnitId =
      'ca-app-pub-3940256099942544/2934735716';
  static const String _testAndroidInterstitialUnitId =
      'ca-app-pub-3940256099942544/1033173712';
  static const String _testIosInterstitialUnitId =
      'ca-app-pub-3940256099942544/4411468910';

  // Real banner ad unit ID (Kai / Android, "Past Records Banner").
  static const String _androidBannerUnitId =
      'ca-app-pub-2524103324784592/6509658866';
  // TODO: still a placeholder — replace once an iOS AdMob app/unit exists.
  static const String _iosBannerUnitId = 'ca-app-pub-3940256099942544/2934735716';
  // Real interstitial ad unit ID (Kai / Android).
  static const String _androidInterstitialUnitId =
      'ca-app-pub-2524103324784592/3527387822';
  // TODO: still a placeholder — replace once an iOS AdMob app/unit exists.
  static const String _iosInterstitialUnitId =
      'ca-app-pub-3940256099942544/4411468910';

  static String get bannerAdUnitId {
    if (useTestAds) {
      return Platform.isIOS ? _testIosBannerUnitId : _testAndroidBannerUnitId;
    }
    return Platform.isIOS ? _iosBannerUnitId : _androidBannerUnitId;
  }

  static String get interstitialAdUnitId {
    if (useTestAds) {
      return Platform.isIOS
          ? _testIosInterstitialUnitId
          : _testAndroidInterstitialUnitId;
    }
    return Platform.isIOS ? _iosInterstitialUnitId : _androidInterstitialUnitId;
  }
}
