import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_portfolio/Controller/controller.dart';
import 'package:mr_portfolio/themeColor.dart';

class MyDrawer extends StatelessWidget {
  final ScrollControllerX controller = Get.find();

  MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Drawer(
        backgroundColor:
            controller.toggle.value
                ? const Color(0xfffbf8ff)
                : const Color(0xff111827),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color:
                    controller.toggle.value
                        ? const Color(0xfffbf8ff)
                        : const Color(0xff111827),
              ),
              child: Center(
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
              () => controller.scrollToSection(controller.homeKey, "Home"),
              context,
            ),
            _drawerItem(
              "About",
              () => controller.scrollToSection(controller.aboutUsKey, "About"),
              context,
            ),
            _drawerItem(
              "Skills",
              () => controller.scrollToSection(controller.whatIDoKey, "Skills"),
              context,
            ),
            _drawerItem(
              "Projects",
              () =>
                  controller.scrollToSection(controller.projectKey, "Projects"),
              context,
            ),
            _drawerItem(
              "Contact",
              () =>
                  controller.scrollToSection(controller.contactKey, "Contact"),
              context,
            ),
          ],
        ),
      );
    });
  }

  Widget _drawerItem(String text, VoidCallback onTap, context) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(
          color:
              controller.selectedNavItem.value == text
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
