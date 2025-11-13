import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_portfolio/Controller/controller.dart';
import 'package:mr_portfolio/MyText.dart';

class MySkills extends StatelessWidget {
  MySkills({super.key});

  final ScrollControllerX controller = Get.put(ScrollControllerX());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    int crossAxisCount;
    double horizontalPadding;
    double verticalPadding;
    double spacing;

    if (width < 767) {
      crossAxisCount = 1;
      horizontalPadding = 35;
      verticalPadding = 30;
      spacing = 30;
    } else if (width < 1200) {
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

    return Container(
      key: controller.whatIDoKey,
      color:
          controller.toggle.value
              ? const Color(0xfffbf8ff)
              : const Color(0xff111827),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                MyText(
                  text: "Skills",
                  fontSize: width < 500 ? 32 : 50,
                  fontWeight: FontWeight.bold,
                  textColor: Theme.of(context).colorScheme.secondary,
                ),
                Container(
                  width: 100,
                  height: 3,
                  margin: const EdgeInsets.only(top: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xff7241ea),
                        Color(0xff783ee8),
                        Color(0xff793eea),
                        Color(0xff7e3cea),
                        Color(0xff833aea),
                        Color(0xff8334e2),
                        Color(0xff9233ea),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: spacing,
                    mainAxisSpacing: spacing,
                    childAspectRatio:
                        width < 767
                            ? width * 0.005
                            : width < 1100
                            ? 1.7
                            : 1.22,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return GetBuilder<ScrollControllerX>(
                      builder: (controller) {
                        return MouseRegion(
                          onEnter: (_) => controller.zoomIn(index),
                          onExit: (_) => controller.zoomOut(index),
                          child: AnimatedBuilder(
                            animation: controller.zoomAnimations[index],
                            builder: (context, child) {
                              return Transform.scale(
                                scale: controller.zoomAnimations[index].value,
                                child: _buildSkill(index, controller, context),
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
  ScrollControllerX controller,
  BuildContext context,
) {
  final width = MediaQuery.of(context).size.width;
  final isMobile = width < 767;
  final isTablet = width >= 767 && width < 1200;

  final List<Map<String, dynamic>> skillData = [
    {
      "icon": Icons.phone_android,
      "color": const Color(0xff3b82f6),
      "title": "Mobile Development",
      "skills": ["Flutter", "Dart", "Android", "iOS"],
      "logo": [
        "assets/icons/flutter.png",
        "assets/icons/dart.png",
        "assets/icons/android.png",
        "assets/icons/apple.png",
      ],
    },
    {
      "icon": Icons.layers_rounded,
      "color": const Color(0xff8b5cf6),
      "title": "State Management",
      "skills": ["GetX", "Bloc", "Provider"],
      "logo": [
        "assets/img/getx.png",
        "assets/icons/bloc.png",
        "assets/icons/dart.png",
      ],
    },
    {
      "icon": Icons.web_rounded,
      "color": const Color(0xff22c55e),
      "title": "Web Development",
      "skills": ["Flutter Web", "Go Router", "Auto Router"],
      "logo": [
        "assets/icons/flutter.png",
        "assets/icons/dart.png",
        "assets/icons/dart.png",
      ],
    },
    {
      "icon": Icons.storage_rounded,
      "color": const Color(0xffef4444),
      "title": "Backend & APIs",
      "skills": ["Node.js", "REST API", "Firebase", "Google APIs"],
      "logo": [
        "assets/icons/nodejs.png",
        "assets/img/rest_api.png",
        "assets/img/firebase.png",
        "assets/icons/google.png",
      ],
    },
    {
      "icon": Icons.cloud_circle_rounded,
      "color": const Color(0xfff59e0b),
      "title": "Database & Storage",
      "skills": ["PostgreSQL", "MySQL", "Firebase", "Hive"],
      "logo": [
        "assets/icons/postgresql.png",
        "assets/icons/mysql.png",
        "assets/img/firebase.png",
        "assets/icons/hive.png",
      ],
    },
    {
      "icon": Icons.design_services_rounded,
      "color": const Color(0xfff43f5e),
      "title": "UI/UX & Tools",
      "skills": ["Figma", "Git", "VS Code", "CI/CD", "Android Studio"],
      "logo": [
        "assets/icons/figma.png",
        "assets/icons/git.png",
        "assets/icons/vscode.png",
        "assets/icons/cicd.png",
        "assets/icons/androidstudio.png",
      ],
    },
  ];

  final Map<String, dynamic> item = skillData[index];

  final Color color = item["color"] as Color;
  final IconData icon = item["icon"] as IconData;
  final String title = item["title"] as String;
  final List<String> skills = List<String>.from(item["skills"] ?? []);
  final List<String> logos = List<String>.from(item["logo"] ?? []);

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
      color: controller.toggle.value ? Colors.white : const Color(0xff1f2937),
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color:
              controller.toggle.value
                  ? Colors.black.withOpacity(0.05)
                  : Colors.black.withOpacity(0.4),
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
                color: color.withOpacity(0.15),
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
                    controller.toggle.value ? Colors.black : Colors.white,
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
                      controller.toggle.value
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
                          controller.toggle.value
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
