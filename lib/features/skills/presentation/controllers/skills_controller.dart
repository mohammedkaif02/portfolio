import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_portfolio/core/constants/static_data.dart';

class SkillsController extends GetxController with GetTickerProviderStateMixin {
  late List<AnimationController> zoomControllers;
  late List<Animation<double>> zoomAnimations;

  @override
  void onInit() {
    super.onInit();
    zoomControllers = List.generate(
      StaticData.skillData.length,
      (index) => AnimationController(
        duration: const Duration(milliseconds: 200),
        vsync: this,
      ),
    );

    zoomAnimations = zoomControllers
        .map(
          (controller) => Tween<double>(begin: 1.0, end: 1.1).animate(
            CurvedAnimation(parent: controller, curve: Curves.easeInOut),
          ),
        )
        .toList();
  }

  void zoomIn(int index) {
    if (index < zoomControllers.length) {
      zoomControllers[index].forward();
    }
  }

  void zoomOut(int index) {
    if (index < zoomControllers.length) {
      zoomControllers[index].reverse();
    }
  }

  @override
  void onClose() {
    for (var controller in zoomControllers) {
      controller.dispose();
    }
    super.onClose();
  }
}
