import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../ads_config.dart';

/// A single, self-contained banner ad. Loads itself, disposes itself, and —
/// importantly — takes up no space at all until an ad has actually loaded,
/// so a slow/failed ad request never leaves a blank gap in the layout.
///
/// Deliberately used in exactly one place (the past-records screen) rather
/// than sprinkled across every screen — a carbon-footprint app nagging
/// people with ads on every tap would be a bit on the nose.
class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({super.key});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
    final ad = BannerAd(
      size: AdSize.banner,
      adUnitId: AdsConfig.bannerAdUnitId,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (mounted) setState(() => _bannerAd = ad as BannerAd);
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );
    ad.load();
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
    return SizedBox(
      width: ad.size.width.toDouble(),
      height: ad.size.height.toDouble(),
      child: AdWidget(ad: ad),
    );
  }
}
