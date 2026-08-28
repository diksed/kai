import 'package:flutter/material.dart';

Image imageOpacity(String image, {double opacity = 0.4}) {
  return Image.asset(image,
      color: Colors.white.withValues(alpha: opacity),
      colorBlendMode: BlendMode.modulate);
}
