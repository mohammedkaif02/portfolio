import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      return Drawer(
        backgroundColor:
            themeController.toggle.value
                ? const Color(0xfffbf8ff)
                : const Color(0xff111827),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color:
                    themeController.toggle.value
                        ? const Color(0xfffbf8ff)
                        : const Color(0xff111827),
              ),
              child: const Center(
                child: Text(
                  "Mohammed Kaif",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            _drawerItem(
              "Home",
              () => navigationController.scrollToSection(navigationController.homeKey, "Home"),
              context,
            ),
            _drawerItem(
              "About",
              () => navigationController.scrollToSection(navigationController.aboutUsKey, "About"),
              context,
            ),
            _drawerItem(
              "Experience",
              () => navigationController.scrollToSection(
                navigationController.experienceKey,
                "Experience",
              ),
              context,
            ),
            _drawerItem(
              "Skills",
              () => navigationController.scrollToSection(navigationController.whatIDoKey, "Skills"),
              context,
            ),
            _drawerItem(
              "Projects",
              () =>
                  navigationController.scrollToSection(navigationController.projectKey, "Projects"),
              context,
            ),
            _drawerItem(
              "Contact",
              () =>
                  navigationController.scrollToSection(navigationController.contactKey, "Contact"),
              context,
            ),
          ],
        ),
      );
    });
  }

  Widget _drawerItem(String text, VoidCallback onTap, BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(
          color:
              navigationController.selectedNavItem.value == text
                  ? primaryColor
                  : Theme.of(context).colorScheme.secondary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: () {
        Navigator.pop(Get.context!);
        onTap();
      },
    );
  }
}
