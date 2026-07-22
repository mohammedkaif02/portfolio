import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_portfolio/core/theme/app_colors.dart';
import 'package:mr_portfolio/core/theme/theme_color.dart';
import 'package:mr_portfolio/core/widgets/responsive.dart';
import 'package:mr_portfolio/features/about/presentation/views/about_view.dart';
import 'package:mr_portfolio/features/contact/presentation/views/contact_view.dart';
import 'package:mr_portfolio/features/experience/presentation/views/experience_view.dart';
import 'package:mr_portfolio/features/home/presentation/controllers/navigation_controller.dart';
import 'package:mr_portfolio/features/home/presentation/controllers/theme_controller.dart';
import 'package:mr_portfolio/features/home/presentation/views/footer_view.dart';
import 'package:mr_portfolio/features/home/presentation/views/home_view.dart';
import 'package:mr_portfolio/features/home/presentation/widgets/my_drawer.dart';
import 'package:mr_portfolio/features/home/presentation/widgets/responsive_app_bar.dart';
import 'package:mr_portfolio/features/skills/presentation/views/my_skills_view.dart';
import 'package:mr_portfolio/features/projects/presentation/views/projects_view.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final NavigationController navigationController = Get.put(
    NavigationController(),
  );
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: ResponsiveAppBar(),
      drawer: MyDrawer(),
      body: Stack(
        children: [
          Obx(() {
            return Container(
              color:
                  themeController.toggle.value == true
                      ? AppColors.lightBackground
                      : AppColors.darkBackground,
            );
          }),
          SingleChildScrollView(
            controller: navigationController.scrollController,
            child: Column(
              children: [
                Home(),
                About(),
                Experience(),
                MySkills(),
                Projects(),
                Contact(),
                Footer(),
              ],
            ),
          ),
          Positioned(
            bottom: Responsive.isMobile(context) ? 40 : 100,
            right: Responsive.isMobile(context) ? 20 : 60,
            child: Obx(() {
              return MouseRegion(
                onEnter: (_) => navigationController.onEnterScrollTop(true),
                onExit: (_) => navigationController.onEnterScrollTop(false),
                child: AnimatedScale(
                  scale:
                      navigationController.isHoveredScrollTop.value ? 1.1 : 1.0,
                  duration: const Duration(milliseconds: 200),
                  child: Visibility(
                    visible: navigationController.isButtonVisible.value,
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: navigationController.scrollToTop,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.keyboard_arrow_up,
                          size: 28,
                          color: secondaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
