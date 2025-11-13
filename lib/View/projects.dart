import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_portfolio/Controller/controller.dart';

class Projects extends StatelessWidget {
  Projects({super.key});

  final ScrollControllerX controller = Get.put(ScrollControllerX());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    int crossAxisCount;
    double horizontalPadding;
    double spacing;
    double aspectRatio;

    if (width < 1276) {
      crossAxisCount = 1;
      horizontalPadding = width / 8;
      spacing = 50;
      aspectRatio = width * 0.0018;
    } else if (width < 1684) {
      crossAxisCount = 2;
      horizontalPadding = 50;
      spacing = 40;
      aspectRatio = 1.8;
    } else {
      crossAxisCount = 3;
      horizontalPadding = 150;
      spacing = 50;
      aspectRatio = 1.2;
    }

    return Container(
      color: controller.toggle.value ? Colors.white : const Color(0xff1f2837),
      key: controller.projectKey,
      padding: EdgeInsets.only(bottom: width < 600 ? 60 : 100),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 60),
            child: Column(
              children: [
                Text(
                  "Projects",
                  style: TextStyle(
                    fontSize: width < 500 ? 32 : 48,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
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
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: spacing,
                    mainAxisSpacing: spacing,
                    childAspectRatio: aspectRatio,
                  ),
                  itemCount: controller.projectList.length,
                  itemBuilder: (context, index) {
                    return GetBuilder<ScrollControllerX>(
                      builder: (controller) {
                        return MouseRegion(
                          onEnter: (_) => controller.zoomIn(index),
                          onExit: (_) {
                            controller.zoomOut(index);
                            controller.toggleAnimation(index, forward: false);
                          },
                          child: AnimatedBuilder(
                            animation: controller.zoomAnimations[index],
                            builder: (context, child) {
                              return Transform.scale(
                                scale: controller.zoomAnimations[index].value,
                                child: AnimatedBuilder(
                                  animation: controller.animations[index],
                                  builder: (context, child) {
                                    return InkWell(
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onTap:
                                          () => controller.toggleAnimation1(
                                            index,
                                          ),
                                      child: Transform(
                                        alignment: FractionalOffset.center,
                                        transform:
                                            Matrix4.identity()
                                              ..setEntry(3, 2, 0.0015)
                                              ..rotateY(
                                                pi *
                                                    controller
                                                        .animations[index]
                                                        .value,
                                              ),
                                        child:
                                            controller
                                                        .animations[index]
                                                        .value <=
                                                    0.5
                                                ? _buildProjectFront(
                                                  context,
                                                  index,
                                                  controller,
                                                )
                                                : _buildProjectBack(
                                                  context,
                                                  index,
                                                  controller,
                                                ),
                                      ),
                                    );
                                  },
                                ),
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

  Widget _buildProjectFront(
    BuildContext context,
    int index,
    ScrollControllerX controller,
  ) {
    final project = controller.projectList[index];
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    double? heading;
    double? description;
    double? tile;
    double? imageHeight;
    int? maximumLine;

    if (width > 1820) {
      heading = 20;
      description = 14;
      maximumLine = 3;
      tile = 12;
      imageHeight = 200;
    } else if (width < 533) {
      heading = 18;
      description = 12;
      maximumLine = 2;
      tile = 10;
      imageHeight = 200;
    } else if (width < 779) {
      heading = 19;
      description = 12;
      maximumLine = 3;
      tile = 10;
      imageHeight = 230;
    } else if (width < 970) {
      heading = 20;
      description = 13;
      maximumLine = 4;
      tile = 10;
      imageHeight = 230;
    } else if (width < 1276) {
      heading = 20;
      description = 13;
      maximumLine = 5;
      tile = 10;
      imageHeight = 210;
    } else if (width < 1303) {
      heading = 16;
      description = 11;
      maximumLine = 1;
      tile = 10;
      imageHeight = 200;
    } else if (width < 1358) {
      heading = 18;
      description = 12;
      maximumLine = 1;
      tile = 11;
      imageHeight = 200;
    } else if (width < 1419) {
      heading = 18;
      description = 12;
      maximumLine = 2;
      tile = 11;
      imageHeight = 200;
    } else if (width < 1458) {
      heading = 18;
      description = 12;
      maximumLine = 3;
      tile = 11;
      imageHeight = 200;
    } else if (width < 1672) {
      heading = 20;
      description = 13;
      maximumLine = 3;
      tile = 11;
      imageHeight = 200;
    } else if (width < 1761) {
      heading = 18;
      description = 12;
      maximumLine = 1;
      tile = 11;
      imageHeight = 200;
    } else if (width < 1820) {
      heading = 18;
      description = 13;
      maximumLine = 2;
      tile = 11;
      imageHeight = 200;
    }

    return Container(
      decoration: BoxDecoration(
        color: controller.toggle.value ? Colors.white : const Color(0xff111827),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
            isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
            child: Image.asset(
              project.image,
              height: imageHeight,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(isMobile ? 12 : 16),
            child: Column(
              crossAxisAlignment:
                  isMobile
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
              children: [
                Text(
                  project.heading,
                  textAlign: isMobile ? TextAlign.center : TextAlign.start,
                  style: TextStyle(
                    fontSize: heading,
                    fontWeight: FontWeight.w700,
                    color:
                        controller.toggle.value ? Colors.black : Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  project.description,
                  textAlign: isMobile ? TextAlign.center : TextAlign.start,
                  maxLines: maximumLine,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: description,
                    // height: 1.5,
                    color:
                        controller.toggle.value
                            ? Colors.black.withOpacity(0.7)
                            : Colors.white70,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  alignment:
                      isMobile ? WrapAlignment.center : WrapAlignment.start,
                  spacing: 8,
                  runSpacing: 8,
                  children:
                      project.technologies.take(6).map((tech) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 8 : 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color:
                                controller.toggle.value
                                    ? const Color(0xfff1f1f1)
                                    : const Color(0xff1f2937),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            tech,
                            style: TextStyle(
                              fontSize: tile,
                              color:
                                  controller.toggle.value
                                      ? Colors.black87
                                      : Colors.white,
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectBack(
    BuildContext context,
    int index,
    ScrollControllerX controller,
  ) {
    final project = controller.projectList[index];
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..rotateY(pi),
      child: Container(
        decoration: BoxDecoration(
          color:
              controller.toggle.value
                  ? const Color(0xfff9fafb)
                  : const Color(0xff1f2937),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(isMobile ? 14 : 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:
                  isMobile
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
              children: [
                Text(
                  project.heading,
                  style: TextStyle(
                    fontSize: isMobile ? 18 : 20,
                    fontWeight: FontWeight.bold,
                    color:
                        controller.toggle.value ? Colors.black : Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  project.description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color:
                        controller.toggle.value
                            ? Colors.black87
                            : Colors.white70,
                    height: 1.5,
                    fontSize: isMobile ? 13 : 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
