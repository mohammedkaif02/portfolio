import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_portfolio/Controller/controller.dart';
import 'package:mr_portfolio/MyText.dart';
import 'package:mr_portfolio/responsive.dart';
import 'package:mr_portfolio/themeColor.dart';

class About extends StatelessWidget {
  About({super.key});

  final ScrollControllerX controller = Get.put(ScrollControllerX());

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Container(
        key: controller.aboutUsKey,
        color: controller.toggle.value ? Colors.white : const Color(0xff1f2837),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  MyText(
                    text: "About",
                    fontSize: 40,
                    textColor: Theme.of(context).colorScheme.secondary,
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

            Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              child: MyText(
                text:
                    "I’m Mohammed Kaif, a passionate Flutter Developer with over a year of experience building cross-platform mobile and web apps that are fast, scalable, and beautifully designed. I specialize in Flutter, Dart, and Node.js, and work with Firebase, REST APIs, and CI/CD pipelines to deliver seamless, production-ready solutions.",
                textColor: Theme.of(context).colorScheme.secondary,
                textAlign: TextAlign.justify,
                fontSize: 14,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              child: MyText(
                text:
                    "At Spin Info Solutions, I’ve helped build user-focused apps that run smoother, deploy faster, and perform better. I believe great products are born from a balance of creativity, clean architecture, and attention to detail and that’s what I aim for in every project.",
                textColor: Theme.of(context).colorScheme.secondary,
                textAlign: TextAlign.justify,
                fontSize: 14,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              child: MyText(
                text:
                    "Curious and always learning, I love exploring new tools, refining UI/UX design, and turning ideas into digital experiences that truly make an impact.",
                textColor: Theme.of(context).colorScheme.secondary,
                textAlign: TextAlign.justify,
                fontSize: 14,
              ),
            ),

            _buildFeatureCard(
              context,
              controller,
              index: 0,
              iconPath: "assets/img/mobile.png",
              title: "Mobile Development",
              subtitle: "Creating fast, cross-platform\nFlutter apps.",
              titleSize: 14,
              subtitleSize: 12,
              maxWidth: 330,
            ),
            const SizedBox(height: 25),
            _buildFeatureCard(
              context,
              controller,
              index: 1,
              iconPath: "assets/img/backend.png",
              title: "Backend Integration",
              subtitle:
                  "Building robust server-side\nlogic using Node.js and Firebase.",
              titleSize: 14,
              subtitleSize: 12,
              maxWidth: 330,
            ),
            const SizedBox(height: 25),
            _buildFeatureCard(
              context,
              controller,
              index: 2,
              iconPath: "assets/img/googleplay.png",
              title: "App Deployment",
              subtitle:
                  "Publishing production-ready\napps to Play Store and App Store.",
              titleSize: 14,
              subtitleSize: 12,
              maxWidth: 330,
            ),
            const SizedBox(height: 25),
            _buildFeatureCard(
              context,
              controller,
              index: 3,
              iconPath: "assets/img/uiux.png",
              title: "UI/UX Design",
              subtitle:
                  "Designing intuitive and\nvisually engaging user interfaces.",
              titleSize: 14,
              subtitleSize: 12,
              maxWidth: 330,
            ),
          ],
        ),
      ),
      tablet: Container(
        key: controller.aboutUsKey,
        color: controller.toggle.value ? Colors.white : const Color(0xff1f2837),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ===== Heading =====
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  MyText(
                    text: "About",
                    fontSize: 50,
                    textColor: Theme.of(context).colorScheme.secondary,
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

            Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              // width: 700,
              child: MyText(
                text:
                    "I’m Mohammed Kaif, a passionate Flutter Developer with over a year of experience building cross-platform mobile and web apps that are fast, scalable, and beautifully designed. I specialize in Flutter, Dart, and Node.js, and work with Firebase, REST APIs, and CI/CD pipelines to deliver seamless, production-ready solutions.",
                textColor: Theme.of(context).colorScheme.secondary,
                textAlign: TextAlign.justify,
                fontSize: 16,
              ),
            ),
            // const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              // width: 700,
              child: MyText(
                text:
                    "At Spin Info Solutions, I’ve helped build user-focused apps that run smoother, deploy faster, and perform better. I believe great products are born from a balance of creativity, clean architecture, and attention to detail — and that’s what I aim for in every project.",
                textColor: Theme.of(context).colorScheme.secondary,
                textAlign: TextAlign.justify,
                fontSize: 16,
              ),
            ),
            // const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              // width: 700,
              child: MyText(
                text:
                    "Curious and always learning, I love exploring new tools, refining UI/UX design, and turning ideas into digital experiences that truly make an impact.",
                textColor: Theme.of(context).colorScheme.secondary,
                textAlign: TextAlign.justify,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 25),
            _buildFeatureCard(
              context,
              controller,
              index: 0,
              iconPath: "assets/img/mobile.png",
              title: "Mobile Development",
              subtitle: "Creating fast, cross-platform\nFlutter apps.",
              titleSize: 16,
              subtitleSize: 14,
              maxWidth: 400,
            ),
            const SizedBox(height: 25),
            _buildFeatureCard(
              context,
              controller,
              index: 1,
              iconPath: "assets/img/backend.png",
              title: "Backend Integration",
              subtitle:
                  "Building robust server-side\nlogic using Node.js and Firebase.",
              titleSize: 16,
              subtitleSize: 14,
              maxWidth: 400,
            ),
            const SizedBox(height: 25),
            _buildFeatureCard(
              context,
              controller,
              index: 2,
              iconPath: "assets/img/googleplay.png",
              title: "App Deployment",
              subtitle:
                  "Publishing production-ready\napps to Play Store and App Store.",
              titleSize: 16,
              subtitleSize: 14,
              maxWidth: 400,
            ),
            const SizedBox(height: 25),
            _buildFeatureCard(
              context,
              controller,
              index: 3,
              iconPath: "assets/img/uiux.png",
              title: "UI/UX Design",
              subtitle:
                  "Designing intuitive and\nvisually engaging user interfaces.",
              titleSize: 16,
              subtitleSize: 14,
              maxWidth: 400,
            ),
          ],
        ),
      ),
      desktop: Container(
        key: controller.aboutUsKey,
        color: controller.toggle.value ? Colors.white : const Color(0xff1f2837),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ===== Heading =====
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  MyText(
                    text: "About",
                    fontSize: 50,
                    textColor: Theme.of(context).colorScheme.secondary,
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

            // ===== Content Section =====
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width / (16 / 9) * 0.16,
                left: 60,
                right: 60,
                bottom: 60,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ===== Left Side: Feature Cards =====
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        _buildFeatureCard(
                          context,
                          controller,
                          index: 0,
                          iconPath: "assets/img/mobile.png",
                          title: "Mobile Development",
                          subtitle:
                              "Creating fast, cross-platform\nFlutter apps.",
                          titleSize: 18,
                          subtitleSize: 16,
                          maxWidth: 400,
                        ),
                        const SizedBox(height: 25),
                        _buildFeatureCard(
                          context,
                          controller,
                          index: 1,
                          iconPath: "assets/img/backend.png",
                          title: "Backend Integration",
                          subtitle:
                              "Building robust server-side\nlogic using Node.js and Firebase.",
                          titleSize: 18,
                          subtitleSize: 16,
                          maxWidth: 400,
                        ),
                        const SizedBox(height: 25),
                        _buildFeatureCard(
                          context,
                          controller,
                          index: 2,
                          iconPath: "assets/img/googleplay.png",
                          title: "App Deployment",
                          subtitle:
                              "Publishing production-ready\napps to Play Store and App Store.",
                          titleSize: 18,
                          subtitleSize: 16,
                          maxWidth: 400,
                        ),
                        const SizedBox(height: 25),
                        _buildFeatureCard(
                          context,
                          controller,
                          index: 3,
                          iconPath: "assets/img/uiux.png",
                          title: "UI/UX Design",
                          subtitle:
                              "Designing intuitive and\nvisually engaging user interfaces.",
                          titleSize: 18,
                          subtitleSize: 16,
                          maxWidth: 400,
                        ),
                      ],
                    ),
                  ),

                  // ===== Right Side: About Text =====
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 700,
                          child: MyText(
                            text:
                                "I’m Mohammed Kaif, a passionate Flutter Developer with over a year of experience building cross-platform mobile and web apps that are fast, scalable, and beautifully designed. I specialize in Flutter, Dart, and Node.js, and work with Firebase, REST APIs, and CI/CD pipelines to deliver seamless, production-ready solutions.",
                            textColor: Theme.of(context).colorScheme.secondary,
                            textAlign: TextAlign.justify,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 700,
                          child: MyText(
                            text:
                                "At Spin Info Solutions, I’ve helped build user-focused apps that run smoother, deploy faster, and perform better. I believe great products are born from a balance of creativity, clean architecture, and attention to detail — and that’s what I aim for in every project.",
                            textColor: Theme.of(context).colorScheme.secondary,
                            textAlign: TextAlign.justify,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 700,
                          child: MyText(
                            text:
                                "Curious and always learning, I love exploring new tools, refining UI/UX design, and turning ideas into digital experiences that truly make an impact.",
                            textColor: Theme.of(context).colorScheme.secondary,
                            textAlign: TextAlign.justify,
                            fontSize: 20,
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
      ),
    );
  }
}

Widget _buildFeatureCard(
  BuildContext context,
  controller, {
  required int index,
  required String iconPath,
  required String title,
  required double titleSize,
  required double subtitleSize,
  required double maxWidth,
  required String subtitle,
}) {
  return MouseRegion(
    onEnter: (_) => controller.onEnterCard(index, true),
    onExit: (_) => controller.onEnterCard(index, false),
    child: Obx(
      () => AnimatedScale(
        scale: controller.isHoveredList[index].value ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color:
                  controller.toggle.value == true
                      ? Color(0xfff1f7ff)
                      : Color(0xff111827),
              boxShadow:
                  controller.isHoveredList[index].value
                      ? [
                        BoxShadow(
                          color: const Color(0xff7241ea).withOpacity(0.5),
                          blurRadius: 12,
                          spreadRadius: 2,
                        ),
                      ]
                      : [
                        BoxShadow(
                          color:
                              controller.toggle.value == true
                                  ? Colors.black.withOpacity(0.2)
                                  : Colors.black.withOpacity(0.5),
                          blurRadius: 12,
                          spreadRadius: 2,
                        ),
                      ],
            ),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        primaryColor,
                        Color(0xff7241ea),
                        Color(0xff9233ea),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(iconPath, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: title,
                      fontSize: titleSize,
                      textColor: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                    MyText(
                      text: subtitle,
                      textColor: Theme.of(context).colorScheme.secondary,
                      fontSize: subtitleSize,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
