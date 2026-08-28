import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ads_config.dart';

/// Preloads a single interstitial (full-screen) ad so it's ready the moment
/// the user finishes their last calculation input and moves on to their
/// result — starting the load at that exact moment would usually be too
/// slow to show anything in time. Call [load] as soon as the calculation
/// flow starts (there's several screens' worth of typing before it's
/// needed), then [showIfReady] right at the food → result transition.
class InterstitialAdManager {
  InterstitialAdManager._();
  static final InterstitialAdManager instance = InterstitialAdManager._();

  InterstitialAd? _ad;
  bool _isLoading = false;

  void load() {
    if (_ad != null || _isLoading) return;
    _isLoading = true;
    InterstitialAd.load(
      adUnitId: AdsConfig.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _isLoading = false;
          _ad = ad;
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              _ad = null;
              load(); // get the next one ready for the next calculation run
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              _ad = null;
              load();
            },
          );
        },
        onAdFailedToLoad: (error) {
          _isLoading = false;
        },
      ),
    );
  }

  /// Shows the preloaded ad if one is ready. Does nothing — and, crucially,
  /// never blocks or delays the user — if it isn't loaded yet.
  void showIfReady() {
    _ad?.show();
  }
}
