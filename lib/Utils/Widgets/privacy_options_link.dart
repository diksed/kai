import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../consent_manager.dart';

/// Small "manage consent" entry point, styled to match [SupportLink]. Only
/// meant to be shown when [ConsentManager.isPrivacyOptionsRequired] says
/// so — most users (outside the EEA/UK and a few US states) will never see
/// this, per Google's UMP guidance.
class PrivacyOptionsLink extends StatelessWidget {
  const PrivacyOptionsLink({super.key});

  void _open() {
    ConsentManager.instance.showPrivacyOptionsForm((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: _open,
      icon:
          const Icon(Icons.privacy_tip_outlined, size: 16, color: Colors.white70),
      label: Text(
        'privacyOptions'.tr,
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
