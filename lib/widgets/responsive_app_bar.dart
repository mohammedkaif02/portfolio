import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:light_dark_theme_toggle/light_dark_theme_toggle.dart';
import 'package:mr_portfolio/Controller/controller.dart';
import 'package:mr_portfolio/MyText.dart';
import 'package:mr_portfolio/themeColor.dart';

class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ScrollControllerX controller = Get.put(ScrollControllerX());

  ResponsiveAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 800; // Mobile breakpoint
        return Obx(() {
          return AppBar(
            surfaceTintColor: Colors.transparent,
            shadowColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            backgroundColor:
                controller.toggle.value == true
                    ? Colors.white
                    : Color(0xff111827),
            toolbarHeight: 80,
            leading:
                isMobile
                    ? IconButton(
                      icon: Icon(Icons.menu, color: primaryColor),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    )
                    : SizedBox(),
            title:
                isMobile
                    ? Row(
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
                          () => controller.scrollToSection(
                            controller.homeKey,
                            "Home",
                          ),
                        ),
                        _navItem(
                          "About",
                          () => controller.scrollToSection(
                            controller.aboutUsKey,
                            "About",
                          ),
                        ),
                        _navItem(
                          "Skills",
                          () => controller.scrollToSection(
                            controller.whatIDoKey,
                            "Skills",
                          ),
                        ),
                        _navItem(
                          "Projects",
                          () => controller.scrollToSection(
                            controller.projectKey,
                            "Projects",
                          ),
                        ),
                        _navItem(
                          "Contact",
                          () => controller.scrollToSection(
                            controller.contactKey,
                            "Contact",
                          ),
                        ),
                      ],
                    ),
            actions:
                isMobile
                    ? [
                      Obx(() {
                        return LightDarkThemeToggle(
                          value: controller.toggle.value,
                          onChanged: (onChanged) {
                            controller.toggleTheme();
                          },
                          tooltip:
                              controller.toggle.value == true
                                  ? "DarkMode"
                                  : "LightMode",
                          color:
                              controller.toggle.value == true
                                  ? Colors.black87
                                  : Colors.yellow.shade300,
                        );
                      }),
                    ]
                    : [
                      Obx(() {
                        return LightDarkThemeToggle(
                          value: controller.toggle.value,
                          onChanged: (onChanged) {
                            controller.toggleTheme();
                          },
                          tooltip:
                              controller.toggle.value == true
                                  ? "DarkMode"
                                  : "LightMode",
                          color:
                              controller.toggle.value == true
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
          controller.selectedNavItem.value == text
              ? primaryColor
              : (controller.hoverNavItem.value == text
                  ? primaryColor
                  : Colors.grey);

      return InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onTap,
        onHover: (isHovering) {
          controller.hoverNavItem.value = isHovering ? text : "";
        },
        child: MyText(
          text: text,
          fontSize: 20,
          textColor: textColor,
          fontWeight:
              controller.selectedNavItem.value == text
                  ? FontWeight.bold
                  : FontWeight.normal,
        ),
      );
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
