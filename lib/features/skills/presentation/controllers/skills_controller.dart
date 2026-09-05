import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/features/skills/domain/entities/skill_category_entity.dart';
import 'package:portfolio/features/skills/domain/usecases/get_skills_usecase.dart';

class SkillsController extends GetxController with GetTickerProviderStateMixin {
  final GetSkillsUseCase getSkillsUseCase;

  SkillsController({required this.getSkillsUseCase});

  final RxList<SkillCategoryEntity> skills = <SkillCategoryEntity>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = "".obs;

  List<AnimationController> zoomControllers = [];
  List<Animation<double>> zoomAnimations = [];

  @override
  void onInit() {
    super.onInit();
    loadSkills();
  }

  Future<void> loadSkills() async {
    isLoading.value = true;
    errorMessage.value = "";
    final result = await getSkillsUseCase.execute();
    result.when(
      success: (data) {
        skills.assignAll(data);
        _initAnimations(data.length);
        isLoading.value = false;
      },
      error: (failure) {
        errorMessage.value = failure.message;
        isLoading.value = false;
      },
    );
  }

  void _initAnimations(int count) {
    for (var c in zoomControllers) {
      c.dispose();
    }
    zoomControllers = List.generate(
      count,
      (index) => AnimationController(
        duration: const Duration(milliseconds: 200),
        vsync: this,
      ),
    );

    zoomAnimations =
        zoomControllers
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
