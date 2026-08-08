import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:light_dark_theme_toggle/light_dark_theme_toggle.dart';
import 'package:mr_portfolio/core/theme/app_colors.dart';
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
          final isLight = themeController.toggle.value;
          final bgColor = isLight
              ? Colors.white.withValues(alpha: 0.85)
              : const Color(0xff111827).withValues(alpha: 0.85);

          return ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(
                decoration: BoxDecoration(
                  color: bgColor,
                  border: Border(
                    bottom: BorderSide(
                      color: isLight
                          ? Colors.black.withValues(alpha: 0.06)
                          : Colors.white.withValues(alpha: 0.08),
                      width: 1,
                    ),
                  ),
                ),
                child: AppBar(
                  surfaceTintColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  foregroundColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  toolbarHeight: 70,
                  leading: isMobile
                      ? IconButton(
                          icon: const Icon(Icons.menu, color: primaryColor),
                          onPressed: () => Scaffold.of(context).openDrawer(),
                        )
                      : null,
                  leadingWidth: isMobile ? 56 : 0,
                  title: isMobile
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Mohammed Kaif",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: isLight ? primaryColor : Colors.white,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            // Brand Logo Avatar Badge
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                              decoration: BoxDecoration(
                                gradient: AppColors.brandGradient,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: primaryColor.withValues(alpha: 0.35),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: const Row(
                                children: [
                                  Icon(Icons.code_rounded, color: Colors.white, size: 18),
                                  SizedBox(width: 8),
                                  Text(
                                    "MK",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),

                            // Navigation Items Row
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _navItem(
                                  "Home",
                                  () => navigationController.scrollToSection(
                                    navigationController.homeKey,
                                    "Home",
                                  ),
                                ),
                                const SizedBox(width: 20),
                                _navItem(
                                  "About",
                                  () => navigationController.scrollToSection(
                                    navigationController.aboutUsKey,
                                    "About",
                                  ),
                                ),
                                const SizedBox(width: 20),
                                _navItem(
                                  "Experience",
                                  () => navigationController.scrollToSection(
                                    navigationController.experienceKey,
                                    "Experience",
                                  ),
                                ),
                                const SizedBox(width: 20),
                                _navItem(
                                  "Skills",
                                  () => navigationController.scrollToSection(
                                    navigationController.whatIDoKey,
                                    "Skills",
                                  ),
                                ),
                                const SizedBox(width: 20),
                                _navItem(
                                  "Projects",
                                  () => navigationController.scrollToSection(
                                    navigationController.projectKey,
                                    "Projects",
                                  ),
                                ),
                                const SizedBox(width: 20),
                                _navItem(
                                  "Contact",
                                  () => navigationController.scrollToSection(
                                    navigationController.contactKey,
                                    "Contact",
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Obx(() {
                        return LightDarkThemeToggle(
                          value: themeController.toggle.value,
                          onChanged: (onChanged) {
                            themeController.toggleTheme();
                          },
                          tooltip: themeController.toggle.value
                              ? "DarkMode"
                              : "LightMode",
                          color: themeController.toggle.value
                              ? Colors.black87
                              : Colors.yellow.shade300,
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }

  Widget _navItem(String text, VoidCallback onTap) {
    return Obx(() {
      final isSelected = navigationController.selectedNavItem.value == text;
      final isHovered = navigationController.hoverNavItem.value == text;
      final isDark = !themeController.toggle.value;

      Color textColor = isSelected
          ? primaryColor
          : (isHovered
              ? primaryColor
              : (isDark ? Colors.white70 : Colors.black87));

      return InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onTap,
        onHover: (hovering) {
          navigationController.hoverNavItem.value = hovering ? text : "";
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            color: isSelected
                ? primaryColor.withValues(alpha: 0.12)
                : (isHovered
                    ? primaryColor.withValues(alpha: 0.08)
                    : Colors.transparent),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? primaryColor.withValues(alpha: 0.5) : Colors.transparent,
              width: 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyText(
                text: text,
                fontSize: 15,
                textColor: textColor,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

