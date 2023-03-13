import 'package:flutter/material.dart';

import '../../../Utils/image_opacity.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return imageOpacity(imagePath, opacity: 0.03);
  }
}
