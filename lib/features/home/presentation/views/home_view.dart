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

  Widget _buildGreetingEyebrow(bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.35),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF10B981),
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            "PRODUCTION FLUTTER & MOBILE ENGINEER",
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
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
              const Gap(50),
              ScrollReveal(
                delayMs: 0,
                child: _buildGreetingEyebrow(isDark),
              ),
              const Gap(14),
              ScrollReveal(
                delayMs: 50,
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
                delayMs: 150,
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
                delayMs: 200,
                child: StatusBadge(isCompact: true),
              ),
              const Gap(24),
              // Compact Orbiting Visual for Mobile
              const ScrollReveal(
                delayMs: 250,
                child: HeroVisual(size: 250),
              ),
              const Gap(24),
              ScrollReveal(
                delayMs: 300,
                child: _socialIconsRow(context, AppDimensions.iconL),
              ),
              const Gap(28),
              ScrollReveal(delayMs: 350, child: _buttonsRow(context)),
              const Gap(30),
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
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      decoration: _backgroundDecoration(themeController.toggle.value),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScrollReveal(
              delayMs: 0,
              child: _buildGreetingEyebrow(isDark),
            ),
            const Gap(14),
            ScrollReveal(
              delayMs: 50,
              child: _gradientText(AppStrings.name, 56, isDark: isDark),
            ),
            const Gap(12),
            ScrollReveal(
              delayMs: 100,
              child: TypingText(
                texts: AppStrings.typingRoles,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isDark ? const Color(0xFFC084FC) : primaryColor,
                ),
              ),
            ),
            const Gap(16),
            ScrollReveal(
              delayMs: 150,
              child: SizedBox(
                width: width * 0.75,
                child: MyText(
                  text: AppStrings.tagline,
                  textColor:
                      isDark
                          ? Colors.white.withValues(alpha: 0.88)
                          : Colors.black87,
                  textAlign: TextAlign.center,
                  fontSize: 16,
                ),
              ),
            ),
            const Gap(20),
            const ScrollReveal(delayMs: 200, child: StatusBadge()),
            const Gap(25),
            // Orbiting Hero Visual for Tablet
            const ScrollReveal(
              delayMs: 250,
              child: HeroVisual(size: 290),
            ),
            const Gap(25),
            ScrollReveal(delayMs: 300, child: _socialIconsRow(context, 26)),
            const Gap(30),
            ScrollReveal(delayMs: 350, child: _buttonsRow(context)),
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
      height: height.clamp(720, 950),
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
                      child: _buildGreetingEyebrow(isDark),
                    ),
                    const Gap(14),
                    ScrollReveal(
                      delayMs: 50,
                      child: _gradientText(AppStrings.name, 72, isDark: isDark),
                    ),
                    const Gap(8),
                    ScrollReveal(
                      delayMs: 100,
                      child: TypingText(
                        texts: AppStrings.typingRoles,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color:
                              isDark ? const Color(0xFFC084FC) : primaryColor,
                        ),
                      ),
                    ),
                    const Gap(16),
                    ScrollReveal(
                      delayMs: 150,
                      child: SizedBox(
                        width: width * 0.45,
                        child: MyText(
                          text: AppStrings.tagline,
                          textColor:
                              isDark
                                  ? Colors.white.withValues(alpha: 0.88)
                                  : Colors.black87,
                          textAlign: TextAlign.start,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    const Gap(20),
                    const ScrollReveal(delayMs: 200, child: StatusBadge()),
                    const Gap(25),
                    ScrollReveal(
                      delayMs: 250,
                      child: _socialIconsRow(context, 26),
                    ),
                    const Gap(35),
                    ScrollReveal(delayMs: 300, child: _buttonsRow(context)),
                  ],
                ),
              ),

              // Right Hero Visual Orbit Widget
              Expanded(
                flex: 4,
                child: ScrollReveal(
                  delayMs: 200,
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
                    Color(0xFFE9D5FF),
                    Color(0xFFC084FC),
                    Color(0xFFA855F7),
                    Color(0xFF60A5FA),
                  ]
                  : const [
                    Color(0xFF5B21B6),
                    Color(0xFF7C3AED),
                    Color(0xFF1D4ED8),
                  ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(rect);
      },
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.w900,
          letterSpacing: -0.5,
          height: 1.1,
        ),
      ),
    );
  }

  Widget _socialIconsRow(BuildContext context, double iconSize) {
    return Row(
      mainAxisSize: MainAxisSize.min,
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
    required dynamic icon,
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
            margin: const EdgeInsets.only(right: 14),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow:
                  hoverValue.value
                      ? [
                        BoxShadow(
                          color: primaryColor.withValues(alpha: 0.45),
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
                18,
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
      spacing: 16,
      runSpacing: 14,
      children: [
        _hoverableButton(
          text: AppStrings.btnConnect,
          icon: Icons.chat_bubble_outline_rounded,
          isPrimary: true,
          hoverValue: navigationController.isHoveringConnect,
          onTap:
              () => navigationController.scrollToSection(
                navigationController.contactKey,
                "Contact",
              ),
        ),
        _hoverableButton(
          text: AppStrings.btnDownloadCV,
          icon: Icons.download_rounded,
          isPrimary: false,
          hoverValue: cvController.isHoveringDownload,
          onTap: cvController.downloadCV,
        ),
      ],
    );
  }

  Widget _hoverableButton({
    required String text,
    required IconData icon,
    required bool isPrimary,
    required RxBool hoverValue,
    required VoidCallback onTap,
  }) {
    return MouseRegion(
      onEnter: (_) => hoverValue.value = true,
      onExit: (_) => hoverValue.value = false,
      child: Obx(
        () {
          final isHovered = hoverValue.value;
          final isDark = !themeController.toggle.value;

          return AnimatedScale(
            scale: isHovered ? 1.05 : 1.0,
            duration: const Duration(milliseconds: 180),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 13),
              decoration: BoxDecoration(
                gradient: isPrimary ? AppColors.brandGradient : null,
                color:
                    isPrimary
                        ? null
                        : (isDark
                            ? Colors.white.withValues(alpha: 0.06)
                            : Colors.black.withValues(alpha: 0.04)),
                borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
                border: Border.all(
                  color:
                      isPrimary
                          ? Colors.transparent
                          : (isHovered
                              ? AppColors.primary
                              : (isDark ? Colors.white24 : Colors.black26)),
                  width: 1.4,
                ),
                boxShadow: [
                  BoxShadow(
                    color:
                        isHovered
                            ? AppColors.primary.withValues(alpha: 0.45)
                            : (isPrimary
                                ? AppColors.primary.withValues(alpha: 0.25)
                                : Colors.transparent),
                    blurRadius: isHovered ? 16 : 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: onTap,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      icon,
                      size: 16,
                      color:
                          isPrimary
                              ? Colors.white
                              : (isHovered
                                  ? AppColors.primary
                                  : (isDark ? Colors.white : Colors.black87)),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      text,
                      style: TextStyle(
                        color:
                            isPrimary
                                ? Colors.white
                                : (isHovered
                                    ? AppColors.primary
                                    : (isDark ? Colors.white : Colors.black87)),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget buildIconContainer(
  BuildContext context,
  bool isLight,
  bool isHovered,
  dynamic icon,
  double size,
) {
  final iconColor =
      isLight ? const Color(0xFF2D1060) : const Color(0xFFEDE7FF);

  return Container(
    padding: const EdgeInsets.all(11),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: isLight ? Colors.white : const Color(0xFF1E293B),
      border: Border.all(
        color:
            isHovered
                ? AppColors.primary
                : (isLight ? Colors.black12 : Colors.white12),
        width: 1.2,
      ),
      boxShadow: [
        BoxShadow(
          color:
              isHovered
                  ? AppColors.primary.withValues(alpha: 0.5)
                  : (isLight
                      ? Colors.black.withValues(alpha: 0.05)
                      : Colors.black.withValues(alpha: 0.3)),
          blurRadius: 10,
          spreadRadius: 1,
        ),
      ],
    ),
    child:
        icon is FaIconData
            ? FaIcon(icon, color: iconColor, size: size)
            : Icon(icon as IconData, color: iconColor, size: size),
  );
}
