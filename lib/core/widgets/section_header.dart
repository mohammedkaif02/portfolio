import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_dimensions.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/widgets/my_text.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? eyebrow;
  final String? subtitle;
  final double? fontSize;

  const SectionHeader({
    super.key,
    required this.title,
    this.eyebrow,
    this.subtitle,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final double calculatedFontSize =
        fontSize ??
        (width < AppDimensions.breakpointMobile
            ? AppDimensions.fontSectionMobile
            : AppDimensions.fontSectionDesktop);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (eyebrow != null) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            margin: const EdgeInsets.only(bottom: 12),
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
                  width: 6,
                  height: 6,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: AppColors.brandGradient,
                  ),
                ),
                Text(
                  eyebrow!.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
        MyText(
          text: title,
          fontSize: calculatedFontSize,
          fontWeight: FontWeight.bold,
          textColor: Theme.of(context).colorScheme.secondary,
          textAlign: TextAlign.center,
        ),
        Container(
          width: AppDimensions.sectionUnderlineWidth,
          height: AppDimensions.sectionUnderlineHeight,
          margin: const EdgeInsets.only(top: AppDimensions.spaceXS + 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
            gradient: AppColors.brandGradient,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 620),
            child: Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: width < AppDimensions.breakpointMobile ? 13 : 15,
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.65),
                height: 1.5,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
