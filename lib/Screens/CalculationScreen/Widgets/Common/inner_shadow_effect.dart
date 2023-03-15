import 'package:flutter/material.dart';

BoxDecoration innerShadowEffect(Color color) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(color: Colors.black.withOpacity(0.7)),
      BoxShadow(
        offset: const Offset(0, 3),
        color: color,
        spreadRadius: 0,
        blurRadius: 15,
      ),
    ],
  );
}
