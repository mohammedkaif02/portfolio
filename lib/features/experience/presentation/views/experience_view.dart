import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mr_portfolio/core/constants/app_dimensions.dart';
import 'package:mr_portfolio/core/constants/app_strings.dart';
import 'package:mr_portfolio/core/constants/static_data.dart';
import 'package:mr_portfolio/core/theme/app_colors.dart';
import 'package:mr_portfolio/core/theme/theme_color.dart';
import 'package:mr_portfolio/core/widgets/my_text.dart';
import 'package:mr_portfolio/core/widgets/section_header.dart';
import 'package:mr_portfolio/features/experience/data/models/work_experience_model.dart';
import 'package:mr_portfolio/features/home/presentation/controllers/navigation_controller.dart';
import 'package:mr_portfolio/features/home/presentation/controllers/theme_controller.dart';

class Experience extends StatelessWidget {
  Experience({super.key});

  final NavigationController navigationController = Get.find();
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double horizontalPadding =
        width < AppDimensions.breakpointMobile ? AppDimensions.spaceXL : (width < AppDimensions.breakpointTablet ? 50.0 : 150.0);

    final experienceList = StaticData.experienceList;

    return Container(
      key: navigationController.experienceKey,
      color:
          themeController.toggle.value
              ? AppColors.lightBackground
              : AppColors.darkBackground,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: width < AppDimensions.breakpointMobile ? AppDimensions.spaceHuge : AppDimensions.spaceSection,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SectionHeader(title: AppStrings.navExperience),
          Gap(width < AppDimensions.breakpointMobile ? AppDimensions.spaceHuge : 60),

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: experienceList.length,
            itemBuilder: (context, index) {
              final item = experienceList[index];
              return TimelineItem(
                item: item,
                isFirst: index == 0,
                isLast: index == experienceList.length - 1,
                index: index,
                themeController: themeController,
              );
            },
          ),
        ],
      ),
    );
  }
}

class TimelineItem extends StatelessWidget {
  final WorkExperienceItem item;
  final bool isFirst;
  final bool isLast;
  final int index;
  final ThemeController themeController;

  const TimelineItem({
    super.key,
    required this.item,
    required this.isFirst,
    required this.isLast,
    required this.index,
    required this.themeController,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 767;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: isMobile ? 30 : 60,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                if (!(isFirst && isLast))
                  Positioned(
                    top: isFirst ? 28 : 0,
                    bottom: isLast ? null : 0,
                    height: isLast ? 28 : null,
                    child: Container(
                      width: 2,
                      color: primaryColor.withValues(alpha: 0.4),
                    ),
                  ),
                Positioned(
                  top: 20,
                  child: Container(
                    width: isMobile ? 12 : 16,
                    height: isMobile ? 12 : 16,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          themeController.toggle.value
                              ? Colors.white
                              : const Color(0xff111827),
                      border: Border.all(color: primaryColor, width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor.withValues(alpha: 0.5),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: HoverExperienceCard(
                item: item,
                themeController: themeController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HoverExperienceCard extends StatefulWidget {
  final WorkExperienceItem item;
  final ThemeController themeController;

  const HoverExperienceCard({
    super.key,
    required this.item,
    required this.themeController,
  });

  @override
  State<HoverExperienceCard> createState() => _HoverExperienceCardState();
}

class _HoverExperienceCardState extends State<HoverExperienceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 767;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.015 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: EdgeInsets.all(isMobile ? 16 : 24),
          decoration: BoxDecoration(
            color:
                widget.themeController.toggle.value
                    ? Colors.white
                    : const Color(0xff1f2837),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color:
                    _isHovered
                        ? primaryColor.withValues(alpha: 0.35)
                        : (widget.themeController.toggle.value
                            ? Colors.black.withValues(alpha: 0.05)
                            : Colors.black.withValues(alpha: 0.3)),
                blurRadius: _isHovered ? 16 : 8,
                spreadRadius: _isHovered ? 2 : 0,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: MyText(
                      text: widget.item.role,
                      fontSize: isMobile ? 18 : 22,
                      fontWeight: FontWeight.bold,
                      textColor:
                          widget.themeController.toggle.value
                              ? Colors.black
                              : Colors.white,
                    ),
                  ),
                  const Gap(8),
                  MyText(
                    text: widget.item.duration,
                    fontSize: isMobile ? 12 : 14,
                    textColor: Colors.grey,
                  ),
                ],
              ),
              const Gap(6),

              isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: widget.item.company,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          textColor: primaryColor,
                        ),
                        const Gap(4),
                        Row(
                          children: [
                            Icon(
                              widget.item.isRemote
                                  ? Icons.home_work_outlined
                                  : Icons.location_on_outlined,
                              size: 14,
                              color: Colors.grey,
                            ),
                            const Gap(4),
                            Expanded(
                              child: MyText(
                                  text: widget.item.location,
                                  fontSize: 12,
                                  textColor: Colors.grey,
                                ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        MyText(
                          text: widget.item.company,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          textColor: primaryColor,
                        ),
                        const Gap(8),
                        const MyText(text: "•", textColor: Colors.grey, fontSize: 14),
                        const Gap(8),
                        Icon(
                          widget.item.isRemote
                              ? Icons.home_work_outlined
                              : Icons.location_on_outlined,
                          size: 14,
                          color: Colors.grey,
                        ),
                        const Gap(4),
                        MyText(
                          text: widget.item.location,
                          fontSize: 14,
                          textColor: Colors.grey,
                        ),
                      ],
                    ),
              const Gap(12),
              Divider(
                color:
                    widget.themeController.toggle.value
                        ? Colors.grey.withValues(alpha: 0.2)
                        : Colors.white.withValues(alpha: 0.1),
                thickness: 1,
              ),
              const Gap(8),

              Column(
                children:
                    widget.item.bulletPoints.map((point) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 6.0,
                                right: 10.0,
                              ),
                              child: Icon(
                                Icons.circle,
                                size: 6,
                                color: primaryColor.withValues(alpha: 0.8),
                              ),
                            ),
                            Expanded(
                              child: MyText(
                                text: point,
                                fontSize: isMobile ? 13 : 15,
                                textColor:
                                    widget.themeController.toggle.value
                                        ? Colors.black87
                                        : Colors.white70,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
              ),
              const Gap(12),

              Wrap(
                spacing: 8,
                runSpacing: 8,
                children:
                    widget.item.technologies.map((tech) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color:
                              widget.themeController.toggle.value
                                  ? const Color(0xfff3f4f6)
                                  : const Color(0xff374151),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: MyText(
                          text: tech,
                          fontSize: isMobile ? 11 : 13,
                          textColor:
                              widget.themeController.toggle.value
                                  ? Colors.black87
                                  : Colors.grey[300],
                        ),
                      );
                    }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
