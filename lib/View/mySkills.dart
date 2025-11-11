import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mr_portfolio/Controller/controller.dart';
import 'package:mr_portfolio/MyText.dart';
import 'package:mr_portfolio/responsive.dart';
import 'package:mr_portfolio/themeColor.dart';

class MySkills extends StatelessWidget {
  MySkills({super.key});

  final ScrollControllerX controller = Get.put(ScrollControllerX());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // ✅ Responsive grid setup
    int crossAxisCount;
    double horizontalPadding;
    double verticalPadding;
    double spacing;

    if (width < 767) {
      // 📱 Mobile
      crossAxisCount = 1;
      horizontalPadding = 40;
      verticalPadding = 30;
      spacing = 30;
    } else if (width < 1200) {
      // 💻 Tablet
      crossAxisCount = 2;
      horizontalPadding = 40;
      verticalPadding = 60;
      spacing = 30;
    } else {
      // 🖥 Desktop
      crossAxisCount = 3;
      horizontalPadding = 120;
      verticalPadding = 80;
      spacing = 40;
    }

    return Container(
      key: controller.whatIDoKey,
      color:
          controller.toggle.value
              ? const Color(0xfffffbf8ff)
              : const Color(0xffff111827),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ===== Heading =====
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                MyText(
                  text: "Skills",
                  fontSize: width < 500 ? 32 : 50,
                  fontWeight: FontWeight.bold,
                  textColor: Theme.of(context).colorScheme.onBackground,
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

          // ===== Grid Section =====
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
                            ? 2.5
                            : width < 1100
                            ? 1.25
                            : 1.6,
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
        // ===== Icon + Title =====
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

        // ===== Skill Chips =====
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

// class MySkills extends StatelessWidget {
//   MySkills({super.key});
//
//   final ScrollControllerX controller = Get.put(ScrollControllerX());
//
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     return Responsive(
//       mobile: Container(
//         // color: Colors.red,
//         key: controller.whatIDoKey,
//
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Align(
//               alignment: Alignment.topCenter,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 20.0, bottom: 60),
//                 child: MyText(
//                   text: "Skills",
//                   fontSize: 40,
//                   textColor: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//
//             Flexible(
//               fit: FlexFit.loose,
//               // color: Colors.green,
//               //  height: height  * 3.6,
//               child: GridView.builder(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 1,
//                   // crossAxisSpacing: 50,
//                   mainAxisSpacing: 50,
//                   childAspectRatio: .95,
//                 ),
//                 itemCount: 6,
//                 itemBuilder: (context, index) {
//                   return GetBuilder<ScrollControllerX>(
//                     builder: (controller) {
//                       return MouseRegion(
//                         /* onEnter: (_) {
//                                                       controller.zoomIn(index);
//                                                       // controller.toggleAnimation(index, forward: true);
//                                                     },
//                                                     onExit: (_) {
//                                                       controller.zoomOut(index);
//                                                       controller.toggleAnimation(index,
//                                                           forward: false);
//                                                     }, */
//                         /* onEnter: (_) =>
//                                             controller.zoomIn(index),
//                                         onExit: (_) =>
//                                             controller.zoomOut(index),
//                                         onEnter: (_) =>
//                                           controller.toggleAnimation(index,
//                                               forward: true),
//                                       onExit: (_) =>
//                                           controller.toggleAnimation(index,
//                                               forward: false), */
//                         child: AnimatedBuilder(
//                           animation: controller.zoomAnimations[index],
//                           builder: (context, child) {
//                             return Transform.scale(
//                               scale: controller.zoomAnimations[index].value,
//                               child: AnimatedBuilder(
//                                 animation: controller.animations[index],
//                                 builder: (context, child) {
//                                   return InkWell(
//                                     highlightColor: Colors.transparent,
//                                     splashColor: Colors.transparent,
//                                     onTap:
//                                         () =>
//                                             controller.toggleAnimation1(index),
//                                     child: Transform(
//                                       alignment: FractionalOffset.center,
//                                       transform:
//                                           Matrix4.identity()
//                                             ..setEntry(3, 2, 0.0015)
//                                             ..rotateY(
//                                               pi *
//                                                   controller
//                                                       .animations[index]
//                                                       .value,
//                                             ),
//                                       child:
//                                           controller.animations[index].value <=
//                                                   0.5
//                                               ? _buildSkillFrontSide(
//                                                 20,
//                                                 index,
//                                                 controller,
//                                                 context,
//                                               )
//                                               : _buildSkillBackSide(
//                                                 index,
//                                                 controller,
//                                               ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             );
//                           },
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       tablet: Container(
//         // color: Colors.red,
//         key: controller.whatIDoKey,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Align(
//               alignment: Alignment.topCenter,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 20.0),
//                 child: MyText(
//                   text: "Skills",
//                   fontSize: 50,
//                   textColor: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.topCenter,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 80.0),
//                 child: Container(
//                   // color: Colors.green,
//                   height: height * 1.86,
//                   child: GridView.builder(
//                     physics: NeverScrollableScrollPhysics(),
//                     padding: EdgeInsets.symmetric(horizontal: 60),
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2, // Number of columns
//                       crossAxisSpacing: 40,
//                       mainAxisSpacing: 40,
//                       childAspectRatio: .85, // Match Container aspect ratio
//                     ),
//                     itemCount: 6,
//                     // Number of containers
//                     itemBuilder: (context, index) {
//                       return GetBuilder<ScrollControllerX>(
//                         builder: (controller) {
//                           return LayoutBuilder(
//                             builder: (context, constraints) {
//                               double textHeightPerLine =
//                                   20; // Approximate height per line
//                               int maxLines =
//                                   9; // Adjust dynamically based on content
//                               double estimatedHeight =
//                                   (textHeightPerLine * maxLines) +
//                                   250; // Base container height + text height
//                               double childAspectRatio =
//                                   constraints.maxWidth / estimatedHeight;
//
//                               return MouseRegion(
//                                 /*onEnter: (_) {
//                                                         controller.zoomIn(index);
//                                                         // controller.toggleAnimation(index, forward: true);
//                                                       },
//                                                       onExit: (_) {
//                                                         controller.zoomOut(index);
//                                                         controller.toggleAnimation(index,
//                                                             forward: false);
//                                                       },*/
//                                 /*onEnter: (_) =>
//                                               controller.zoomIn(index),
//                                           onExit: (_) =>
//                                               controller.zoomOut(index),
//                                           onEnter: (_) =>
//                                             controller.toggleAnimation(index,
//                                                 forward: true),
//                                         onExit: (_) =>
//                                             controller.toggleAnimation(index,
//                                                 forward: false),*/
//                                 child: AnimatedBuilder(
//                                   animation: controller.zoomAnimations[index],
//                                   builder: (context, child) {
//                                     return Transform.scale(
//                                       scale:
//                                           controller
//                                               .zoomAnimations[index]
//                                               .value,
//                                       child: AnimatedBuilder(
//                                         animation: controller.animations[index],
//                                         builder: (context, child) {
//                                           return InkWell(
//                                             highlightColor: Colors.transparent,
//                                             splashColor: Colors.transparent,
//                                             onTap:
//                                                 () => controller
//                                                     .toggleAnimation1(index),
//                                             child: Transform(
//                                               alignment:
//                                                   FractionalOffset.center,
//                                               transform:
//                                                   Matrix4.identity()
//                                                     ..setEntry(3, 2, 0.0015)
//                                                     ..rotateY(
//                                                       pi *
//                                                           controller
//                                                               .animations[index]
//                                                               .value,
//                                                     ),
//                                               child:
//                                                   controller
//                                                               .animations[index]
//                                                               .value <=
//                                                           0.5
//                                                       ? _buildSkillFrontSide(
//                                                         maxLines,
//                                                         index,
//                                                         controller,
//                                                         context,
//                                                       )
//                                                       : _buildSkillBackSide(
//                                                         index,
//                                                         controller,
//                                                       ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               );
//                             },
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       desktop: Container(
//         // color: Colors.red,
//         color:
//             controller.toggle.value ? Color(0xfffffbf8ff) : Color(0xffff111827),
//         key: controller.whatIDoKey,
//         child: Column(
//           children: [
//             Align(
//               alignment: Alignment.topCenter,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 20.0),
//                 child: Column(
//                   children: [
//                     MyText(
//                       text: "Skills",
//                       fontSize: 50,
//                       textColor: Theme.of(context).colorScheme.onBackground,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     Container(
//                       width: 100,
//                       height: 3,
//                       margin: const EdgeInsets.only(top: 6),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(50),
//                         gradient: const LinearGradient(
//                           colors: [
//                             Color(0xff7241ea),
//                             Color(0xff783ee8),
//                             Color(0xff793eea),
//                             Color(0xff7e3cea),
//                             Color(0xff833aea),
//                             Color(0xff8334e2),
//                             Color(0xff9233ea),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.topCenter,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 80.0),
//                 child: Container(
//                   // color: Colors.green,
//                   height: height / (16 / 9) * 1.5,
//                   child: GridView.builder(
//                     physics: NeverScrollableScrollPhysics(),
//                     padding: EdgeInsets.symmetric(horizontal: 200),
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 3, // Number of columns
//                       crossAxisSpacing: 50,
//                       mainAxisSpacing: 80,
//                       childAspectRatio: 1.7, // Match Container aspect ratio
//                     ),
//                     itemCount: 6,
//                     // Number of containers
//                     itemBuilder: (context, index) {
//                       return GetBuilder<ScrollControllerX>(
//                         builder: (controller) {
//                           return LayoutBuilder(
//                             builder: (context, constraints) {
//                               double textHeightPerLine =
//                                   20; // Approximate height per line
//                               int maxLines =
//                                   7; // Adjust dynamically based on content
//                               double estimatedHeight =
//                                   (textHeightPerLine * maxLines) +
//                                   250; // Base container height + text height
//                               double childAspectRatio =
//                                   constraints.maxWidth / estimatedHeight;
//
//                               return MouseRegion(
//                                 onEnter: (_) {
//                                   controller.zoomIn(index);
//                                   // controller.toggleAnimation(index, forward: true);
//                                 },
//                                 onExit: (_) {
//                                   controller.zoomOut(index);
//                                   controller.toggleAnimation(
//                                     index,
//                                     forward: false,
//                                   );
//                                 },
//                                 /*onEnter: (_) =>
//                                               controller.zoomIn(index),
//                                           onExit: (_) =>
//                                               controller.zoomOut(index),
//                                           onEnter: (_) =>
//                                             controller.toggleAnimation(index,
//                                                 forward: true),
//                                         onExit: (_) =>
//                                             controller.toggleAnimation(index,
//                                                 forward: false),*/
//                                 child: AnimatedBuilder(
//                                   animation: controller.zoomAnimations[index],
//                                   builder: (context, child) {
//                                     return Transform.scale(
//                                       scale:
//                                           controller
//                                               .zoomAnimations[index]
//                                               .value,
//                                       child: AnimatedBuilder(
//                                         animation: controller.animations[index],
//                                         builder: (context, child) {
//                                           return InkWell(
//                                             highlightColor: Colors.transparent,
//                                             splashColor: Colors.transparent,
//                                             // onTap:
//                                             //     () => controller
//                                             //         .toggleAnimation1(index),
//                                             child: Transform(
//                                               alignment:
//                                                   FractionalOffset.center,
//                                               transform:
//                                                   Matrix4.identity()
//                                                     ..setEntry(3, 2, 0.0015)
//                                                     ..rotateY(
//                                                       pi *
//                                                           controller
//                                                               .animations[index]
//                                                               .value,
//                                                     ),
//                                               child:
//                                               // controller
//                                               //             .animations[index]
//                                               //             .value <=
//                                               //         0.5
//                                               //     ?
//                                               _buildSkill(
//                                                 maxLines,
//                                                 index,
//                                                 controller,
//                                                 context,
//                                               ),
//                                               // : _buildSkillBackSide(
//                                               //   index,
//                                               //   controller,
//                                               // ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               );
//                             },
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

Widget _buildSkillFrontSide(
  int maxLine,
  int index,
  ScrollControllerX controller,
  BuildContext context,
) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return Responsive(
    mobile: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: secondaryColor.withOpacity(.7),
        boxShadow: [
          BoxShadow(
            spreadRadius: .8,
            blurRadius: 5,
            offset: Offset(-5, 5),
            color: Colors.black12,
          ),
          BoxShadow(
            spreadRadius: .8,
            blurRadius: 5,
            offset: Offset(.5, -.5),
            color: Colors.white24,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height * .1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                // color: secondaryColor.withOpacity(.9),
                image: DecorationImage(
                  image: AssetImage(controller.skillsList[index].image),
                ),
              ),
            ),
            Gap(10),
            MyText(
              text: controller.skillsList[index].heading.toString(),
              textColor: primaryColor,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            Gap(20),
            Expanded(
              child: MyText(
                text: controller.skillsList[index].paragraph.toString(),
                textColor: Colors.white,
                fontSize: 18,
                maxLines: maxLine,
                // textAlign: TextAlign.center,
                // overFlow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    ),
    tablet: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: secondaryColor.withOpacity(.7),
        boxShadow: [
          BoxShadow(
            spreadRadius: .8,
            blurRadius: 5,
            offset: Offset(-5, 5),
            color: Colors.black12,
          ),
          BoxShadow(
            spreadRadius: .8,
            blurRadius: 5,
            offset: Offset(.5, -.5),
            color: Colors.white24,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                // color: secondaryColor.withOpacity(.9),
                image: DecorationImage(
                  image: AssetImage(controller.skillsList[index].image),
                ),
              ),
            ),
            // Gap(10),
            MyText(
              text: controller.skillsList[index].heading.toString(),
              textColor: primaryColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            Gap(20),
            Expanded(
              child: MyText(
                text: controller.skillsList[index].paragraph.toString(),
                textColor: Colors.white,
                textAlign: TextAlign.center,
                fontSize: 18,
                maxLines: maxLine,
                // overFlow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    ),
    desktop: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: secondaryColor.withOpacity(.7),
        boxShadow: [
          BoxShadow(
            spreadRadius: .8,
            blurRadius: 5,
            offset: Offset(-5, 5),
            color: Colors.black12,
          ),
          BoxShadow(
            spreadRadius: .8,
            blurRadius: 5,
            offset: Offset(.5, -.5),
            color: Colors.white24,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                // color: secondaryColor.withOpacity(.9),
                image: DecorationImage(
                  image: AssetImage(controller.skillsList[index].image),
                ),
              ),
            ),
            Gap(10),
            MyText(
              text: controller.skillsList[index].heading.toString(),
              textColor: primaryColor,
              fontSize: Responsive.isMobile(context) ? 32 : 25,
              fontWeight: FontWeight.bold,
            ),
            Gap(20),
            Expanded(
              child: MyText(
                text: controller.skillsList[index].paragraph.toString(),
                textColor: Colors.white,
                fontSize: Responsive.isMobile(context) ? 20 : 18,
                maxLines: maxLine,
                // overFlow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildSkillBackSide(int index, ScrollControllerX controller) {
  return Responsive(
    mobile: Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..rotateY(pi),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: secondaryColor.withOpacity(.7),
          boxShadow: [
            BoxShadow(
              spreadRadius: .8,
              blurRadius: 5,
              offset: Offset(-5, 5),
              color: Colors.black12,
            ),
            BoxShadow(
              spreadRadius: .8,
              blurRadius: 5,
              offset: Offset(.5, -.5),
              color: Colors.white24,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  text: controller.skillsList[index].heading,
                  textColor: primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                Gap(10),
                MyText(
                  text: controller.skillsList[index].paragraph.toString(),
                  textColor: Colors.white,
                  fontSize: 18,
                  // maxLines: 5,
                  // overFlow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    tablet: Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..rotateY(pi),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: secondaryColor.withOpacity(.7),
          boxShadow: [
            BoxShadow(
              spreadRadius: .8,
              blurRadius: 5,
              offset: Offset(-5, 5),
              color: Colors.black12,
            ),
            BoxShadow(
              spreadRadius: .8,
              blurRadius: 5,
              offset: Offset(.5, -.5),
              color: Colors.white24,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  text: "${controller.skillsList[index].heading}",
                  textColor: primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                Gap(10),
                MyText(
                  text: controller.skillsList[index].paragraph.toString(),
                  textColor: Colors.white,
                  fontSize: 17,
                  // maxLines: 5,
                  // overFlow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    desktop: Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..rotateY(pi),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: secondaryColor.withOpacity(.7),
          boxShadow: [
            BoxShadow(
              spreadRadius: .8,
              blurRadius: 5,
              offset: Offset(-5, 5),
              color: Colors.black12,
            ),
            BoxShadow(
              spreadRadius: .8,
              blurRadius: 5,
              offset: Offset(.5, -.5),
              color: Colors.white24,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  text: "${controller.skillsList[index].heading}",
                  textColor: primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                Gap(10),
                MyText(
                  text: controller.skillsList[index].paragraph.toString(),
                  textColor: Colors.white,
                  fontSize: 17,
                  // maxLines: 5,
                  // overFlow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
