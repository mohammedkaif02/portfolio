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

    // ✅ Responsive grid configuration
    int crossAxisCount;
    double horizontalPadding;
    double spacing;
    double aspectRatio;

    if (width < 1276) {
      // 📱 Mobile
      crossAxisCount = 1;
      horizontalPadding = width / 8;
      spacing = 50;
      aspectRatio = 1;
    } else if (width < 1684) {
      // 💻 Tablet
      crossAxisCount = 2;
      horizontalPadding = 50;
      spacing = 40;
      aspectRatio = 1.8;
    } else {
      // 🖥 Desktop
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
          // ===== Heading =====
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 60),
            child: Column(
              children: [
                Text(
                  "Projects",
                  style: TextStyle(
                    fontSize: width < 500 ? 32 : 48,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onBackground,
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

          // ===== GridView =====
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

  // ======= FRONT SIDE =======
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
    print("my width $width");
    print("my width < 1761 ${width < 1761}");
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
      imageHeight = 400;
    } else if (width < 1276) {
      heading = 20;
      description = 13;
      maximumLine = 5;
      tile = 10;
      imageHeight = 520;
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

  // ======= BACK SIDE =======
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

/*class Projects extends StatelessWidget {
  Projects({super.key});

  final ScrollControllerX controller = Get.put(ScrollControllerX());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Responsive(
      mobile: Container(
        // color: Colors.red,
        key: controller.projectKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 60),
                child: MyText(
                  text: "Projects",
                  fontSize: 40,
                  textColor: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              // color: Colors.green,
              // height: height * 2.15,
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  // crossAxisSpacing: 40,
                  mainAxisSpacing: 40,
                  childAspectRatio: 1.4,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return GetBuilder<ScrollControllerX>(
                    builder: (controller) {
                      return MouseRegion(
                        */ /*onEnter: (_) {
                                              controller.zoomIn(index);
                                              // controller.toggleAnimation(index, forward: true);
                                            },
                                            onExit: (_) {
                                              controller.zoomOut(index);
                                              controller.toggleAnimation(index,
                                                  forward: false);
                                            },*/ /*

                        */ /*onEnter: (_) =>
                                            controller.zoomIn(index),
                                        onExit: (_) =>
                                            controller.zoomOut(index),
                                        onEnter: (_) =>
                                          controller.toggleAnimation(index,
                                              forward: true),
                                      onExit: (_) =>
                                          controller.toggleAnimation(index,
                                              forward: false),*/ /*
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
                                        () =>
                                            controller.toggleAnimation1(index),
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
                                          controller.animations[index].value <=
                                                  0.5
                                              ? _buildPortfolioFrontSide(
                                                index,
                                                controller,
                                                context,
                                              )
                                              : _buildPortfolioBackSide(
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
              ),
            ),
          ],
        ),
      ),
      tablet: Container(
        // color: Colors.red,
        key: controller.projectKey,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: MyText(
                  text: "Projects",
                  fontSize: 50,
                  textColor: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  // color: Colors.green,
                  height: height / (14 / 18.2) * .6,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 40,
                      mainAxisSpacing: 40,
                      childAspectRatio: 1.4,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return GetBuilder<ScrollControllerX>(
                        builder: (controller) {
                          return MouseRegion(
                            */ /*onEnter: (_) {
                                                controller.zoomIn(index);
                                                // controller.toggleAnimation(index, forward: true);
                                              },
                                              onExit: (_) {
                                                controller.zoomOut(index);
                                                controller.toggleAnimation(index,
                                                    forward: false);
                                              },*/ /*

                            */ /*onEnter: (_) =>
                                              controller.zoomIn(index),
                                          onExit: (_) =>
                                              controller.zoomOut(index),
                                          onEnter: (_) =>
                                            controller.toggleAnimation(index,
                                                forward: true),
                                        onExit: (_) =>
                                            controller.toggleAnimation(index,
                                                forward: false),*/ /*
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
                                                  ? _buildPortfolioFrontSide(
                                                    index,
                                                    controller,
                                                    context,
                                                  )
                                                  : _buildPortfolioBackSide(
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
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      desktop: Container(
        // color: Colors.red,
        color: controller.toggle.value ? Colors.white : const Color(0xff1f2837),
        key: controller.projectKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 80),
                child: Column(
                  children: [
                    MyText(
                      text: "Projects",
                      fontSize: 50,
                      textColor: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.bold,
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
            ),
            Flexible(
              fit: FlexFit.loose,
              // color: Colors.green,
              // height: height * 2.15,
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 180),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 50,
                  mainAxisSpacing: 80,
                  childAspectRatio: 1.04,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return GetBuilder<ScrollControllerX>(
                    builder: (controller) {
                      return MouseRegion(
                        onEnter: (_) {
                          controller.zoomIn(index);
                        },
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
                                        () =>
                                            controller.toggleAnimation1(index),
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
                                          controller.animations[index].value <=
                                                  0.5
                                              ? _buildPortfolioFrontSide(
                                                index,
                                                controller,
                                                context,
                                              )
                                              : _buildPortfolioBackSide(
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPortfolioFrontSide(
    int index,
    ScrollControllerX controller,
    BuildContext context,
  ) {
    final project = controller.projectList[index];
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Responsive(
      mobile: Container(
        // height: height*.6,
        // width: width*.2,
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
          padding: EdgeInsets.only(
            top: Responsive.isMobile(context) ? 14 : 30.0,
            left: Responsive.isMobile(context) ? 14 : 30,
            right: Responsive.isMobile(context) ? 14 : 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                text: controller.portfolioList[index].heading.toString(),
                textColor: primaryColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              Gap(20),
              Flexible(
                child: Container(
                  height: height * 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(4),
                      topLeft: Radius.circular(4),
                    ),
                    color: secondaryColor.withOpacity(.9),
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
                    image: DecorationImage(
                      image: AssetImage(controller.portfolioList[index].image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      tablet: Container(
        */ /*height: 370,
    width: 280,*/ /*
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
          padding: const EdgeInsets.only(top: 14.0, left: 17, right: 17),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                text: controller.portfolioList[index].heading.toString(),
                textColor: primaryColor,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              Gap(20),
              Flexible(
                child: Container(
                  // height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(4),
                      topLeft: Radius.circular(4),
                    ),
                    color: secondaryColor.withOpacity(.9),
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
                    image: DecorationImage(
                      image: AssetImage(controller.portfolioList[index].image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      desktop: Container(
        decoration: BoxDecoration(
          color:
              controller.toggle.value ? Colors.white : const Color(0xff111827),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            // 🔹 Project Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              child: Image.asset(
                project.image,
                fit: BoxFit.fill,
                // height: 160,
                width: double.infinity,
              ),
            ),

            // 🔹 Project Info
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.heading,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color:
                          controller.toggle.value ? Colors.black : Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    project.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color:
                          controller.toggle.value
                              ? Colors.black.withOpacity(0.7)
                              : Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // 🔹 Tech Tags Row
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children:
                        project.technologies.take(9).map((tech) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
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
                                fontSize: 12,
                                color:
                                    controller.toggle.value
                                        ? Colors.black87
                                        : Colors.white,
                              ),
                            ),
                          );
                        }).toList(),
                  ),

                  // // 🔹 "+ more" tag if extra
                  // if (project.technologies.length > 3)
                  //   Padding(
                  //     padding: const EdgeInsets.only(top: 8.0),
                  //     child: Text(
                  //       "+${project.technologies.length - 3} more",
                  //       style: TextStyle(
                  //         color:
                  //             controller.toggle.value
                  //                 ? Colors.black54
                  //                 : Colors.white54,
                  //         fontSize: 13,
                  //       ),
                  //     ),
                  //   ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPortfolioBackSide(int index, ScrollControllerX controller) {
    return Responsive(
      mobile: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..rotateY(pi),
        child: Container(
          */ /*height: 370,
      width: 280,*/ /*
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
            padding: const EdgeInsets.only(top: 15.0, left: 14, right: 14),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    text: controller.portfolioList[index].heading.toString(),
                    textColor: primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  Gap(10),
                  SizedBox(
                    // width: 700,
                    child: MyText(
                      text:
                          controller.portfolioList[index].paragraph.toString(),
                      textColor: Colors.white,
                      textAlign: TextAlign.justify,
                      fontSize: 18,
                    ),
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
          */ /*height: 370,
      width: 280,*/ /*
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
            padding: const EdgeInsets.only(top: 14.0, left: 17, right: 17),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    text: controller.portfolioList[index].heading.toString(),
                    textColor: primaryColor,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                  Gap(10),
                  SizedBox(
                    // width: 700,
                    child: MyText(
                      text:
                          controller.portfolioList[index].paragraph.toString(),
                      textColor: Colors.white,
                      textAlign: TextAlign.justify,
                      fontSize: 18,
                    ),
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
          // height: 370,
          // width: 280,
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
            padding: const EdgeInsets.only(top: 25.0, left: 30, right: 30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    text: controller.portfolioList[index].heading.toString(),
                    textColor: primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  Gap(20),
                  SizedBox(
                    width: 700,
                    child: MyText(
                      text:
                          controller.portfolioList[index].paragraph.toString(),
                      textColor: Colors.white,
                      textAlign: TextAlign.justify,
                      fontSize: 15,
                    ),
                  ),
                  // Gap(20),
                  // SizedBox(
                  //   width: 700,
                  //   child: MyText(
                  //     text:
                  //         "My expertise lies in Dart programming, state management, API integration, and performance optimization—all of which help me create smooth and engaging mobile experiences. I believe that great development goes beyond writing code; it should solve real problems, improve usability, and provide meaningful interactions.",
                  //     textColor: Colors.white,
                  //     textAlign: TextAlign.justify,
                  //     fontSize: 18,
                  //   ),
                  // ),
                  // // Gap(20),
                  // SizedBox(
                  //   width: 700,
                  //   child: MyText(
                  //     text:
                  //         "Throughout my career, I have worked on diverse projects, developing intuitive mobile applications that align with both business goals and user needs. My process is rooted in clean architecture and best coding practices, ensuring that every app is scalable, efficient, and user-centric.",
                  //     textColor: Colors.white,
                  //     textAlign: TextAlign.justify,
                  //     fontSize: 18,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}*/
