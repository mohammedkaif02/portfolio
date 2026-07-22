import 'package:flutter/material.dart';
import 'package:mr_portfolio/core/constants/app_dimensions.dart';
import 'package:mr_portfolio/core/theme/app_colors.dart';
import 'package:mr_portfolio/core/widgets/my_text.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final double? fontSize;

  const SectionHeader({
    super.key,
    required this.title,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final double calculatedFontSize = fontSize ??
        (width < AppDimensions.breakpointMobile
            ? AppDimensions.fontSectionMobile
            : AppDimensions.fontSectionDesktop);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
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
      ],
    );
  }
}
