import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../ads_config.dart';

/// A full-device-width banner ad, meant to sit in a [Scaffold]'s
/// `bottomNavigationBar` slot so it's pinned to the very bottom of the
/// screen and never scrolls with the content above it.
///
/// Uses an adaptive anchored banner (not the fixed 320x50 [AdSize.banner])
/// so AdMob picks a height that matches the full screen width, instead of a
/// small fixed-size box floating in the middle of a wide screen.
///
/// Loads itself, disposes itself, and — importantly — takes up no space at
/// all until an ad has actually loaded, so a slow/failed ad request never
/// leaves a blank gap in the layout.
class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({super.key});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  BannerAd? _bannerAd;
  bool _requested = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // MediaQuery isn't reliably available in initState, so request once
    // here instead. The app is portrait-locked, so one request is enough.
    if (!_requested) {
      _requested = true;
      _loadAd();
    }
  }

  Future<void> _loadAd() async {
    final width = MediaQuery.sizeOf(context).width.truncate();
    final size = await AdSize.getLargeAnchoredAdaptiveBannerAdSizeWithOrientation(
      Orientation.portrait,
      width,
    );
    if (size == null) return; // e.g. no network yet — just show nothing.

    final ad = BannerAd(
      size: size,
      adUnitId: AdsConfig.bannerAdUnitId,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (mounted) setState(() => _bannerAd = ad as BannerAd);
        },
        onAdFailedToLoad: (ad, error) => ad.dispose(),
      ),
    );
    await ad.load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ad = _bannerAd;
    if (ad == null) {
      return const SizedBox.shrink();
    }
    // Deliberately flush with the true bottom edge of the screen — no
    // SafeArea padding here. The screens that use this widget keep their
    // own content clear of the system gesture area independently.
    return SizedBox(
      width: ad.size.width.toDouble(),
      height: ad.size.height.toDouble(),
      child: AdWidget(ad: ad),
    );
  }
}
