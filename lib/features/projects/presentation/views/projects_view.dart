import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/constants/app_dimensions.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/theme_color.dart';
import 'package:portfolio/core/widgets/my_text.dart';
import 'package:portfolio/core/widgets/scroll_reveal.dart';
import 'package:portfolio/core/widgets/section_header.dart';
import 'package:portfolio/features/home/presentation/controllers/navigation_controller.dart';
import 'package:portfolio/features/home/presentation/controllers/theme_controller.dart';
import 'package:portfolio/features/projects/domain/entities/project_entity.dart';
import 'package:portfolio/features/projects/presentation/controllers/projects_controller.dart';
import 'package:portfolio/features/projects/presentation/widgets/project_architecture_modal.dart';

class Projects extends StatelessWidget {
  Projects({super.key});

  final NavigationController navigationController =
      Get.find<NavigationController>();
  final ThemeController themeController = Get.find<ThemeController>();
  final ProjectsController projectsController = Get.find<ProjectsController>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppDimensions.breakpointMobile;
    final isTablet =
        width >= AppDimensions.breakpointMobile &&
        width < AppDimensions.breakpointTablet;

    final double horizontalPadding =
        isMobile ? AppDimensions.spaceL : (isTablet ? 40.0 : 120.0);

    return Container(
      key: navigationController.projectKey,
      width: double.infinity,
      color:
          themeController.toggle.value
              ? AppColors.lightBackground
              : AppColors.darkBackground,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical:
            isMobile ? AppDimensions.spaceHuge : AppDimensions.spaceSection,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ScrollReveal(
            child: SectionHeader(
              eyebrow: "Featured Work",
              title: "Production Projects & Systems",
              subtitle:
                  "Architecture deep-dives, production Play Store apps, and enterprise systems engineered in Flutter.",
            ),
          ),
          const Gap(AppDimensions.spaceXL),

          ScrollReveal(delayMs: 100, child: _buildCategoryFilters(context)),
          const Gap(AppDimensions.spaceHuge),

          Obx(() {
            if (projectsController.isLoading.value) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 60),
                child: CircularProgressIndicator(color: AppColors.primary),
              );
            }

            final projects = projectsController.filteredProjects;

            if (projects.isEmpty) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: MyText(
                  text: "No projects found in this category.",
                  textColor: Colors.grey,
                  fontSize: 16,
                ),
              );
            }

            int crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 3);

            return LayoutBuilder(
              builder: (context, constraints) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: isMobile ? 20 : 30,
                    mainAxisSpacing: isMobile ? 20 : 30,
                    mainAxisExtent: isMobile ? 540 : 570,
                  ),
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    return ScrollReveal(
                      delayMs: index * 120,
                      child: ProjectCard(
                        project: projects[index],
                        themeController: themeController,
                      ),
                    );
                  },
                );
              },
            );
          }),
        ],
      ),
    );
  }

  Widget _buildCategoryFilters(BuildContext context) {
    return Obx(() {
      final selectedCategory = projectsController.selectedCategory.value;
      return Wrap(
        alignment: WrapAlignment.center,
        spacing: 12,
        runSpacing: 12,
        children:
            projectsController.categories.map((category) {
              final isSelected = selectedCategory == category;
              final isDark = !themeController.toggle.value;

              return InkWell(
                onTap: () => projectsController.setCategory(category),
                borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      AppDimensions.radiusPill,
                    ),
                    gradient: isSelected ? AppColors.brandGradient : null,
                    color:
                        isSelected
                            ? null
                            : (isDark
                                ? AppColors.darkCardSurface
                                : AppColors.lightCardSurface),
                    border: Border.all(
                      color:
                          isSelected
                              ? Colors.transparent
                              : (isDark ? Colors.white12 : Colors.black12),
                    ),
                    boxShadow:
                        isSelected
                            ? [
                              BoxShadow(
                                color: AppColors.primary.withValues(alpha: 0.4),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ]
                            : [],
                  ),
                  child: MyText(
                    text: category,
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    textColor:
                        isSelected
                            ? Colors.white
                            : (isDark ? Colors.white70 : Colors.black87),
                  ),
                ),
              );
            }).toList(),
      );
    });
  }
}

class ProjectCard extends StatefulWidget {
  final ProjectEntity project;
  final ThemeController themeController;

  const ProjectCard({
    super.key,
    required this.project,
    required this.themeController,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = !widget.themeController.toggle.value;
    final project = widget.project;
    final NavigationController nav = Get.find<NavigationController>();

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.015 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
            color:
                isDark ? AppColors.darkCardSurface : AppColors.lightCardSurface,
            borderRadius: BorderRadius.circular(AppDimensions.radiusL),
            border: Border.all(
              color:
                  _isHovered
                      ? AppColors.primary.withValues(alpha: 0.5)
                      : (isDark
                          ? Colors.white.withValues(alpha: 0.08)
                          : Colors.black.withValues(alpha: 0.05)),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color:
                    _isHovered
                        ? AppColors.primary.withValues(alpha: 0.35)
                        : (isDark
                            ? Colors.black.withValues(alpha: 0.3)
                            : Colors.black.withValues(alpha: 0.06)),
                blurRadius: _isHovered ? 18 : 10,
                spreadRadius: _isHovered ? 2 : 0,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Screenshot Header: 16:9.5 responsive ratio with full contain visibility (no clipping on any side)
              InkWell(
                onTap:
                    () =>
                        _showProjectArchitectureModal(context, project, isDark),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppDimensions.radiusL),
                  topRight: Radius.circular(AppDimensions.radiusL),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9.5,
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          isDark
                              ? const Color(0xFF0F172A)
                              : const Color(0xFFF1F5F9),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(AppDimensions.radiusL),
                        topRight: Radius.circular(AppDimensions.radiusL),
                      ),
                    ),
                    child: Stack(
                      children: [
                        // Fully contained image preserving all mockups & aspect ratios without cropping
                        Center(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(AppDimensions.radiusL),
                              topRight: Radius.circular(AppDimensions.radiusL),
                            ),
                            child: Image.asset(
                              project.image,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.contain,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                        ),

                        // Category Badge (Top Right)
                        Positioned(
                          top: 12,
                          right: 12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.72),
                              borderRadius: BorderRadius.circular(
                                AppDimensions.radiusPill,
                              ),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.25),
                              ),
                            ),
                            child: Text(
                              project.category,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        // Interactive Release / Source Badge (Top Left)
                        if (project.playStoreUrl != null) ...[
                          Positioned(
                            top: 12,
                            left: 12,
                            child: InkWell(
                              onTap:
                                  () => nav.myLaunchUrl(project.playStoreUrl!),
                              borderRadius: BorderRadius.circular(
                                AppDimensions.radiusPill,
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 9,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF0F9D58),
                                  borderRadius: BorderRadius.circular(
                                    AppDimensions.radiusPill,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.3,
                                      ),
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.googlePlay,
                                      size: 10,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Google Play",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ] else if (project.githubUrl != null) ...[
                          Positioned(
                            top: 12,
                            left: 12,
                            child: InkWell(
                              onTap: () => nav.myLaunchUrl(project.githubUrl!),
                              borderRadius: BorderRadius.circular(
                                AppDimensions.radiusPill,
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 9,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1E293B),
                                  borderRadius: BorderRadius.circular(
                                    AppDimensions.radiusPill,
                                  ),
                                  border: Border.all(color: Colors.white24),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.3,
                                      ),
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.github,
                                      size: 11,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Open Source",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],

                        // Interactive Hover Overlay (Architecture / Details affordance)
                        AnimatedOpacity(
                          opacity: _isHovered ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 200),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.25),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(AppDimensions.radiusL),
                                topRight: Radius.circular(
                                  AppDimensions.radiusL,
                                ),
                              ),
                            ),
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black.withValues(alpha: 0.8),
                                  borderRadius: BorderRadius.circular(
                                    AppDimensions.radiusPill,
                                  ),
                                  border: Border.all(
                                    color: AppColors.primary.withValues(
                                      alpha: 0.8,
                                    ),
                                    width: 1.2,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.primary.withValues(
                                        alpha: 0.4,
                                      ),
                                      blurRadius: 12,
                                    ),
                                  ],
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.visibility_outlined,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                    Gap(6),
                                    Text(
                                      "View Architecture",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Content Details Body
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(AppDimensions.spaceL),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: project.title,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        textColor: isDark ? Colors.white : Colors.black87,
                      ),
                      const Gap(AppDimensions.spaceS),

                      Expanded(
                        child: Text(
                          project.description,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            height: 1.45,
                            color: isDark ? Colors.white70 : Colors.black87,
                          ),
                        ),
                      ),
                      const Gap(AppDimensions.spaceM),

                      // Tech Badges
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: [
                          ...project.technologies.take(4).map((tech) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 9,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    isDark
                                        ? AppColors.darkChipSurface
                                        : AppColors.lightChipSurface,
                                borderRadius: BorderRadius.circular(
                                  AppDimensions.radiusPill,
                                ),
                              ),
                              child: MyText(
                                text: tech,
                                fontSize: 11,
                                textColor:
                                    isDark ? Colors.grey[300] : Colors.black87,
                              ),
                            );
                          }),
                          if (project.technologies.length > 4)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withValues(
                                  alpha: 0.15,
                                ),
                                borderRadius: BorderRadius.circular(
                                  AppDimensions.radiusPill,
                                ),
                                border: Border.all(
                                  color: AppColors.primary.withValues(
                                    alpha: 0.35,
                                  ),
                                ),
                              ),
                              child: Text(
                                "+${project.technologies.length - 4} more",
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const Gap(AppDimensions.spaceL),

                      // Explore Architecture Action Button
                      InkWell(
                        onTap:
                            () => _showProjectArchitectureModal(
                              context,
                              project,
                              isDark,
                            ),
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radiusM,
                        ),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radiusM,
                            ),
                            color:
                                _isHovered
                                    ? primaryColor.withValues(alpha: 0.15)
                                    : (isDark
                                        ? Colors.white.withValues(alpha: 0.05)
                                        : Colors.black.withValues(alpha: 0.04)),
                            border: Border.all(
                              color:
                                  _isHovered
                                      ? primaryColor
                                      : Colors.transparent,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyText(
                                text: AppStrings.btnArchitecture,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                textColor:
                                    _isHovered
                                        ? primaryColor
                                        : (isDark
                                            ? Colors.white70
                                            : Colors.black87),
                              ),
                              const Gap(6),
                              Icon(
                                Icons.arrow_forward_rounded,
                                size: 15,
                                color:
                                    _isHovered
                                        ? primaryColor
                                        : (isDark
                                            ? Colors.white70
                                            : Colors.black87),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showProjectArchitectureModal(
    BuildContext context,
    ProjectEntity project,
    bool isDark,
  ) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            child: ProjectArchitectureModal(project: project, isDark: isDark),
          ),
        );
      },
    );
  }
}
