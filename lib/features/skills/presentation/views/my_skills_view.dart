import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mr_portfolio/core/constants/app_dimensions.dart';
import 'package:mr_portfolio/core/constants/app_strings.dart';
import 'package:mr_portfolio/core/constants/static_data.dart';
import 'package:mr_portfolio/core/theme/app_colors.dart';
import 'package:mr_portfolio/core/widgets/my_text.dart';
import 'package:mr_portfolio/core/widgets/section_header.dart';
import 'package:mr_portfolio/features/home/presentation/controllers/navigation_controller.dart';
import 'package:mr_portfolio/features/home/presentation/controllers/theme_controller.dart';
import 'package:mr_portfolio/features/skills/data/models/skill_category_model.dart';
import 'package:mr_portfolio/features/skills/presentation/controllers/skills_controller.dart';

class MySkills extends StatelessWidget {
  MySkills({super.key});

  final NavigationController navigationController = Get.find();
  final ThemeController themeController = Get.find();
  final SkillsController skillsController = Get.put(SkillsController());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppDimensions.breakpointMobile;
    final isTablet =
        width >= AppDimensions.breakpointMobile &&
        width < AppDimensions.breakpointTablet;

    final double horizontalPadding = isMobile
        ? AppDimensions.spaceL
        : isTablet
        ? 40.0
        : 120.0;
    final double verticalPadding = isMobile
        ? AppDimensions.spaceHuge
        : AppDimensions.spaceSection;

    final skillData = StaticData.skillData;
    final int crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 3);

    return Container(
      key: navigationController.whatIDoKey,
      width: double.infinity,
      color: themeController.toggle.value
          ? AppColors.lightCardSurface
          : AppColors.darkCardSurface,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SectionHeader(title: AppStrings.navSkills),
          const Gap(AppDimensions.spaceL),

          // Top Engineering Competency Banner
          _buildCompetencyBanner(context, isMobile),
          const Gap(AppDimensions.spaceHuge),

          // Skills Grid Layout
          LayoutBuilder(
            builder: (context, constraints) {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: isMobile ? 20 : 30,
                  mainAxisSpacing: isMobile ? 20 : 30,
                  mainAxisExtent: isMobile ? 280 : (isTablet ? 270 : 275),
                ),
                itemCount: skillData.length,
                itemBuilder: (context, index) {
                  return SkillCategoryCard(
                    index: index,
                    category: skillData[index],
                    themeController: themeController,
                    skillsController: skillsController,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCompetencyBanner(BuildContext context, bool isMobile) {
    final isDark = !themeController.toggle.value;

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkBackground : Colors.white,
          borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
          border: Border.all(
            color: AppColors.primary.withValues(alpha: 0.35),
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.12),
              blurRadius: 15,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 12,
          runSpacing: 8,
          children: [
            _buildBadgeItem("📱 Cross-Platform Mobile", isDark),
            _buildBadgeDot(isDark),
            _buildBadgeItem("🏗️ Clean Architecture & GetX", isDark),
            _buildBadgeDot(isDark),
            _buildBadgeItem("⚡ Offline-First & gRPC", isDark),
            _buildBadgeDot(isDark),
            _buildBadgeItem("🎨 Figma UI/UX Design System", isDark),
          ],
        ),
      ),
    );
  }

  Widget _buildBadgeItem(String text, bool isDark) {
    return MyText(
      text: text,
      fontSize: 13,
      fontWeight: FontWeight.w600,
      textColor: isDark ? Colors.white70 : Colors.black87,
    );
  }

  Widget _buildBadgeDot(bool isDark) {
    return Container(
      width: 4,
      height: 4,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primary.withValues(alpha: 0.6),
      ),
    );
  }
}

class SkillCategoryCard extends StatefulWidget {
  final int index;
  final SkillCategory category;
  final ThemeController themeController;
  final SkillsController skillsController;

  const SkillCategoryCard({
    super.key,
    required this.index,
    required this.category,
    required this.themeController,
    required this.skillsController,
  });

  @override
  State<SkillCategoryCard> createState() => _SkillCategoryCardState();
}

class _SkillCategoryCardState extends State<SkillCategoryCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = !widget.themeController.toggle.value;
    final category = widget.category;
    final color = category.color;

    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        widget.skillsController.zoomIn(widget.index);
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        widget.skillsController.zoomOut(widget.index);
      },
      child: AnimatedScale(
        scale: _isHovered ? 1.02 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.all(AppDimensions.spaceL),
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkBackground : Colors.white,
            borderRadius: BorderRadius.circular(AppDimensions.radiusL),
            border: Border.all(
              color: _isHovered
                  ? color.withValues(alpha: 0.65)
                  : (isDark
                      ? Colors.white.withValues(alpha: 0.08)
                      : Colors.black.withValues(alpha: 0.06)),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? color.withValues(alpha: 0.35)
                    : (isDark
                        ? Colors.black.withValues(alpha: 0.3)
                        : Colors.black.withValues(alpha: 0.06)),
                blurRadius: _isHovered ? 20 : 10,
                spreadRadius: _isHovered ? 2 : 0,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category Header Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                      border: Border.all(
                        color: color.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Icon(category.icon, color: color, size: 24),
                  ),
                  const Gap(12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: category.title,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textColor: isDark ? Colors.white : Colors.black87,
                        ),
                        if (category.tag != null) ...[
                          const Gap(3),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: color.withValues(alpha: 0.12),
                              borderRadius:
                                  BorderRadius.circular(AppDimensions.radiusPill),
                            ),
                            child: Text(
                              category.tag!,
                              style: TextStyle(
                                color: color,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.darkChipSurface
                          : AppColors.lightChipSurface,
                      borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
                    ),
                    child: Text(
                      "${category.skills.length}",
                      style: TextStyle(
                        color: isDark ? Colors.grey[300] : Colors.black87,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(AppDimensions.spaceL),

              // Interactive Skill Chips Wrap
              Expanded(
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(category.skills.length, (i) {
                      return SkillChipItem(
                        name: category.skills[i],
                        logoPath: category.logo[i],
                        accentColor: color,
                        isDark: isDark,
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SkillChipItem extends StatefulWidget {
  final String name;
  final String logoPath;
  final Color accentColor;
  final bool isDark;

  const SkillChipItem({
    super.key,
    required this.name,
    required this.logoPath,
    required this.accentColor,
    required this.isDark,
  });

  @override
  State<SkillChipItem> createState() => _SkillChipItemState();
}

class _SkillChipItemState extends State<SkillChipItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.06 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
          decoration: BoxDecoration(
            color: widget.isDark
                ? (_isHovered
                    ? widget.accentColor.withValues(alpha: 0.18)
                    : AppColors.darkChipSurface)
                : (_isHovered
                    ? widget.accentColor.withValues(alpha: 0.12)
                    : AppColors.lightChipSurface),
            borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
            border: Border.all(
              color: _isHovered
                  ? widget.accentColor.withValues(alpha: 0.6)
                  : (widget.isDark ? Colors.white12 : Colors.black12),
              width: 1,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: widget.accentColor.withValues(alpha: 0.25),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                widget.logoPath,
                height: 15,
                width: 15,
              ),
              const Gap(6),
              MyText(
                text: widget.name,
                fontSize: 12,
                fontWeight: _isHovered ? FontWeight.bold : FontWeight.w500,
                textColor: widget.isDark
                    ? (_isHovered ? Colors.white : Colors.grey[200])
                    : (_isHovered ? Colors.black : Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
