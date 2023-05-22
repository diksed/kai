import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/CalculationScreen/calculation_controller.dart';

import '../../../../Utils/app_colors.dart';
import '../Common/inner_shadow_effect.dart';

class AnimatedIndicator extends StatefulWidget {
  final int indicatorIndex;

  const AnimatedIndicator({Key? key, required this.indicatorIndex})
      : super(key: key);

  @override
  State<AnimatedIndicator> createState() => _AnimatedIndicatorState();
}

class _AnimatedIndicatorState extends State<AnimatedIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final CalculationController calculationController = Get.find();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    if (calculationController.indicatorIndex.value == widget.indicatorIndex) {
      _animation = Tween<double>(
        begin: 0,
        end: calculationController.indicatorIndex.value.toDouble(),
      ).animate(_animationController);
      _animationController.value = 1.0;
    } else {
      _animation = Tween<double>(
        begin: 0,
        end: widget.indicatorIndex.toDouble(),
      ).animate(_animationController);
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(covariant AnimatedIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.indicatorIndex != widget.indicatorIndex) {
      if (calculationController.indicatorIndex.value == widget.indicatorIndex) {
        _animation = Tween<double>(
          begin: oldWidget.indicatorIndex.toDouble(),
          end: calculationController.indicatorIndex.value.toDouble(),
        ).animate(_animationController);
        _animationController.value = 1.0;
      } else {
        _animation = Tween<double>(
          begin: oldWidget.indicatorIndex.toDouble(),
          end: widget.indicatorIndex.toDouble(),
        ).animate(_animationController);
        _animationController.reset();
        _animationController.forward();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Get.height / 22.4,
          width: Get.width / 1.21,
          decoration: innerShadowEffect(AppColors.indicatorBackground),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: Get.height / 22.4,
            width: _animation.value,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
