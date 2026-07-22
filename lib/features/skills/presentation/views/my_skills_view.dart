import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_portfolio/core/constants/app_dimensions.dart';
import 'package:mr_portfolio/core/constants/app_strings.dart';
import 'package:mr_portfolio/core/constants/static_data.dart';
import 'package:mr_portfolio/core/theme/app_colors.dart';
import 'package:mr_portfolio/core/widgets/my_text.dart';
import 'package:mr_portfolio/core/widgets/section_header.dart';
import 'package:mr_portfolio/features/home/presentation/controllers/navigation_controller.dart';
import 'package:mr_portfolio/features/home/presentation/controllers/theme_controller.dart';
import 'package:mr_portfolio/features/skills/presentation/controllers/skills_controller.dart';
import 'package:mr_portfolio/features/skills/data/models/skill_category_model.dart';

class MySkills extends StatelessWidget {
  MySkills({super.key});

  final NavigationController navigationController = Get.find();
  final ThemeController themeController = Get.find();
  final SkillsController skillsController = Get.put(SkillsController());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    int crossAxisCount;
    double horizontalPadding;
    double verticalPadding;
    double spacing;

    if (width < AppDimensions.breakpointMobile) {
      crossAxisCount = 1;
      horizontalPadding = 35;
      verticalPadding = 30;
      spacing = 30;
    } else if (width < AppDimensions.breakpointTablet) {
      crossAxisCount = 2;
      horizontalPadding = 40;
      verticalPadding = 60;
      spacing = 30;
    } else {
      crossAxisCount = 3;
      horizontalPadding = 120;
      verticalPadding = 80;
      spacing = 40;
    }

    final skillData = StaticData.skillData;

    return Container(
      key: navigationController.whatIDoKey,
      color: themeController.toggle.value ? AppColors.lightCardSurface : AppColors.darkCardSurface,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: AppDimensions.spaceXL),
            child: SectionHeader(title: AppStrings.navSkills),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final cardWidth =
                    (constraints.maxWidth - (crossAxisCount - 1) * spacing) /
                    crossAxisCount;
                final double cardHeight =
                    width < 500
                        ? 220
                        : width < 767
                        ? 200
                        : width < 1200
                        ? 220
                        : 230;
                final aspectRatio = cardWidth / cardHeight;

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: spacing,
                    mainAxisSpacing: spacing,
                    childAspectRatio: aspectRatio,
                  ),
                  itemCount: skillData.length,
                  itemBuilder: (context, index) {
                    return GetBuilder<SkillsController>(
                      builder: (controller) {
                        return MouseRegion(
                          onEnter: (_) => controller.zoomIn(index),
                          onExit: (_) => controller.zoomOut(index),
                          child: AnimatedBuilder(
                            animation: controller.zoomAnimations[index],
                            builder: (context, child) {
                              return Transform.scale(
                                scale: controller.zoomAnimations[index].value,
                                child: _buildSkill(index, themeController, skillData[index], context),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildSkill(
  int index,
  ThemeController themeController,
  SkillCategory category,
  BuildContext context,
) {
  final width = MediaQuery.of(context).size.width;
  final isMobile = width < 767;
  final isTablet = width >= 767 && width < 1200;

  final Color color = category.color;
  final IconData icon = category.icon;
  final String title = category.title;
  final List<String> skills = category.skills;
  final List<String> logos = category.logo;

  final double iconSize =
      isMobile
          ? 22
          : isTablet
          ? 26
          : 30;
  final double titleFontSize =
      isMobile
          ? 16
          : isTablet
          ? 20
          : 22;
  final double chipFontSize = isMobile ? 12 : 14;
  final double chipIconSize = isMobile ? 14 : 16;
  final double padding =
      isMobile
          ? 14
          : isTablet
          ? 18
          : 22;

  return AnimatedContainer(
    duration: const Duration(milliseconds: 200),
    padding: EdgeInsets.all(padding),
    decoration: BoxDecoration(
      color: themeController.toggle.value ? Colors.white : const Color(0xff1f2837),
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color:
              themeController.toggle.value
                  ? Colors.black.withValues(alpha: 0.05)
                  : Colors.black.withValues(alpha: 0.4),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(isMobile ? 8 : 10),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: iconSize),
            ),
            const SizedBox(width: 12),
            Flexible(
              child: MyText(
                text: title,
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
                textColor:
                    themeController.toggle.value ? Colors.black : Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),

        Wrap(
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 10,
          runSpacing: 10,
          children: List.generate(skills.length, (i) {
            return FittedBox(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 10 : 12,
                  vertical: isMobile ? 5 : 6,
                ),
                decoration: BoxDecoration(
                  color:
                      themeController.toggle.value
                          ? const Color(0xfff3f4f6)
                          : const Color(0xff374151),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      logos[i],
                      height: chipIconSize,
                      width: chipIconSize,
                    ),
                    const SizedBox(width: 5),
                    MyText(
                      text: skills[i],
                      textColor:
                          themeController.toggle.value
                              ? Colors.black87
                              : Colors.grey[300],
                      fontSize: chipFontSize,
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    ),
  );
}
