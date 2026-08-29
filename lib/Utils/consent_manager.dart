import 'package:google_mobile_ads/google_mobile_ads.dart';

/// Wraps the User Messaging Platform (UMP) SDK — bundled inside
/// `google_mobile_ads`, no separate package needed — so real ads are only
/// ever requested once whatever consent AdMob's EU User Consent Policy
/// requires (EEA/UK GDPR, and US state privacy laws) has actually been
/// gathered from the user. Skipping this and just calling
/// `MobileAds.instance.initialize()` directly risks an AdMob policy strike
/// once [AdsConfig.useTestAds] is off and real ads start serving.
class ConsentManager {
  ConsentManager._();
  static final ConsentManager instance = ConsentManager._();

  bool _adsInitialized = false;

  /// Requests up-to-date consent info and, if the user's region/situation
  /// requires it, loads and shows the consent form — then initializes the
  /// Mobile Ads SDK, but only once [ConsentInformation.canRequestAds]
  /// actually allows it. Safe to call more than once; initialization only
  /// ever happens once. Never blocks app startup: every path here is
  /// fire-and-forget from the caller's point of view.
  void gatherConsentAndInitializeAds() {
    final params = ConsentRequestParameters();
    ConsentInformation.instance.requestConsentInfoUpdate(
      params,
      () => ConsentForm.loadAndShowConsentFormIfRequired(
        (_) => _initializeAdsIfAllowed(),
      ),
      (_) {
        // Consent server unreachable (e.g. no network yet at launch) — fall
        // back to whatever consent status is already cached from a prior
        // session instead of blocking ads indefinitely.
        _initializeAdsIfAllowed();
      },
    );
    // A returning user who already consented shouldn't have to wait on the
    // network round-trip above just to see ads again this session.
    _initializeAdsIfAllowed();
  }

  Future<void> _initializeAdsIfAllowed() async {
    if (_adsInitialized) return;
    if (await ConsentInformation.instance.canRequestAds()) {
      _adsInitialized = true;
      await MobileAds.instance.initialize();
    }
  }

  /// Whether a persistent "privacy options" entry point must be exposed
  /// somewhere in the app's UI so the user can change their consent choice
  /// later (required for some EEA/UK and US-state situations).
  Future<bool> isPrivacyOptionsRequired() async {
    final status = await ConsentInformation.instance
        .getPrivacyOptionsRequirementStatus();
    return status == PrivacyOptionsRequirementStatus.required;
  }

  /// Re-shows the consent/privacy-options form so the user can change
  /// their earlier choice.
  void showPrivacyOptionsForm(void Function(FormError?) onDismissed) {
    ConsentForm.showPrivacyOptionsForm(onDismissed);
  }
}
