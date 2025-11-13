import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mr_portfolio/View/about.dart';
import 'package:mr_portfolio/View/contact.dart';
import 'package:mr_portfolio/View/footer.dart';
import 'package:mr_portfolio/View/home.dart';
import 'package:mr_portfolio/View/my_skills.dart';
import 'package:mr_portfolio/View/projects.dart';
import 'package:mr_portfolio/responsive.dart';
import 'package:mr_portfolio/widgets/my_drawer.dart';
import 'package:mr_portfolio/widgets/responsive_app_bar.dart';

import '../Controller/controller.dart';
import '../themeColor.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ScrollControllerX controller = Get.put(ScrollControllerX());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: ResponsiveAppBar(),
      drawer: MyDrawer(),
      body: Stack(
        children: [
          Obx(() {
            return Container(
              color:
                  controller.toggle.value == true
                      ? Colors.white
                      : Color(0xff1f2837),
            );
          }),
          SingleChildScrollView(
            controller: controller.scrollController,
            child: Column(
              children: [
                Home(),
                Gap(Responsive.isMobile(context) ? 30 : 100),
                About(),
                Gap(Responsive.isMobile(context) ? 30 : 100),
                MySkills(),
                Gap(Responsive.isMobile(context) ? 30 : 100),
                Projects(),
                Gap(Responsive.isMobile(context) ? 30 : 100),
                Contact(),
                Gap(Responsive.isMobile(context) ? 30 : 0),
                Footer(),
              ],
            ),
          ),
          Positioned(
            bottom: Responsive.isMobile(context) ? 40 : 100,
            right: Responsive.isMobile(context) ? 20 : 60,
            child: Obx(() {
              return MouseRegion(
                onEnter: (_) => controller.onEnterScrollTop(true),
                onExit: (_) => controller.onEnterScrollTop(false),
                child: AnimatedScale(
                  scale: controller.isHoveredScrollTop.value ? 1.1 : 1.0,
                  duration: Duration(milliseconds: 200),
                  child: Visibility(
                    visible: controller.isButtonVisible.value,
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: controller.scrollToTop,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.keyboard_arrow_up,
                          size: 28,
                          color: secondaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
