import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:light_dark_theme_toggle/light_dark_theme_toggle.dart';
import 'package:mr_portfolio/core/theme/theme_color.dart';
import 'package:mr_portfolio/core/widgets/my_text.dart';
import 'package:mr_portfolio/features/home/presentation/controllers/navigation_controller.dart';
import 'package:mr_portfolio/features/home/presentation/controllers/theme_controller.dart';

class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final NavigationController navigationController = Get.find();
  final ThemeController themeController = Get.find();

  ResponsiveAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 800;
        return Obx(() {
          return AppBar(
            surfaceTintColor: Colors.transparent,
            shadowColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            backgroundColor:
                themeController.toggle.value == true
                    ? Colors.white
                    : const Color(0xff111827),
            toolbarHeight: 80,
            leading:
                isMobile
                    ? IconButton(
                      icon: const Icon(Icons.menu, color: primaryColor),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    )
                    : const SizedBox(),
            title:
                isMobile
                    ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          text: "Portfolio",
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          textColor: primaryColor,
                        ),
                      ],
                    )
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _navItem(
                          "Home",
                          () => navigationController.scrollToSection(
                            navigationController.homeKey,
                            "Home",
                          ),
                        ),
                        _navItem(
                          "About",
                          () => navigationController.scrollToSection(
                            navigationController.aboutUsKey,
                            "About",
                          ),
                        ),
                        _navItem(
                          "Experience",
                          () => navigationController.scrollToSection(
                            navigationController.experienceKey,
                            "Experience",
                          ),
                        ),
                        _navItem(
                          "Skills",
                          () => navigationController.scrollToSection(
                            navigationController.whatIDoKey,
                            "Skills",
                          ),
                        ),
                        _navItem(
                          "Projects",
                          () => navigationController.scrollToSection(
                            navigationController.projectKey,
                            "Projects",
                          ),
                        ),
                        _navItem(
                          "Contact",
                          () => navigationController.scrollToSection(
                            navigationController.contactKey,
                            "Contact",
                          ),
                        ),
                      ],
                    ),
            actions: [
              Obx(() {
                return LightDarkThemeToggle(
                  value: themeController.toggle.value,
                  onChanged: (onChanged) {
                    themeController.toggleTheme();
                  },
                  tooltip:
                      themeController.toggle.value == true
                          ? "DarkMode"
                          : "LightMode",
                  color:
                      themeController.toggle.value == true
                          ? Colors.black87
                          : Colors.yellow.shade300,
                );
              }),
            ],
          );
        });
      },
    );
  }

  Widget _navItem(String text, VoidCallback onTap) {
    return Obx(() {
      Color textColor =
          navigationController.selectedNavItem.value == text
              ? primaryColor
              : (navigationController.hoverNavItem.value == text
                  ? primaryColor
                  : Colors.grey);

      return InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onTap,
        onHover: (isHovering) {
          navigationController.hoverNavItem.value = isHovering ? text : "";
        },
        child: MyText(
          text: text,
          fontSize: 20,
          textColor: textColor,
          fontWeight:
              navigationController.selectedNavItem.value == text
                  ? FontWeight.bold
                  : FontWeight.normal,
        ),
      );
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
