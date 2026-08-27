import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../app_texts.dart';

/// Small, deliberately understated "support the developer" link (Buy Me a
/// Coffee). Sits quietly under the menu instead of competing with the app's
/// actual features.
class SupportLink extends StatelessWidget {
  const SupportLink({super.key});

  Future<void> _open() async {
    final uri = Uri.parse(KeyTexts.supportUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: _open,
      icon: const Icon(Icons.coffee_outlined, size: 16, color: Colors.white70),
      label: Text(
        'supportMe'.tr,
        style: const TextStyle(color: Colors.white70, fontSize: 13),
      ),
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
