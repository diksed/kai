import 'package:flutter/material.dart';

import '../../../Utils/image_opacity.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        imageOpacity('assets/images/menu_background.png', opacity: 0.03),
      ],
    );
  }
}
