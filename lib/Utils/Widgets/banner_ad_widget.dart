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
/// Two-step loading, on purpose: computing the ad *size* for a given width
/// is a fast, local calculation, but actually loading a creative is a
/// network round-trip. Reserving the space as soon as the size is known —
/// instead of only once the real ad has fully loaded — means the rest of
/// the screen lays out at its final position from the start, rather than
/// jumping once the ad shows up a moment later.
class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({super.key});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  AdSize? _reservedSize;
  BannerAd? _bannerAd;
  bool _requested = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // MediaQuery isn't reliably available in initState, so request once
    // here instead. The app is portrait-locked, so one request is enough.
    if (!_requested) {
      _requested = true;
      _prepareAndLoad();
    }
  }

  Future<void> _prepareAndLoad() async {
    final width = MediaQuery.sizeOf(context).width.truncate();
    final size = await AdSize.getLargeAnchoredAdaptiveBannerAdSizeWithOrientation(
      Orientation.portrait,
      width,
    );
    if (size == null || !mounted) return; // e.g. no network yet.

    // Reserve the slot immediately — well before the ad creative itself has
    // finished downloading.
    setState(() => _reservedSize = size);

    final ad = BannerAd(
      size: size,
      adUnitId: AdsConfig.bannerAdUnitId,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (mounted) setState(() => _bannerAd = ad as BannerAd);
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          // Collapse back down rather than leave a permanent empty gap
          // reserved for an ad that's never going to show.
          if (mounted) setState(() => _reservedSize = null);
        },
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
    final size = _reservedSize;
    if (size == null) {
      return const SizedBox.shrink();
    }
    // Deliberately flush with the true bottom edge of the screen — no
    // SafeArea padding here. The screens that use this widget keep their
    // own content clear of the system gesture area independently.
    final bannerAd = _bannerAd;
    return SizedBox(
      width: size.width.toDouble(),
      height: size.height.toDouble(),
      child: bannerAd == null ? null : AdWidget(ad: bannerAd),
    );
  }
}
