import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/constants/app_dimensions.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/theme_color.dart';
import 'package:portfolio/core/widgets/hero_visual.dart';
import 'package:portfolio/core/widgets/my_text.dart';
import 'package:portfolio/core/widgets/scroll_reveal.dart';
import 'package:portfolio/core/widgets/typing_text.dart';
import 'package:portfolio/features/home/presentation/controllers/navigation_controller.dart';
import 'package:portfolio/features/home/presentation/controllers/theme_controller.dart';
import 'package:portfolio/features/cv/presentation/controllers/cv_controller.dart';
import 'package:portfolio/features/home/presentation/widgets/status_badge.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final NavigationController navigationController =
      Get.find<NavigationController>();
  final ThemeController themeController = Get.find<ThemeController>();
  final CVController cvController = Get.find<CVController>();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    if (width < AppDimensions.breakpointMobile) {
      return _buildMobileLayout(context, width, height);
    } else if (width < AppDimensions.breakpointTablet) {
      return _buildTabletLayout(context, width, height);
    } else {
      return _buildDesktopLayout(context, width, height);
    }
  }

  BoxDecoration _backgroundDecoration(bool isLight) {
    return BoxDecoration(
      gradient:
          isLight ? AppColors.lightHeroGradient : AppColors.darkHeroGradient,
    );
  }

  Widget _buildMobileLayout(BuildContext context, double width, double height) {
    final isDark = !themeController.toggle.value;
    final mobileFontSize = width < 380 ? 32.0 : (width < 480 ? 38.0 : 44.0);

    return Container(
      key: navigationController.homeKey,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.06,
        vertical: AppDimensions.spaceXL,
      ),
      decoration: _backgroundDecoration(themeController.toggle.value),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Gap(60),
              ScrollReveal(
                delayMs: 0,
                child: _gradientText(
                  AppStrings.name,
                  mobileFontSize,
                  isDark: isDark,
                ),
              ),
              const Gap(12),
              ScrollReveal(
                delayMs: 100,
                child: TypingText(
                  texts: AppStrings.typingRoles,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDark ? const Color(0xFFC084FC) : primaryColor,
                  ),
                ),
              ),
              const Gap(16),
              ScrollReveal(
                delayMs: 200,
                child: SizedBox(
                  width: width * 0.88,
                  child: MyText(
                    text: AppStrings.tagline,
                    textColor:
                        isDark
                            ? Colors.white.withValues(alpha: 0.88)
                            : Colors.black87,
                    textAlign: TextAlign.center,
                    fontSize: 14,
                  ),
                ),
              ),
              const Gap(20),
              const ScrollReveal(
                delayMs: 250,
                child: StatusBadge(isCompact: true),
              ),
              const Gap(24),
              ScrollReveal(
                delayMs: 300,
                child: _socialIconsRow(context, AppDimensions.iconL),
              ),
              const Gap(30),
              ScrollReveal(delayMs: 400, child: _buttonsRow(context)),
              const Gap(40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabletLayout(BuildContext context, double width, double height) {
    final isDark = !themeController.toggle.value;

    return Container(
      key: navigationController.homeKey,
      height: height,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      decoration: _backgroundDecoration(themeController.toggle.value),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScrollReveal(
              delayMs: 0,
              child: _gradientText(AppStrings.name, 60, isDark: isDark),
            ),
            const Gap(12),
            ScrollReveal(
              delayMs: 100,
              child: TypingText(
                texts: AppStrings.typingRoles,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: isDark ? const Color(0xFFC084FC) : primaryColor,
                ),
              ),
            ),
            const Gap(16),
            ScrollReveal(
              delayMs: 200,
              child: SizedBox(
                width: width * 0.75,
                child: MyText(
                  text: AppStrings.tagline,
                  textColor:
                      isDark
                          ? Colors.white.withValues(alpha: 0.88)
                          : Colors.black87,
                  textAlign: TextAlign.center,
                  fontSize: 18,
                ),
              ),
            ),
            const Gap(20),
            const ScrollReveal(delayMs: 250, child: StatusBadge()),
            const Gap(25),
            ScrollReveal(delayMs: 300, child: _socialIconsRow(context, 26)),
            const Gap(35),
            ScrollReveal(delayMs: 400, child: _buttonsRow(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(
    BuildContext context,
    double width,
    double height,
  ) {
    final isDark = !themeController.toggle.value;

    return Container(
      key: navigationController.homeKey,
      height: height,
      width: double.infinity,
      decoration: _backgroundDecoration(themeController.toggle.value),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Left Content Column
              Expanded(
                flex: 6,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ScrollReveal(
                      delayMs: 0,
                      child: _gradientText(AppStrings.name, 76, isDark: isDark),
                    ),
                    const Gap(8),
                    ScrollReveal(
                      delayMs: 100,
                      child: TypingText(
                        texts: AppStrings.typingRoles,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color:
                              isDark ? const Color(0xFFC084FC) : primaryColor,
                        ),
                      ),
                    ),
                    const Gap(16),
                    ScrollReveal(
                      delayMs: 200,
                      child: SizedBox(
                        width: width * 0.45,
                        child: MyText(
                          text: AppStrings.tagline,
                          textColor:
                              isDark
                                  ? Colors.white.withValues(alpha: 0.88)
                                  : Colors.black87,
                          textAlign: TextAlign.start,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const Gap(20),
                    const ScrollReveal(delayMs: 250, child: StatusBadge()),
                    const Gap(25),
                    ScrollReveal(
                      delayMs: 300,
                      child: _socialIconsRow(context, 28),
                    ),
                    const Gap(35),
                    ScrollReveal(delayMs: 400, child: _buttonsRow(context)),
                  ],
                ),
              ),

              // Right Hero Visual Orbit Widget
              Expanded(
                flex: 4,
                child: ScrollReveal(
                  delayMs: 300,
                  child: const Center(child: HeroVisual(size: 380)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _gradientText(String text, double size, {bool isDark = true}) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) {
        final rect = Rect.fromLTWH(
          0,
          0,
          bounds.width == 0 ? 300 : bounds.width,
          bounds.height == 0 ? 60 : bounds.height,
        );
        return LinearGradient(
          colors:
              isDark
                  ? const [
                    Color(0xFFE9D5FF), // Luminous Soft Purple
                    Color(0xFFC084FC), // Bright Lavender
                    Color(0xFFA855F7), // Neon Purple
                    Color(0xFF60A5FA), // Electric Cyan Blue
                  ]
                  : const [
                    Color(0xFF5B21B6), // Deep Royal Violet
                    Color(0xFF7C3AED), // Rich Purple
                    Color(0xFF1D4ED8), // Deep Blue
                  ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(rect);
      },
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.w900,
          letterSpacing: -0.5,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _socialIconsRow(BuildContext context, double iconSize) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 30,
      runSpacing: 20,
      children: [
        _hoverableIcon(
          context,
          icon: Icons.mail_outline_rounded,
          hoverValue: navigationController.isHoveringMail,
          onTap: () async {
            final Uri emailUri = Uri(
              scheme: 'mailto',
              path: AppStrings.personalEmail,
              query: 'subject=Hello Mohammed&body=Hi, I’d like to connect!',
            );
            await navigationController.myLaunchUrl(emailUri.toString());
          },
        ),
        _hoverableIcon(
          context,
          icon: FontAwesomeIcons.linkedinIn,
          hoverValue: navigationController.isHoveringLinkedIn,
          onTap: () => navigationController.myLaunchUrl(AppStrings.linkedInUrl),
        ),
        _hoverableIcon(
          context,
          icon: FontAwesomeIcons.github,
          hoverValue: navigationController.isHoveringGithub,
          onTap: () => navigationController.myLaunchUrl(AppStrings.gitHubUrl),
        ),
        _hoverableIcon(
          context,
          icon: FontAwesomeIcons.whatsapp,
          hoverValue: navigationController.isHoveringWhatsapp,
          onTap: () => navigationController.myLaunchUrl(AppStrings.whatsAppUrl),
        ),
      ],
    );
  }

  Widget _hoverableIcon(
    BuildContext context, {
    required IconData icon,
    required RxBool hoverValue,
    required VoidCallback onTap,
  }) {
    return MouseRegion(
      onEnter: (_) => hoverValue.value = true,
      onExit: (_) => hoverValue.value = false,
      child: Obx(
        () => AnimatedScale(
          scale: hoverValue.value ? 1.15 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow:
                  hoverValue.value
                      ? [
                        BoxShadow(
                          color: primaryColor.withValues(alpha: 0.4),
                          blurRadius: 15,
                          spreadRadius: 2,
                        ),
                      ]
                      : [],
            ),
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: onTap,
              child: buildIconContainer(
                context,
                themeController.toggle.value,
                hoverValue.value,
                icon,
                20,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonsRow(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 40,
      runSpacing: 20,
      children: [
        _hoverableButton(
          text: AppStrings.btnConnect,
          bgColor: primaryColor,
          textColor: Colors.white,
          hoverValue: navigationController.isHoveringConnect,
          onTap:
              () => navigationController.scrollToSection(
                navigationController.contactKey,
                "Contact",
              ),
        ),
        _hoverableButton(
          text: AppStrings.btnDownloadCV,
          bgColor: Colors.transparent,
          textColor: primaryColor,
          hoverValue: cvController.isHoveringDownload,
          onTap: cvController.downloadCV,
          border: Border.all(color: primaryColor, width: 1.5),
        ),
      ],
    );
  }

  Widget _hoverableButton({
    required String text,
    required Color bgColor,
    required Color textColor,
    required RxBool hoverValue,
    required VoidCallback onTap,
    Border? border,
  }) {
    return MouseRegion(
      onEnter: (_) => hoverValue.value = true,
      onExit: (_) => hoverValue.value = false,
      child: Obx(
        () => AnimatedScale(
          scale: hoverValue.value ? 1.08 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
            decoration: BoxDecoration(
              color: bgColor,
              border: border,
              borderRadius: BorderRadius.circular(8),
              boxShadow:
                  hoverValue.value
                      ? [
                        BoxShadow(
                          color: primaryColor.withValues(alpha: 0.5),
                          blurRadius: 12,
                          spreadRadius: 2,
                        ),
                      ]
                      : [],
            ),
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: onTap,
              child: MyText(text: text, textColor: textColor),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildIconContainer(
  BuildContext context,
  bool isLight,
  bool isHovered,
  IconData icon,
  double size,
) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11.5),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: isLight ? const Color(0xfffbf8ff) : const Color(0xff1f2937),
      boxShadow: [
        BoxShadow(
          color:
              isHovered
                  ? primaryColor.withValues(alpha: 0.6)
                  : (isLight
                      ? Colors.grey.withValues(alpha: 0.6)
                      : Colors.black54.withValues(alpha: 0.6)),
          blurRadius: 12,
          spreadRadius: 1,
        ),
      ],
    ),
    child: Icon(icon, color: Theme.of(context).colorScheme.onPrimaryContainer),
  );
}
