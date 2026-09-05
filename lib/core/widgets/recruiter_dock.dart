import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/constants/app_dimensions.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/features/cv/presentation/controllers/cv_controller.dart';
import 'package:portfolio/features/home/presentation/controllers/navigation_controller.dart';
import 'package:portfolio/features/home/presentation/controllers/theme_controller.dart';

class RecruiterDock extends StatelessWidget {
  const RecruiterDock({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final nav = Get.find<NavigationController>();
    final cvController = Get.find<CVController>();

    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppDimensions.breakpointMobile;

    return Obx(() {
      final isDark = !themeController.toggle.value;
      final bgColor =
          isDark
              ? const Color(0xFF1E293B).withValues(alpha: 0.85)
              : Colors.white.withValues(alpha: 0.88);
      final borderColor =
          isDark
              ? Colors.white.withValues(alpha: 0.12)
              : Colors.black.withValues(alpha: 0.08);

      return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: isMobile ? 12 : 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 12 : 18,
                  vertical: isMobile ? 8 : 10,
                ),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
                  border: Border.all(color: borderColor, width: 1.2),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.25),
                      blurRadius: 20,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(() {
                      final isDownloading = cvController.isDownloading.value;
                      return _DockItem(
                        icon:
                            isDownloading
                                ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                                : const Icon(
                                  Icons.description_rounded,
                                  size: 16,
                                  color: Colors.white,
                                ),
                        label: isMobile ? null : AppStrings.dockResume,
                        isPrimary: true,
                        isDark: isDark,
                        onTap:
                            isDownloading
                                ? null
                                : () => cvController.downloadCV(),
                      );
                    }),
                    const Gap(8),

                    _DockItem(
                      icon: Icon(
                        Icons.email_rounded,
                        size: 16,
                        color: isDark ? Colors.white70 : Colors.black87,
                      ),
                      label: isMobile ? null : AppStrings.dockEmail,
                      isPrimary: false,
                      isDark: isDark,
                      onTap: () => nav.myLaunchUrl(AppStrings.emailUrl),
                    ),
                    const Gap(6),

                    _DockItem(
                      icon: FaIcon(
                        FontAwesomeIcons.github,
                        size: 15,
                        color: isDark ? Colors.white70 : Colors.black87,
                      ),
                      label: isMobile ? null : AppStrings.dockGitHub,
                      isPrimary: false,
                      isDark: isDark,
                      onTap: () => nav.myLaunchUrl(AppStrings.gitHubUrl),
                    ),
                    const Gap(6),

                    _DockItem(
                      icon: FaIcon(
                        FontAwesomeIcons.linkedinIn,
                        size: 14,
                        color: isDark ? Colors.white70 : Colors.black87,
                      ),
                      label: isMobile ? null : AppStrings.dockLinkedIn,
                      isPrimary: false,
                      isDark: isDark,
                      onTap: () => nav.myLaunchUrl(AppStrings.linkedInUrl),
                    ),
                    const Gap(6),

                    _DockItem(
                      icon: FaIcon(
                        FontAwesomeIcons.whatsapp,
                        size: 15,
                        color: const Color(0xFF22C55E),
                      ),
                      label: isMobile ? null : AppStrings.dockWhatsApp,
                      isPrimary: false,
                      isDark: isDark,
                      onTap: () => nav.myLaunchUrl(AppStrings.whatsAppUrl),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class _DockItem extends StatefulWidget {
  final Widget icon;
  final String? label;
  final bool isPrimary;
  final bool isDark;
  final VoidCallback? onTap;

  const _DockItem({
    required this.icon,
    this.label,
    required this.isPrimary,
    required this.isDark,
    this.onTap,
  });

  @override
  State<_DockItem> createState() => _DockItemState();
}

class _DockItemState extends State<_DockItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.08 : 1.0,
        duration: const Duration(milliseconds: 160),
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: widget.label != null ? 12 : 9,
              vertical: 7,
            ),
            decoration: BoxDecoration(
              gradient: widget.isPrimary ? AppColors.brandGradient : null,
              color:
                  widget.isPrimary
                      ? null
                      : (_isHovered
                          ? AppColors.primary.withValues(alpha: 0.12)
                          : (widget.isDark
                              ? Colors.white.withValues(alpha: 0.05)
                              : Colors.black.withValues(alpha: 0.04))),
              borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
              border: Border.all(
                color:
                    widget.isPrimary
                        ? Colors.transparent
                        : (_isHovered
                            ? AppColors.primary.withValues(alpha: 0.5)
                            : Colors.transparent),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                widget.icon,
                if (widget.label != null) ...[
                  const Gap(6),
                  Text(
                    widget.label!,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight:
                          widget.isPrimary ? FontWeight.bold : FontWeight.w500,
                      color:
                          widget.isPrimary
                              ? Colors.white
                              : (widget.isDark ? Colors.white : Colors.black87),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
