import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/constants/app_dimensions.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/widgets/my_text.dart';
import 'package:portfolio/features/home/presentation/controllers/theme_controller.dart';

class Footer extends StatelessWidget {
  Footer({super.key});

  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = !themeController.toggle.value;

      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkBackground : AppColors.lightBackground,
          border: Border(
            top: BorderSide(
              color: isDark ? Colors.white12 : Colors.black12,
              width: 1,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tech Stack Badge Pill
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color:
                    isDark
                        ? AppColors.darkChipSurface
                        : AppColors.lightChipSurface,
                borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.flutter_dash_rounded,
                    color: AppColors.primary,
                    size: 16,
                  ),
                  const Gap(8),
                  MyText(
                    text: AppStrings.footerBuiltWith,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    textColor: isDark ? Colors.white70 : Colors.black87,
                  ),
                ],
              ),
            ),
            const Gap(16),
            MyText(
              text: "Designed & Developed by ${AppStrings.name}",
              fontSize: 14,
              fontWeight: FontWeight.bold,
              textColor: isDark ? Colors.white : Colors.black87,
            ),
            const Gap(8),
            MyText(
              text: AppStrings.footerCopyright,
              fontSize: 12,
              textColor: isDark ? Colors.white60 : Colors.black54,
            ),
          ],
        ),
      );
    });
  }
}
