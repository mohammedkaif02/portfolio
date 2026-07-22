import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_portfolio/core/constants/app_dimensions.dart';
import 'package:mr_portfolio/core/constants/app_strings.dart';
import 'package:mr_portfolio/core/theme/app_colors.dart';
import 'package:mr_portfolio/core/theme/theme_color.dart';
import 'package:mr_portfolio/core/widgets/my_text.dart';
import 'package:mr_portfolio/core/widgets/responsive.dart';
import 'package:mr_portfolio/core/widgets/section_header.dart';
import 'package:mr_portfolio/features/home/presentation/controllers/navigation_controller.dart';
import 'package:mr_portfolio/features/home/presentation/controllers/theme_controller.dart';

class About extends StatelessWidget {
  About({super.key});

  final NavigationController navigationController = Get.find();
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Container(
        key: navigationController.aboutUsKey,
        padding: const EdgeInsets.symmetric(vertical: 60),
        color:
            themeController.toggle.value
                ? AppColors.lightCardSurface
                : AppColors.darkCardSurface,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SectionHeader(
              title: AppStrings.navAbout,
              fontSize: AppDimensions.fontSectionMobile,
            ),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              child: MyText(
                text: AppStrings.aboutParagraph1,
                textColor: Theme.of(context).colorScheme.secondary,
                textAlign: TextAlign.justify,
                fontSize: 14,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              child: MyText(
                text: AppStrings.aboutParagraph2,
                textColor: Theme.of(context).colorScheme.secondary,
                textAlign: TextAlign.justify,
                fontSize: 14,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              child: MyText(
                text: AppStrings.aboutParagraph3,
                textColor: Theme.of(context).colorScheme.secondary,
                textAlign: TextAlign.justify,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),

            _buildFeatureCard(
              context,
              navigationController,
              themeController,
              index: 0,
              iconPath: AppStrings.mobileIconPath,
              title: AppStrings.featureFlutterDevelopmentTitle,
              subtitle: AppStrings.featureFlutterDevelopmentSub,
              titleSize: 14,
              subtitleSize: 12,
              maxWidth: 330,
            ),
            const SizedBox(height: 25),
            _buildFeatureCard(
              context,
              navigationController,
              themeController,
              index: 1,
              iconPath: AppStrings.backendIconPath,
              title: AppStrings.featureBackendTitle,
              subtitle: AppStrings.featureBackendSub,
              titleSize: 14,
              subtitleSize: 12,
              maxWidth: 330,
            ),
            const SizedBox(height: 25),
            _buildFeatureCard(
              context,
              navigationController,
              themeController,
              index: 2,
              iconPath: AppStrings.googlePlayIconPath,
              title: AppStrings.featureDeployTitle,
              subtitle: AppStrings.featureDeploySub,
              titleSize: 14,
              subtitleSize: 12,
              maxWidth: 330,
            ),
            const SizedBox(height: 25),
            _buildFeatureCard(
              context,
              navigationController,
              themeController,
              index: 3,
              iconPath: AppStrings.uiUxIconPath,
              title: AppStrings.featureUiUxTitle,
              subtitle: AppStrings.featureUiUxSub,
              titleSize: 14,
              subtitleSize: 12,
              maxWidth: 330,
            ),
          ],
        ),
      ),
      tablet: Container(
        key: navigationController.aboutUsKey,
        padding: const EdgeInsets.symmetric(vertical: 80),
        color:
            themeController.toggle.value
                ? AppColors.lightCardSurface
                : AppColors.darkCardSurface,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SectionHeader(title: AppStrings.navAbout),
            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              child: MyText(
                text: AppStrings.aboutParagraph1,
                textColor: Theme.of(context).colorScheme.secondary,
                textAlign: TextAlign.justify,
                fontSize: 16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              child: MyText(
                text: AppStrings.aboutParagraph2,
                textColor: Theme.of(context).colorScheme.secondary,
                textAlign: TextAlign.justify,
                fontSize: 16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              child: MyText(
                text: AppStrings.aboutParagraph3,
                textColor: Theme.of(context).colorScheme.secondary,
                textAlign: TextAlign.justify,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 25),
            _buildFeatureCard(
              context,
              navigationController,
              themeController,
              index: 0,
              iconPath: AppStrings.mobileIconPath,
              title: AppStrings.featureFlutterDevelopmentTitle,
              subtitle: AppStrings.featureFlutterDevelopmentSub,
              titleSize: 16,
              subtitleSize: 14,
              maxWidth: 400,
            ),
            const SizedBox(height: 25),
            _buildFeatureCard(
              context,
              navigationController,
              themeController,
              index: 1,
              iconPath: AppStrings.backendIconPath,
              title: AppStrings.featureBackendTitle,
              subtitle: AppStrings.featureBackendSub,
              titleSize: 16,
              subtitleSize: 14,
              maxWidth: 400,
            ),
            const SizedBox(height: 25),
            _buildFeatureCard(
              context,
              navigationController,
              themeController,
              index: 2,
              iconPath: AppStrings.googlePlayIconPath,
              title: AppStrings.featureDeployTitle,
              subtitle: AppStrings.featureDeploySub,
              titleSize: 16,
              subtitleSize: 14,
              maxWidth: 400,
            ),
            const SizedBox(height: 25),
            _buildFeatureCard(
              context,
              navigationController,
              themeController,
              index: 3,
              iconPath: AppStrings.uiUxIconPath,
              title: AppStrings.featureUiUxTitle,
              subtitle: AppStrings.featureUiUxSub,
              titleSize: 16,
              subtitleSize: 14,
              maxWidth: 400,
            ),
          ],
        ),
      ),
      desktop: Container(
        key: navigationController.aboutUsKey,
        padding: const EdgeInsets.symmetric(vertical: 100),
        color:
            themeController.toggle.value
                ? AppColors.lightCardSurface
                : AppColors.darkCardSurface,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  MyText(
                    text: AppStrings.navAbout,
                    fontSize: 50,
                    textColor: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                  ),
                  Container(
                    width: 100,
                    height: 3,
                    margin: const EdgeInsets.only(top: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xff7241ea),
                          Color(0xff783ee8),
                          Color(0xff793eea),
                          Color(0xff7e3cea),
                          Color(0xff833aea),
                          Color(0xff8334e2),
                          Color(0xff9233ea),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width / (16 / 9) * 0.16,
                left: 60,
                right: 60,
                bottom: 60,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        _buildFeatureCard(
                          context,
                          navigationController,
                          themeController,
                          index: 0,
                          iconPath: AppStrings.mobileIconPath,
                          title: AppStrings.featureFlutterDevelopmentTitle,
                          subtitle: AppStrings.featureFlutterDevelopmentSub,
                          titleSize: 18,
                          subtitleSize: 16,
                          maxWidth: 400,
                        ),
                        const SizedBox(height: 25),
                        _buildFeatureCard(
                          context,
                          navigationController,
                          themeController,
                          index: 1,
                          iconPath: AppStrings.backendIconPath,
                          title: AppStrings.featureBackendTitle,
                          subtitle: AppStrings.featureBackendSub,
                          titleSize: 18,
                          subtitleSize: 16,
                          maxWidth: 400,
                        ),
                        const SizedBox(height: 25),
                        _buildFeatureCard(
                          context,
                          navigationController,
                          themeController,
                          index: 2,
                          iconPath: AppStrings.googlePlayIconPath,
                          title: AppStrings.featureDeployTitle,
                          subtitle: AppStrings.featureDeploySub,
                          titleSize: 18,
                          subtitleSize: 16,
                          maxWidth: 400,
                        ),
                        const SizedBox(height: 25),
                        _buildFeatureCard(
                          context,
                          navigationController,
                          themeController,
                          index: 3,
                          iconPath: AppStrings.uiUxIconPath,
                          title: AppStrings.featureUiUxTitle,
                          subtitle: AppStrings.featureUiUxSub,
                          titleSize: 18,
                          subtitleSize: 16,
                          maxWidth: 400,
                        ),
                      ],
                    ),
                  ),

                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 700,
                          child: MyText(
                            text: AppStrings.aboutParagraph1,
                            textColor: Theme.of(context).colorScheme.secondary,
                            textAlign: TextAlign.justify,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 700,
                          child: MyText(
                            text: AppStrings.aboutParagraph2,
                            textColor: Theme.of(context).colorScheme.secondary,
                            textAlign: TextAlign.justify,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 700,
                          child: MyText(
                            text: AppStrings.aboutParagraph3,
                            textColor: Theme.of(context).colorScheme.secondary,
                            textAlign: TextAlign.justify,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildFeatureCard(
  BuildContext context,
  NavigationController navigationController,
  ThemeController themeController, {
  required int index,
  required String iconPath,
  required String title,
  required double titleSize,
  required double subtitleSize,
  required double maxWidth,
  required String subtitle,
}) {
  return MouseRegion(
    onEnter: (_) => navigationController.onEnterCard(index, true),
    onExit: (_) => navigationController.onEnterCard(index, false),
    child: Obx(
      () => AnimatedScale(
        scale: navigationController.isHoveredList[index].value ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color:
                  themeController.toggle.value == true
                      ? const Color(0xfff1f7ff)
                      : const Color(0xff111827),
              boxShadow:
                  navigationController.isHoveredList[index].value
                      ? [
                        BoxShadow(
                          color: const Color(0xff7241ea).withValues(alpha: 0.5),
                          blurRadius: 12,
                          spreadRadius: 2,
                        ),
                      ]
                      : [
                        BoxShadow(
                          color:
                              themeController.toggle.value == true
                                  ? Colors.black.withValues(alpha: 0.2)
                                  : Colors.black.withValues(alpha: 0.5),
                          blurRadius: 12,
                          spreadRadius: 2,
                        ),
                      ],
            ),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        primaryColor,
                        Color(0xff7241ea),
                        Color(0xff9233ea),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(iconPath, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: title,
                      fontSize: titleSize,
                      textColor: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                    MyText(
                      text: subtitle,
                      textColor: Theme.of(context).colorScheme.secondary,
                      fontSize: subtitleSize,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
