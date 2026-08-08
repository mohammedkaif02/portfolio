import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mr_portfolio/core/theme/app_colors.dart';
import 'package:mr_portfolio/core/theme/theme_color.dart';
import 'package:mr_portfolio/features/home/presentation/controllers/navigation_controller.dart';
import 'package:mr_portfolio/features/home/presentation/controllers/theme_controller.dart';

class MyDrawer extends StatelessWidget {
  final NavigationController navigationController = Get.find();
  final ThemeController themeController = Get.find();

  MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = !themeController.toggle.value;

      return Drawer(
        backgroundColor:
            isDark ? const Color(0xff111827) : const Color(0xfffbf8ff),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: AppColors.brandGradient,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.code_rounded,
                      color: primaryColor,
                      size: 28,
                    ),
                  ),
                  const Gap(10),
                  const Text(
                    "Mohammed Kaif",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(10),
            _drawerItem(
              "Home",
              Icons.home_rounded,
              () => navigationController.scrollToSection(navigationController.homeKey, "Home"),
              context,
            ),
            _drawerItem(
              "About",
              Icons.person_rounded,
              () => navigationController.scrollToSection(navigationController.aboutUsKey, "About"),
              context,
            ),
            _drawerItem(
              "Experience",
              Icons.work_rounded,
              () => navigationController.scrollToSection(
                navigationController.experienceKey,
                "Experience",
              ),
              context,
            ),
            _drawerItem(
              "Skills",
              Icons.bolt_rounded,
              () => navigationController.scrollToSection(navigationController.whatIDoKey, "Skills"),
              context,
            ),
            _drawerItem(
              "Projects",
              Icons.folder_special_rounded,
              () => navigationController.scrollToSection(navigationController.projectKey, "Projects"),
              context,
            ),
            _drawerItem(
              "Contact",
              Icons.email_rounded,
              () => navigationController.scrollToSection(navigationController.contactKey, "Contact"),
              context,
            ),
          ],
        ),
      );
    });
  }

  Widget _drawerItem(
    String text,
    IconData icon,
    VoidCallback onTap,
    BuildContext context,
  ) {
    return Obx(() {
      final isSelected = navigationController.selectedNavItem.value == text;
      final isDark = !themeController.toggle.value;

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected
                ? primaryColor.withValues(alpha: 0.15)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: Icon(
              icon,
              color: isSelected
                  ? primaryColor
                  : (isDark ? Colors.white70 : Colors.black54),
              size: 22,
            ),
            title: Text(
              text,
              style: TextStyle(
                color: isSelected
                    ? primaryColor
                    : (isDark ? Colors.white : Colors.black87),
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.pop(Get.context!);
              onTap();
            },
          ),
        ),
      );
    });
  }
}

