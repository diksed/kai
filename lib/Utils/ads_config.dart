import 'dart:io';

/// AdMob configuration.
///
/// [useTestAds] is `false` now that a real AdMob app + real Android ad
/// units are wired up (see the real IDs below) and [ConsentManager] gathers
/// UMP consent before any ad is ever requested. iOS still has no real
/// AdMob app/units yet (see the TODOs below), so iOS keeps serving test
/// creatives regardless of this flag until that's set up.
///
/// Flip this back to `true` (or set it per-platform) if you ever need to
/// test on a real device without touching production ad stats — never
/// tap/view real ads on your own devices, that risks an AdMob policy
/// strike.
class AdsConfig {
  AdsConfig._();

  static const bool useTestAds = false;

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
