import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mr_portfolio/core/constants/app_dimensions.dart';
import 'package:mr_portfolio/core/constants/app_strings.dart';
import 'package:mr_portfolio/core/theme/app_colors.dart';
import 'package:mr_portfolio/core/widgets/my_text.dart';
import 'package:mr_portfolio/core/widgets/scroll_reveal.dart';
import 'package:mr_portfolio/core/widgets/section_header.dart';
import 'package:mr_portfolio/features/home/presentation/controllers/navigation_controller.dart';
import 'package:mr_portfolio/features/home/presentation/controllers/theme_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
  Contact({super.key});

  final NavigationController navigationController = Get.find();
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppDimensions.breakpointMobile;
    final isPageTablet =
        width >= AppDimensions.breakpointMobile &&
        width < AppDimensions.breakpointTablet;

    final double subtitleFontSize = isMobile ? 15 : (isPageTablet ? 18 : 22);
    final double headlineFontSize = isMobile ? 36 : (isPageTablet ? 60 : 100);
    final double cardWidth = isMobile ? width * 0.85 : (isPageTablet ? width * 0.42 : 280);

    return Container(
      key: navigationController.contactKey,
      width: double.infinity,
      color: themeController.toggle.value
          ? AppColors.lightCardSurface
          : AppColors.darkCardSurface,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? AppDimensions.spaceL : (isPageTablet ? 50 : 120),
        vertical: isMobile ? AppDimensions.spaceHuge : AppDimensions.spaceSection,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ScrollReveal(child: SectionHeader(title: AppStrings.navContact)),
          const Gap(AppDimensions.spaceXL),

          // Availability & Logistics recruiting banner card
          ScrollReveal(
            delayMs: 100,
            child: _buildAvailabilityCard(context, isMobile, isPageTablet),
          ),
          const Gap(AppDimensions.spaceHuge),

          // Headline
          ScrollReveal(
            delayMs: 200,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: MyText(
                text: AppStrings.btnLetsWorkTogether,
                fontSize: headlineFontSize,
                textColor: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Gap(AppDimensions.spaceM),

          // Subtitle
          ScrollReveal(
            delayMs: 250,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 10 : 80),
              child: MyText(
                text: AppStrings.contactSubtitle,
                fontSize: subtitleFontSize,
                textAlign: TextAlign.center,
                textColor: AppColors.primaryVariant,
              ),
            ),
          ),
          const Gap(AppDimensions.spaceL),

          // Interactive Recruiter Call Schedule CTA Button
          ScrollReveal(
            delayMs: 280,
            child: InkWell(
              onTap: () => _showScheduleModal(context),
              borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                decoration: BoxDecoration(
                  gradient: AppColors.brandGradient,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.45),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.calendar_month_rounded, color: Colors.white, size: 20),
                    SizedBox(width: 10),
                    Text(
                      AppStrings.btnScheduleCall,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 6),
                    Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 16),
                  ],
                ),
              ),
            ),
          ),
          const Gap(AppDimensions.spaceHuge),

          // 1-Click Email Copy Bar
          ScrollReveal(
            delayMs: 300,
            child: _buildQuickCopyBar(context, isMobile),
          ),
          const Gap(AppDimensions.spaceHuge),

          // Contact Cards Grid
          Wrap(
            alignment: WrapAlignment.center,
            spacing: isMobile ? 16 : 24,
            runSpacing: isMobile ? 16 : 24,
            children: [
              ScrollReveal(
                delayMs: 350,
                child: _buildContactCard(
                  context,
                  index: 0,
                  icon: CupertinoIcons.mail_solid,
                  title: AppStrings.contactEmailTitle,
                  value: AppStrings.contactEmailValue,
                  width: cardWidth,
                  onTap: () async {
                    final Uri emailUri = Uri(
                      scheme: 'mailto',
                      path: AppStrings.contactEmailValue,
                      query: 'subject=Inquiry&body=Hi Mohammed, I would like to connect regarding an opportunity.',
                    );
                    if (await canLaunchUrl(emailUri)) {
                      await navigationController.myLaunchUrl(emailUri.toString());
                    }
                  },
                ),
              ),
              ScrollReveal(
                delayMs: 400,
                child: _buildContactCard(
                  context,
                  index: 1,
                  icon: FontAwesomeIcons.linkedinIn,
                  title: AppStrings.contactLinkedInTitle,
                  value: AppStrings.contactLinkedInValue,
                  width: cardWidth,
                  onTap: () async {
                    const url = AppStrings.linkedInUrl;
                    if (await canLaunchUrl(Uri.parse(url))) {
                      await navigationController.myLaunchUrl(url);
                    }
                  },
                ),
              ),
              ScrollReveal(
                delayMs: 450,
                child: _buildContactCard(
                  context,
                  index: 2,
                  icon: FontAwesomeIcons.github,
                  title: AppStrings.contactGitHubTitle,
                  value: AppStrings.contactGitHubValue,
                  width: cardWidth,
                  onTap: () async {
                    const url = AppStrings.gitHubUrl;
                    if (await canLaunchUrl(Uri.parse(url))) {
                      await navigationController.myLaunchUrl(url);
                    }
                  },
                ),
              ),
              ScrollReveal(
                delayMs: 500,
                child: _buildContactCard(
                  context,
                  index: 3,
                  icon: FontAwesomeIcons.whatsapp,
                  title: AppStrings.contactWhatsAppTitle,
                  value: AppStrings.contactWhatsAppValue,
                  width: cardWidth,
                  onTap: () async {
                    const url = AppStrings.whatsAppUrl;
                    if (await canLaunchUrl(Uri.parse(url))) {
                      await navigationController.myLaunchUrl(url);
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAvailabilityCard(BuildContext context, bool isMobile, bool isTablet) {
    final isDark = !themeController.toggle.value;

    return Container(
      constraints: const BoxConstraints(maxWidth: 750),
      padding: EdgeInsets.all(isMobile ? 16 : 22),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkBackground : Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusL),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.35),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.12),
            blurRadius: 20,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.work_outline_rounded,
                color: AppColors.primary,
                size: 18,
              ),
              const Gap(8),
              MyText(
                text: "Work Arrangements & Logistics",
                fontSize: isMobile ? 14 : 16,
                fontWeight: FontWeight.bold,
                textColor: isDark ? Colors.white : Colors.black87,
              ),
            ],
          ),
          const Gap(14),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildTagPill("🌐 Remote Worldwide", isDark),
              _buildTagPill("🏢 Hybrid / On-site", isDark),
              _buildTagPill("✈️ Open to Relocation", isDark),
              _buildTagPill("📍 Pondicherry, India (IST / UTC+5:30)", isDark),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTagPill(String label, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkChipSurface : AppColors.lightChipSurface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
        border: Border.all(
          color: isDark ? Colors.white12 : Colors.black12,
        ),
      ),
      child: MyText(
        text: label,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        textColor: isDark ? Colors.white70 : Colors.black87,
      ),
    );
  }

  Widget _buildQuickCopyBar(BuildContext context, bool isMobile) {
    final isDark = !themeController.toggle.value;

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: InkWell(
        onTap: () {
          Clipboard.setData(
            const ClipboardData(text: AppStrings.contactEmailValue),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: const [
                  Icon(Icons.check_circle_rounded, color: Colors.white),
                  SizedBox(width: 10),
                  Text(AppStrings.contactCopiedToast),
                ],
              ),
              backgroundColor: const Color(0xFF10B981),
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 2),
              margin: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 14 : 20,
            vertical: isMobile ? 10 : 12,
          ),
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkBackground : Colors.white,
            borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.5),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.2),
                blurRadius: 15,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.email_outlined,
                color: AppColors.primary,
                size: 20,
              ),
              const Gap(8),
              MyText(
                text: AppStrings.contactEmailValue,
                fontSize: isMobile ? 12 : 15,
                fontWeight: FontWeight.bold,
                textColor: isDark ? Colors.white : Colors.black87,
              ),
              const Gap(10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.copy_rounded,
                      color: AppColors.primary,
                      size: 13,
                    ),
                    Gap(4),
                    MyText(
                      text: "Copy",
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      textColor: AppColors.primary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
    required int index,
    required double width,
    required VoidCallback onTap,
  }) {
    return MouseRegion(
      onEnter: (_) => navigationController.setHover(index, true),
      onExit: (_) => navigationController.setHover(index, false),
      child: Obx(() {
        final isHovered = navigationController.hoverList[index];
        final isDark = !themeController.toggle.value;

        return AnimatedScale(
          scale: isHovered ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: width,
            padding: const EdgeInsets.all(AppDimensions.spaceL),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.radiusL),
              color: isDark ? AppColors.darkBackground : Colors.white,
              border: Border.all(
                color: isHovered
                    ? AppColors.primary.withValues(alpha: 0.6)
                    : (isDark ? Colors.white12 : Colors.black12),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: isHovered
                      ? AppColors.primary.withValues(alpha: 0.35)
                      : (isDark ? Colors.black26 : Colors.black.withValues(alpha: 0.05)),
                  blurRadius: isHovered ? 18 : 8,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(AppDimensions.radiusL),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: AppColors.brandGradient,
                      boxShadow: isHovered
                          ? [
                              BoxShadow(
                                color: AppColors.primary.withValues(alpha: 0.6),
                                blurRadius: 15,
                                spreadRadius: 2,
                              ),
                            ]
                          : [],
                    ),
                    padding: const EdgeInsets.all(14.0),
                    child: Icon(icon, color: Colors.white, size: 24),
                  ),
                  const Gap(AppDimensions.spaceM),
                  MyText(
                    text: title,
                    textColor: isDark ? Colors.white60 : Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  const Gap(6),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: MyText(
                      text: value,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      textColor: isDark ? Colors.white : Colors.black87,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  void _showScheduleModal(BuildContext context) {
    final isDark = !themeController.toggle.value;
    final subjectController = TextEditingController(text: "Interview Request for Mohammed Kaif");
    final messageController = TextEditingController(
      text: "Hi Mohammed,\n\nWe were impressed by your Flutter & Clean Architecture portfolio. We would like to schedule an interview with you for a Flutter Developer role.\n\nPlease let us know your availability.",
    );

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: isDark ? AppColors.darkBackground : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: AppColors.primary.withValues(alpha: 0.4),
              width: 1.5,
            ),
          ),
          insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 550),
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: AppColors.brandGradient,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.event_available, color: Colors.white, size: 20),
                        ),
                        const Gap(12),
                        Text(
                          "Schedule an Interview",
                          style: TextStyle(
                            color: isDark ? Colors.white : Colors.black87,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: isDark ? Colors.white70 : Colors.black54),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                const Gap(16),
                Text(
                  "Reach out directly to schedule a technical interview or discuss Flutter Developer opportunities.",
                  style: TextStyle(
                    color: isDark ? Colors.white70 : Colors.black54,
                    fontSize: 13,
                  ),
                ),
                const Gap(16),
                TextField(
                  controller: subjectController,
                  style: TextStyle(color: isDark ? Colors.white : Colors.black87, fontSize: 14),
                  decoration: InputDecoration(
                    labelText: "Subject",
                    labelStyle: TextStyle(color: isDark ? Colors.white60 : Colors.black54),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
                    ),
                  ),
                ),
                const Gap(12),
                TextField(
                  controller: messageController,
                  maxLines: 4,
                  style: TextStyle(color: isDark ? Colors.white : Colors.black87, fontSize: 13),
                  decoration: InputDecoration(
                    labelText: "Message Preview",
                    labelStyle: TextStyle(color: isDark ? Colors.white60 : Colors.black54),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
                    ),
                  ),
                ),
                const Gap(20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          final Uri emailUri = Uri(
                            scheme: 'mailto',
                            path: AppStrings.contactEmailValue,
                            query: Uri.encodeFull(
                              'subject=${subjectController.text}&body=${messageController.text}',
                            ),
                          );
                          if (await canLaunchUrl(emailUri)) {
                            await navigationController.myLaunchUrl(emailUri.toString());
                          }
                          if (context.mounted) Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        icon: const Icon(Icons.send_rounded, size: 18),
                        label: const Text("Send via Email Client", style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


