import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_portfolio/Controller/controller.dart';
import 'package:mr_portfolio/themeColor.dart';

class MyDrawer extends StatelessWidget {
  final ScrollControllerX controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
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
          ),
          _drawerItem(
            "About",
            () => controller.scrollToSection(controller.aboutUsKey, "About"),
          ),
          _drawerItem(
            "Skills",
            () => controller.scrollToSection(controller.whatIDoKey, "Skills"),
          ),
          _drawerItem(
            "Projects",
            () => controller.scrollToSection(controller.projectKey, "Projects"),
          ),
          _drawerItem(
            "Contact",
            () => controller.scrollToSection(controller.contactKey, "Contact"),
          ),
        ],
      ),
    );
  }

  Widget _drawerItem(String text, VoidCallback onTap) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(
          color:
              controller.selectedNavItem.value == text
                  ? primaryColor
                  : Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: () {
        Navigator.pop(Get.context!); // Close drawer
        onTap();
      },
    );
  }
}
