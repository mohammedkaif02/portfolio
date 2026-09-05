import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/constants/app_dimensions.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/widgets/my_text.dart';
import 'package:portfolio/features/home/presentation/controllers/navigation_controller.dart';
import 'package:portfolio/features/projects/domain/entities/project_entity.dart';

class ProjectArchitectureModal extends StatelessWidget {
  final ProjectEntity project;
  final bool isDark;

  const ProjectArchitectureModal({
    super.key,
    required this.project,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppDimensions.breakpointMobile;
    final NavigationController nav = Get.find<NavigationController>();

    final surfaceColor = isDark ? const Color(0xFF1E293B) : Colors.white;
    final cardInnerColor = isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC);
    final borderColor = isDark ? Colors.white12 : Colors.black12;

    final hasExternalLink = project.githubUrl != null ||
        project.playStoreUrl != null ||
        project.liveUrl != null;

    return Container(
      constraints: const BoxConstraints(maxWidth: 820, maxHeight: 780),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(AppDimensions.radiusL),
        border: Border.all(color: borderColor),
        boxShadow: const [
          BoxShadow(color: Colors.black45, blurRadius: 30, spreadRadius: 6),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimensions.radiusL),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    project.image,
                    height: isMobile ? 180 : 240,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withValues(alpha: 0.8),
                            Colors.black.withValues(alpha: 0.2),
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
                      icon: const Icon(Icons.close_rounded, color: Colors.white, size: 22),
                      style: IconButton.styleFrom(backgroundColor: Colors.black54),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 20,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
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
                              const Gap(6),
                              Text(
                                project.title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: isMobile ? 18 : 22,
                                  fontWeight: FontWeight.bold,
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
              Padding(
                padding: EdgeInsets.all(isMobile ? 16 : 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (hasExternalLink)
                      Wrap(
                        spacing: 12,
                        runSpacing: 10,
                        children: [
                          if (project.githubUrl != null)
                            ElevatedButton.icon(
                              onPressed: () => nav.myLaunchUrl(project.githubUrl!),
                              icon: const FaIcon(FontAwesomeIcons.github, size: 15),
                              label: const Text(AppStrings.btnGitHubRepo),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
                                ),
                              ),
                            ),
                          if (project.playStoreUrl != null)
                            ElevatedButton.icon(
                              onPressed: () => nav.myLaunchUrl(project.playStoreUrl!),
                              icon: const FaIcon(FontAwesomeIcons.googlePlay, size: 14),
                              label: const Text("Google Play"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0F9D58),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
                                ),
                              ),
                            ),
                          if (project.liveUrl != null)
                            OutlinedButton.icon(
                              onPressed: () => nav.myLaunchUrl(project.liveUrl!),
                              icon: const Icon(Icons.open_in_new_rounded, size: 16),
                              label: const Text(AppStrings.btnLiveDemo),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: isDark ? Colors.white : AppColors.primary,
                                side: BorderSide(
                                  color: isDark ? Colors.white24 : AppColors.primary.withValues(alpha: 0.5),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
                                ),
                              ),
                            ),
                        ],
                      )
                    else
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.black.withValues(alpha: 0.04),
                          borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
                          border: Border.all(color: borderColor),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.lock_outline_rounded,
                              size: 14,
                              color: isDark ? Colors.white60 : Colors.black54,
                            ),
                            const Gap(8),
                            Text(
                              "Enterprise Project · Proprietary Codebase (NDA)",
                              style: TextStyle(
                                fontSize: 12,
                                color: isDark ? Colors.white70 : Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    const Gap(20),

                    if (project.keyMetrics.isNotEmpty) ...[
                      MyText(
                        text: AppStrings.metricsTitle,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        textColor: isDark ? Colors.white : Colors.black87,
                      ),
                      const Gap(10),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: project.keyMetrics.entries.map((entry) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                            decoration: BoxDecoration(
                              color: cardInnerColor,
                              borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                              border: Border.all(color: borderColor),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  entry.key,
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: isDark ? Colors.white54 : Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Gap(2),
                                Text(
                                  entry.value,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
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
                      text: "Project Architecture & Overview",
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      textColor: isDark ? Colors.white : Colors.black87,
                    ),
                    const Gap(8),
                    MyText(
                      text: project.architectureOverview ?? project.description,
                      fontSize: 13,
                      textColor: isDark ? Colors.white70 : Colors.black87,
                      textAlign: TextAlign.justify,
                    ),
                    const Gap(20),

                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: cardInnerColor,
                        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                        border: Border.all(color: borderColor),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.layers_rounded, color: AppColors.primary, size: 18),
                              Gap(8),
                              Text(
                                "Clean Architecture Breakdown",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                            ],
                          ),
                          const Gap(12),
                          _buildArchRow(
                            label: "Presentation",
                            color: const Color(0xFF8B5CF6),
                            desc: "Widgets, Material 3 UI, Micro-Animations, BLoC/GetX State Flow",
                            isDark: isDark,
                          ),
                          const Gap(8),
                          _buildArchRow(
                            label: "Domain Layer",
                            color: const Color(0xFF3B82F6),
                            desc: "Pure Dart UseCases, Entities, Result<T> failure modeling, zero UI leaks",
                            isDark: isDark,
                          ),
                          const Gap(8),
                          _buildArchRow(
                            label: "Data Layer",
                            color: const Color(0xFF10B981),
                            desc: "Repositories, Hive Local Cache, gRPC/REST clients, Serialization",
                            isDark: isDark,
                          ),
                        ],
                      ),
                    ),
                    const Gap(20),

                    if (project.highlights.isNotEmpty) ...[
                      MyText(
                        text: AppStrings.architectureTitle,
                        fontSize: 15,
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
                                const Icon(Icons.check_circle_rounded, size: 16, color: AppColors.primary),
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
                      text: AppStrings.technologiesTitle,
                      fontSize: 15,
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

  Widget _buildArchRow({
    required String label,
    required Color color,
    required String desc,
    required bool isDark,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 95,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(AppDimensions.radiusS),
            border: Border.all(color: color.withValues(alpha: 0.4)),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: color),
            ),
          ),
        ),
        const Gap(12),
        Expanded(
          child: Text(
            desc,
            style: TextStyle(
              fontSize: 12,
              color: isDark ? Colors.white70 : Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
