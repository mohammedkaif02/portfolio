import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mr_portfolio/core/constants/app_dimensions.dart';
import 'package:mr_portfolio/core/constants/app_strings.dart';
import 'package:mr_portfolio/core/theme/app_colors.dart';
import 'package:mr_portfolio/core/theme/theme_color.dart';
import 'package:mr_portfolio/core/widgets/my_text.dart';
import 'package:mr_portfolio/core/widgets/section_header.dart';
import 'package:mr_portfolio/features/home/presentation/controllers/navigation_controller.dart';
import 'package:mr_portfolio/features/home/presentation/controllers/theme_controller.dart';
import 'package:mr_portfolio/features/projects/data/models/project_model.dart';
import 'package:mr_portfolio/features/projects/presentation/controllers/projects_controller.dart';

class Projects extends StatelessWidget {
  Projects({super.key});

  final NavigationController navigationController = Get.find();
  final ThemeController themeController = Get.find();
  final ProjectsController projectsController = Get.put(ProjectsController());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppDimensions.breakpointMobile;
    final isTablet = width >= AppDimensions.breakpointMobile && width < AppDimensions.breakpointTablet;

    final double horizontalPadding = isMobile
        ? AppDimensions.spaceL
        : (isTablet ? 40.0 : 120.0);

    return Container(
      key: navigationController.projectKey,
      width: double.infinity,
      color: themeController.toggle.value
          ? AppColors.lightBackground
          : AppColors.darkBackground,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: isMobile ? AppDimensions.spaceHuge : AppDimensions.spaceSection,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SectionHeader(title: AppStrings.navProjects),
          const Gap(AppDimensions.spaceXL),

          // Category Filter Tabs Bar
          _buildCategoryFilters(context),
          const Gap(AppDimensions.spaceHuge),

          // Dynamic Responsive Grid of Projects
          GetBuilder<ProjectsController>(
            builder: (controller) {
              final projects = controller.filteredProjects;

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
                      mainAxisExtent: isMobile ? 540 : 560,
                    ),
                    itemCount: projects.length,
                    itemBuilder: (context, index) {
                      return ProjectCard(
                        project: projects[index],
                        themeController: themeController,
                      );
                    },
                  );
                },
              );
            },
          ),
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
        children: projectsController.categories.map((category) {
          final isSelected = selectedCategory == category;
          final isDark = !themeController.toggle.value;

          return InkWell(
            onTap: () => projectsController.setCategory(category),
            borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
                gradient: isSelected ? AppColors.brandGradient : null,
                color: isSelected
                    ? null
                    : (isDark ? AppColors.darkCardSurface : AppColors.lightCardSurface),
                border: Border.all(
                  color: isSelected
                      ? Colors.transparent
                      : (isDark ? Colors.white12 : Colors.black12),
                ),
                boxShadow: isSelected
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
                textColor: isSelected
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
  final ProjectItem project;
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

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.015 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkCardSurface : AppColors.lightCardSurface,
            borderRadius: BorderRadius.circular(AppDimensions.radiusL),
            border: Border.all(
              color: _isHovered
                  ? AppColors.primary.withValues(alpha: 0.5)
                  : (isDark ? Colors.white.withValues(alpha: 0.08) : Colors.black.withValues(alpha: 0.05)),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? AppColors.primary.withValues(alpha: 0.35)
                    : (isDark ? Colors.black.withValues(alpha: 0.3) : Colors.black.withValues(alpha: 0.06)),
                blurRadius: _isHovered ? 18 : 10,
                spreadRadius: _isHovered ? 2 : 0,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Screenshot Banner Header
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AppDimensions.radiusL),
                      topRight: Radius.circular(AppDimensions.radiusL),
                    ),
                    child: Image.asset(
                      project.image,
                      height: 190,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(AppDimensions.radiusL),
                          topRight: Radius.circular(AppDimensions.radiusL),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withValues(alpha: 0.4),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.65),
                        borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
                        border: Border.all(color: Colors.white24),
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
                ],
              ),

              // Content Details Body
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(AppDimensions.spaceL),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: project.heading,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        textColor: isDark ? Colors.white : Colors.black87,
                      ),
                      const Gap(AppDimensions.spaceS),

                      Expanded(
                        child: MyText(
                          text: project.description,
                          fontSize: 13,
                          textColor: isDark ? Colors.white70 : Colors.black87,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const Gap(AppDimensions.spaceM),

                      // Tech Badges
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: project.technologies.take(5).map((tech) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                            decoration: BoxDecoration(
                              color: isDark ? AppColors.darkChipSurface : AppColors.lightChipSurface,
                              borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
                            ),
                            child: MyText(
                              text: tech,
                              fontSize: 11,
                              textColor: isDark ? Colors.grey[300] : Colors.black87,
                            ),
                          );
                        }).toList(),
                      ),
                      const Gap(AppDimensions.spaceL),

                      // Explore Details Action Button
                      InkWell(
                        onTap: () => _showProjectDetailsModal(context, project, isDark),
                        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                            color: _isHovered
                                ? primaryColor.withValues(alpha: 0.15)
                                : (isDark ? Colors.white.withValues(alpha: 0.05) : Colors.black.withValues(alpha: 0.04)),
                            border: Border.all(
                              color: _isHovered ? primaryColor : Colors.transparent,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyText(
                                text: "Explore Architecture & Details",
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                textColor: _isHovered ? primaryColor : (isDark ? Colors.white70 : Colors.black87),
                              ),
                              const Gap(6),
                              Icon(
                                Icons.arrow_forward_rounded,
                                size: 15,
                                color: _isHovered ? primaryColor : (isDark ? Colors.white70 : Colors.black87),
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

  void _showProjectDetailsModal(BuildContext context, ProjectItem project, bool isDark) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: ProjectDetailsModal(project: project, isDark: isDark),
          ),
        );
      },
    );
  }
}

class ProjectDetailsModal extends StatelessWidget {
  final ProjectItem project;
  final bool isDark;

  const ProjectDetailsModal({
    super.key,
    required this.project,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppDimensions.breakpointMobile;

    return Container(
      constraints: const BoxConstraints(maxWidth: 750, maxHeight: 700),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusL),
        border: Border.all(
          color: isDark ? Colors.white12 : Colors.black12,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 25,
            spreadRadius: 5,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimensions.radiusL),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Image Banner
              Stack(
                children: [
                  Image.asset(
                    project.image,
                    height: isMobile ? 180 : 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withValues(alpha: 0.6),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    right: 15,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close_rounded, color: Colors.white, size: 24),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.black54,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    left: 20,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            project.heading,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
                          ),
                          child: Text(
                            project.category,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Modal Content Details
              Padding(
                padding: EdgeInsets.all(isMobile ? 16 : 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: "Project Overview",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      textColor: isDark ? Colors.white : Colors.black87,
                    ),
                    const Gap(8),
                    MyText(
                      text: project.description,
                      fontSize: 14,
                      textColor: isDark ? Colors.white70 : Colors.black87,
                      textAlign: TextAlign.justify,
                    ),
                    const Gap(20),

                    if (project.highlights.isNotEmpty) ...[
                      MyText(
                        text: "Architecture & Key Features",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        textColor: isDark ? Colors.white : Colors.black87,
                      ),
                      const Gap(10),
                      Column(
                        children: project.highlights.map((highlight) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.check_circle_rounded,
                                  size: 16,
                                  color: AppColors.primary,
                                ),
                                const Gap(10),
                                Expanded(
                                  child: MyText(
                                    text: highlight,
                                    fontSize: 13,
                                    textColor: isDark ? Colors.white70 : Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      const Gap(20),
                    ],

                    MyText(
                      text: "Technologies Used",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      textColor: isDark ? Colors.white : Colors.black87,
                    ),
                    const Gap(10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: project.technologies.map((tech) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: isDark ? AppColors.darkChipSurface : AppColors.lightChipSurface,
                            borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
                          ),
                          child: MyText(
                            text: tech,
                            fontSize: 12,
                            textColor: isDark ? Colors.grey[200] : Colors.black87,
                          ),
                        );
                      }).toList(),
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
}
