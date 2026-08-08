import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mr_portfolio/core/constants/app_dimensions.dart';
import 'package:mr_portfolio/core/constants/app_strings.dart';
import 'package:mr_portfolio/core/theme/app_colors.dart';
import 'package:mr_portfolio/core/widgets/my_text.dart';
import 'package:mr_portfolio/core/widgets/responsive.dart';
import 'package:mr_portfolio/core/widgets/scroll_reveal.dart';
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
      mobile: _buildMobileLayout(context),
      tablet: _buildTabletLayout(context),
      desktop: _buildDesktopLayout(context),
    );
  }

  // --- MOBILE LAYOUT ---
  Widget _buildMobileLayout(BuildContext context) {
    return Container(
      key: navigationController.aboutUsKey,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spaceL,
        vertical: 60,
      ),
      color: themeController.toggle.value
          ? AppColors.lightCardSurface
          : AppColors.darkCardSurface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ScrollReveal(
            child: SectionHeader(
              title: AppStrings.navAbout,
              fontSize: AppDimensions.fontSectionMobile,
            ),
          ),
          const Gap(25),
          _buildMetricsGrid(context, crossAxisCount: 2, isMobile: true),
          const Gap(25),
          ScrollReveal(
            delayMs: 200,
            child: _buildBioCard(context, isMobile: true),
          ),
          const Gap(30),
          _buildFeatureGrid(context, crossAxisCount: 1, isMobile: true),
        ],
      ),
    );
  }

  // --- TABLET LAYOUT ---
  Widget _buildTabletLayout(BuildContext context) {
    return Container(
      key: navigationController.aboutUsKey,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      color: themeController.toggle.value
          ? AppColors.lightCardSurface
          : AppColors.darkCardSurface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ScrollReveal(child: SectionHeader(title: AppStrings.navAbout)),
          const Gap(30),
          _buildMetricsGrid(context, crossAxisCount: 4, isMobile: false),
          const Gap(35),
          ScrollReveal(
            delayMs: 200,
            child: _buildBioCard(context, isMobile: false),
          ),
          const Gap(40),
          _buildFeatureGrid(context, crossAxisCount: 2, isMobile: false),
        ],
      ),
    );
  }

  // --- DESKTOP LAYOUT ---
  Widget _buildDesktopLayout(BuildContext context) {
    return Container(
      key: navigationController.aboutUsKey,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 100),
      color: themeController.toggle.value
          ? AppColors.lightCardSurface
          : AppColors.darkCardSurface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ScrollReveal(child: SectionHeader(title: AppStrings.navAbout)),
          const Gap(35),

          // Top Recruiter Impact Metrics Banner
          _buildMetricsGrid(context, crossAxisCount: 4, isMobile: false),
          const Gap(45),

          // Balanced 2-Column Desktop Grid (Left: Bio Card; Right: 2x2 Services Grid)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: ScrollReveal(
                  delayMs: 200,
                  child: _buildBioCard(context, isMobile: false),
                ),
              ),
              const Gap(40),
              Expanded(
                flex: 1,
                child: _buildFeatureGrid(context, crossAxisCount: 2, isMobile: false),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- RECRUITER IMPACT METRICS GRID ---
  Widget _buildMetricsGrid(
    BuildContext context, {
    required int crossAxisCount,
    required bool isMobile,
  }) {
    final metrics = [
      {
        'value': AppStrings.metricYearsVal,
        'label': AppStrings.metricYearsLabel,
        'icon': Icons.workspace_premium_rounded,
        'color': const Color(0xFF3B82F6),
      },
      {
        'value': AppStrings.metricAppsVal,
        'label': AppStrings.metricAppsLabel,
        'icon': Icons.rocket_launch_rounded,
        'color': const Color(0xFF8B5CF6),
      },
      {
        'value': AppStrings.metricCiCdVal,
        'label': AppStrings.metricCiCdLabel,
        'icon': Icons.speed_rounded,
        'color': const Color(0xFF22C55E),
      },
      {
        'value': AppStrings.metricEffVal,
        'label': AppStrings.metricEffLabel,
        'icon': Icons.auto_graph_rounded,
        'color': const Color(0xFFF59E0B),
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: isMobile ? 12 : 20,
            mainAxisSpacing: isMobile ? 12 : 20,
            mainAxisExtent: isMobile ? 105 : 115,
          ),
          itemCount: metrics.length,
          itemBuilder: (context, index) {
            final m = metrics[index];
            return ScrollReveal(
              delayMs: index * 100,
              child: MetricCard(
                value: m['value'] as String,
                label: m['label'] as String,
                icon: m['icon'] as IconData,
                accentColor: m['color'] as Color,
                themeController: themeController,
              ),
            );
          },
        );
      },
    );
  }

  // --- GLASSMORPHIC BIO CONTAINER ---
  Widget _buildBioCard(BuildContext context, {required bool isMobile}) {
    final isDark = !themeController.toggle.value;

    return Container(
      padding: EdgeInsets.all(isMobile ? 18 : 28),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkBackground : Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusL),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.35),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? AppColors.primary.withValues(alpha: 0.12)
                : Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            spreadRadius: 1,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person_pin_rounded,
                  color: AppColors.primary,
                  size: 22,
                ),
              ),
              const Gap(12),
              MyText(
                text: "Engineering Background",
                fontSize: isMobile ? 16 : 18,
                fontWeight: FontWeight.bold,
                textColor: isDark ? Colors.white : Colors.black87,
              ),
            ],
          ),
          const Gap(16),
          _buildBioParagraph(AppStrings.aboutParagraph1, isDark, isMobile),
          const Gap(14),
          _buildBioParagraph(AppStrings.aboutParagraph2, isDark, isMobile),
          const Gap(14),
          _buildBioParagraph(AppStrings.aboutParagraph3, isDark, isMobile),
        ],
      ),
    );
  }

  Widget _buildBioParagraph(String text, bool isDark, bool isMobile) {
    return MyText(
      text: text,
      textColor: isDark ? Colors.white70 : Colors.black87,
      textAlign: TextAlign.justify,
      fontSize: isMobile ? 13 : 14,
    );
  }

  // --- FEATURE CARDS GRID ---
  Widget _buildFeatureGrid(
    BuildContext context, {
    required int crossAxisCount,
    required bool isMobile,
  }) {
    final features = [
      {
        'icon': AppStrings.mobileIconPath,
        'title': AppStrings.featureFlutterDevelopmentTitle,
        'sub': AppStrings.featureFlutterDevelopmentSub,
      },
      {
        'icon': AppStrings.backendIconPath,
        'title': AppStrings.featureBackendTitle,
        'sub': AppStrings.featureBackendSub,
      },
      {
        'icon': AppStrings.googlePlayIconPath,
        'title': AppStrings.featureDeployTitle,
        'sub': AppStrings.featureDeploySub,
      },
      {
        'icon': AppStrings.uiUxIconPath,
        'title': AppStrings.featureUiUxTitle,
        'sub': AppStrings.featureUiUxSub,
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: isMobile ? 14 : 20,
            mainAxisSpacing: isMobile ? 14 : 20,
            mainAxisExtent: isMobile ? 110 : 125,
          ),
          itemCount: features.length,
          itemBuilder: (context, index) {
            final f = features[index];
            return ScrollReveal(
              delayMs: index * 100,
              child: FeatureCard(
                index: index,
                iconPath: f['icon']!,
                title: f['title']!,
                subtitle: f['sub']!,
                themeController: themeController,
                navigationController: navigationController,
                isMobile: isMobile,
              ),
            );
          },
        );
      },
    );
  }
}

// --- METRIC CARD WIDGET ---
class MetricCard extends StatefulWidget {
  final String value;
  final String label;
  final IconData icon;
  final Color accentColor;
  final ThemeController themeController;

  const MetricCard({
    super.key,
    required this.value,
    required this.label,
    required this.icon,
    required this.accentColor,
    required this.themeController,
  });

  @override
  State<MetricCard> createState() => _MetricCardState();
}

class _MetricCardState extends State<MetricCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = !widget.themeController.toggle.value;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.04 : 1.0,
        duration: const Duration(milliseconds: 180),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkBackground : Colors.white,
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
            border: Border.all(
              color: _isHovered
                  ? widget.accentColor
                  : (isDark ? Colors.white.withValues(alpha: 0.1) : Colors.black.withValues(alpha: 0.08)),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? widget.accentColor.withValues(alpha: 0.35)
                    : (isDark
                        ? Colors.black.withValues(alpha: 0.2)
                        : Colors.black.withValues(alpha: 0.04)),
                blurRadius: _isHovered ? 16 : 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: widget.accentColor.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      widget.icon,
                      color: widget.accentColor,
                      size: 18,
                    ),
                  ),
                  const Gap(8),
                  Text(
                    widget.value,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black87,
                    ),
                  ),
                ],
              ),
              const Gap(6),
              Text(
                widget.label,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white60 : Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

// --- FEATURE CARD WIDGET ---
class FeatureCard extends StatefulWidget {
  final int index;
  final String iconPath;
  final String title;
  final String subtitle;
  final ThemeController themeController;
  final NavigationController navigationController;
  final bool isMobile;

  const FeatureCard({
    super.key,
    required this.index,
    required this.iconPath,
    required this.title,
    required this.subtitle,
    required this.themeController,
    required this.navigationController,
    required this.isMobile,
  });

  @override
  State<FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = !widget.themeController.toggle.value;

    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        widget.navigationController.onEnterCard(widget.index, true);
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        widget.navigationController.onEnterCard(widget.index, false);
      },
      child: AnimatedScale(
        scale: _isHovered ? 1.03 : 1.0,
        duration: const Duration(milliseconds: 180),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
            color: isDark ? AppColors.darkBackground : Colors.white,
            border: Border.all(
              color: _isHovered
                  ? AppColors.primary.withValues(alpha: 0.6)
                  : (isDark ? Colors.white12 : Colors.black12),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? AppColors.primary.withValues(alpha: 0.3)
                    : (isDark
                        ? Colors.black.withValues(alpha: 0.25)
                        : Colors.black.withValues(alpha: 0.05)),
                blurRadius: _isHovered ? 15 : 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                height: widget.isMobile ? 48 : 54,
                width: widget.isMobile ? 48 : 54,
                decoration: BoxDecoration(
                  gradient: AppColors.brandGradient,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                  boxShadow: _isHovered
                      ? [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.5),
                            blurRadius: 10,
                          ),
                        ]
                      : [],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(widget.iconPath, color: Colors.white),
                ),
              ),
              const Gap(12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: widget.title,
                      fontSize: widget.isMobile ? 13 : 15,
                      fontWeight: FontWeight.bold,
                      textColor: isDark ? Colors.white : Colors.black87,
                    ),
                    const Gap(2),
                    Text(
                      widget.subtitle,
                      style: TextStyle(
                        fontSize: widget.isMobile ? 11 : 12,
                        color: isDark ? Colors.white60 : Colors.black54,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
