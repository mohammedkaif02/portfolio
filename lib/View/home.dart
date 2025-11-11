import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mr_portfolio/Controller/controller.dart';
import 'package:mr_portfolio/MyText.dart';
import 'package:mr_portfolio/themeColor.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final ScrollControllerX controller = Get.put(ScrollControllerX());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        // Breakpoints
        if (constraints.maxWidth < 650) {
          // 👇 Mobile Layout
          return _buildMobileLayout(context, width, height);
        } else if (constraints.maxWidth < 1100) {
          // 👇 Tablet Layout
          return _buildTabletLayout(context, width, height);
        } else {
          // 👇 Desktop Layout
          return _buildDesktopLayout(context, width, height);
        }
      },
    );
  }

  // 🌐 COMMON BACKGROUND
  BoxDecoration _backgroundDecoration(bool isLight) {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          isLight ? const Color(0xfff1f7ff) : const Color(0xff111827),
          isLight ? const Color(0xfff8fbff) : const Color(0xff141c2b),
          isLight ? const Color(0xfffbf8ff) : const Color(0xff1f2837),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }

  // 📱 MOBILE LAYOUT
  Widget _buildMobileLayout(BuildContext context, double width, double height) {
    return Container(
      key: controller.homeKey,
      height: height,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: width * 0.07, vertical: 20),
      decoration: _backgroundDecoration(controller.toggle.value),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap(height / 6),
            _gradientText("Mohammed Kaif", 48),
            const Gap(10),
            MyText(
              text: "Full-Stack Developer | Flutter & Node.js",
              textColor: Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            const Gap(15),
            SizedBox(
              width: width * 0.6,
              child: MyText(
                text:
                    "'Crafting fast, elegant, and impactful Flutter apps that turn ideas into reality.'",
                textColor: primaryColor,
                textAlign: TextAlign.center,
                fontSize: 24,
              ),
            ),
            const Gap(40),
            _socialIconsRow(context, 26),
            const Gap(50),
            _buttonsRow(context),
            const Gap(50),
          ],
        ),
      ),
    );
  }

  // 💻 TABLET LAYOUT
  Widget _buildTabletLayout(BuildContext context, double width, double height) {
    return Container(
      key: controller.homeKey,
      height: height,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      decoration: _backgroundDecoration(controller.toggle.value),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _gradientText("Mohammed Kaif", 65),
            const Gap(10),
            MyText(
              text: "Full-Stack Developer | Flutter & Node.js",
              textColor: Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
            const Gap(15),
            SizedBox(
              width: width * 0.6,
              child: MyText(
                text:
                    "'Crafting fast, elegant, and impactful Flutter apps that turn ideas into reality.'",
                textColor: primaryColor,
                textAlign: TextAlign.center,
                fontSize: 22,
              ),
            ),
            const Gap(30),
            _socialIconsRow(context, 26),
            const Gap(40),
            _buttonsRow(context),
          ],
        ),
      ),
    );
  }

  // 🖥️ DESKTOP LAYOUT
  Widget _buildDesktopLayout(
    BuildContext context,
    double width,
    double height,
  ) {
    return Container(
      key: controller.homeKey,
      height: height,
      width: double.infinity,
      decoration: _backgroundDecoration(controller.toggle.value),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Left Content
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _gradientText("Mohammed Kaif", 100),
                    const Gap(8),
                    MyText(
                      text: "Full-Stack Developer | Flutter & Node.js",
                      textColor: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                    const Gap(10),
                    SizedBox(
                      width: width * 0.47,
                      child: MyText(
                        text:
                            "'Flutter Developer crafting fast, elegant, and impactful mobile experiences that bridge ideas to reality.'",
                        textColor: primaryColor,
                        textAlign: TextAlign.center,
                        fontSize: 30,
                      ),
                    ),
                    const Gap(30),
                    _socialIconsRow(context, 28),
                    const Gap(40),
                    _buttonsRow(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🎨 Gradient Text
  Widget _gradientText(String text, double size) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback:
          (bounds) => const LinearGradient(
            colors: [
              Color(0xff7037d8),
              Color(0xff7241ea),
              Color(0xff793eea),
              Color(0xff8334e2),
              Color(0xff9233ea),
            ],
          ).createShader(Rect.fromLTWH(0, 0, 400, 100)),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: size,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  // 🌍 Social Icons Row (with hover)
  Widget _socialIconsRow(BuildContext context, double iconSize) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 30,
      runSpacing: 20,
      children: [
        _hoverableIcon(
          context,
          icon: Icons.mail_outline_rounded,
          hoverValue: controller.isHoveringMail,
          onTap: () async {
            final Uri emailUri = Uri(
              scheme: 'mailto',
              path: 'mohammedkaif4343@gmail.com',
              query: 'subject=Hello Mohammed&body=Hi, I’d like to connect!',
            );
            await controller.myLaunchUrl(emailUri.toString());
          },
        ),
        _hoverableIcon(
          context,
          icon: FontAwesomeIcons.linkedinIn,
          hoverValue: controller.isHoveringLinkedIn,
          onTap:
              () => controller.myLaunchUrl(
                'https://www.linkedin.com/in/mohammedkaif4343/',
              ),
        ),
        _hoverableIcon(
          context,
          icon: FontAwesomeIcons.github,
          hoverValue: controller.isHoveringGithub,
          onTap:
              () => controller.myLaunchUrl('https://github.com/mohammedkaif02'),
        ),
        _hoverableIcon(
          context,
          icon: FontAwesomeIcons.whatsapp,
          hoverValue: controller.isHoveringWhatsapp,
          onTap:
              () => controller.myLaunchUrl(
                'https://wa.me/916374185527?text=Hi%20Mohammed!',
              ),
        ),
      ],
    );
  }

  /// 🪄 Reusable Hoverable Icon Widget
  Widget _hoverableIcon(
    BuildContext context, {
    required IconData icon,
    required RxBool hoverValue,
    required VoidCallback onTap,
  }) {
    return MouseRegion(
      onEnter: (_) => hoverValue.value = true,
      onExit: (_) => hoverValue.value = false,
      child: Obx(
        () => AnimatedScale(
          scale: hoverValue.value ? 1.15 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow:
                  hoverValue.value
                      ? [
                        BoxShadow(
                          color: primaryColor.withOpacity(0.4),
                          blurRadius: 15,
                          spreadRadius: 2,
                        ),
                      ]
                      : [],
            ),
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: onTap,
              child: buildIconContainer(
                context,
                controller.toggle.value,
                hoverValue.value,
                icon,
                20,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 🧩 Buttons Row (with hover)
  Widget _buttonsRow(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 40,
      runSpacing: 20,
      children: [
        _hoverableButton(
          text: "Let's Connect",
          bgColor: primaryColor,
          textColor: Colors.white,
          hoverValue: controller.isHoveringConnect,
          onTap:
              () =>
                  controller.scrollToSection(controller.contactKey, "Contact"),
        ),
        _hoverableButton(
          text: "Download CV",
          bgColor: Colors.transparent,
          textColor: primaryColor,
          hoverValue: controller.isHoveringDownload,
          onTap: controller.downloadCV,
          border: Border.all(color: primaryColor, width: 1.5),
        ),
      ],
    );
  }

  /// 🪄 Reusable Hoverable Button Widget
  Widget _hoverableButton({
    required String text,
    required Color bgColor,
    required Color textColor,
    required RxBool hoverValue,
    required VoidCallback onTap,
    Border? border,
  }) {
    return MouseRegion(
      onEnter: (_) => hoverValue.value = true,
      onExit: (_) => hoverValue.value = false,
      child: Obx(
        () => AnimatedScale(
          scale: hoverValue.value ? 1.08 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
            decoration: BoxDecoration(
              color: bgColor,
              border: border,
              borderRadius: BorderRadius.circular(8),
              boxShadow:
                  hoverValue.value
                      ? [
                        BoxShadow(
                          color: primaryColor.withOpacity(0.5),
                          blurRadius: 12,
                          spreadRadius: 2,
                        ),
                      ]
                      : [],
            ),
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: onTap,
              child: MyText(text: text, textColor: textColor),
            ),
          ),
        ),
      ),
    );
  }

  // 🧱 Reusable Button
  Widget _buildActionButton(
    String text,
    Color bgColor,
    Color textColor,
    VoidCallback onTap, {
    Border? border,
  }) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
          border: border,
        ),
        child: MyText(text: text, textColor: textColor),
      ),
    );
  }
}

Widget buildIconContainer(
  BuildContext context,
  bool isLight,
  bool isHovered,
  IconData icon,
  double size,
) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11.5),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: isLight ? const Color(0xfffffbf8ff) : const Color(0xffff1f2937),
      boxShadow: [
        BoxShadow(
          color:
              isHovered
                  ? primaryColor.withOpacity(0.6)
                  : (isLight
                      ? Colors.grey.withOpacity(0.6)
                      : Colors.black54.withOpacity(0.6)),
          blurRadius: 12,
          spreadRadius: 1,
        ),
      ],
    ),
    // child: Image.asset(
    //   assetPath,
    //   width: 25,
    //   height: 25,
    //   color: Theme.of(context).colorScheme.onPrimaryContainer,
    // ),
    child: Icon(icon, color: Theme.of(context).colorScheme.onPrimaryContainer),
  );
}

/*import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mr_portfolio/MyText.dart';
import 'package:mr_portfolio/responsive.dart';

import '../Controller/controller.dart';
import '../themeColor.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final ScrollControllerX controller = Get.put(ScrollControllerX());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Responsive(
      mobile: Container(
        key: controller.homeKey,
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(14),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  */ /*crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,*/ /*
                  children: [
                    MyText(
                      text: "Hi. I'm",
                      textColor: Colors.white,
                      fontSize: 24,
                    ),
                    Gap(5),
                    MyText(
                      text: "HIRUFANULLAH",
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                    Gap(5),
                    MyText(
                      text: "Flutter developer",
                      textColor: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                    Gap(10),
                    Container(
                      height: height * .45,
                      width: width * 45,
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colors.white),
                      ),
                      child: Image.asset("assets/Project_Image/homeScreen.png"),
                    ),
                    Gap(10),
                    SizedBox(
                      // width: width*.7,
                      child: MyText(
                        text:
                            "I am a passionate Flutter Developer with experience in building high-performance, visually appealing, and scalable mobile applications for Android, iOS, Windows and web. My expertise lies in Dart, Flutter, Firebase, and GetX, ensuring efficient state management and seamless user experiences.",
                        textColor: Colors.white,
                        textAlign: TextAlign.justify,
                        fontSize: 18,
                      ),
                    ),
                    Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            controller.scrollToSection(
                              controller.contactKey,
                              "Contact",
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.06,
                              vertical: height * 0.015,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: primaryColor,
                            ),
                            child: MyText(
                              text: "Let's Connect",
                              textColor: Colors.white,
                              fontSize: width * 0.045,
                            ),
                          ),
                        ),
                        // Gap(50),
                        InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () => controller.downloadCV(),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.06,
                              vertical: height * 0.015,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: primaryColor,
                                width: 1.5,
                              ),
                            ),
                            child: MyText(
                              text: "Download CV",
                              textColor: primaryColor,
                              fontSize: width * 0.045,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      tablet: Container(
        key: controller.homeKey,
        height: MediaQuery.of(context).size.height,
        // 👈 Full viewport height
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              controller.toggle.value == true
                  ? const Color(0xfffff1f7ff)
                  : const Color(0xffff111827),
              controller.toggle.value == true
                  ? const Color(0xfffff8fbff)
                  : const Color(0xffff141c2b),
              controller.toggle.value == true
                  ? const Color(0xffffffefdff)
                  : const Color(0xffff161e2d),
              controller.toggle.value == true
                  ? const Color(0xfffffbf8ff)
                  : const Color(0xffff1f2837),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          // 👈 Centers content both vertically & horizontally
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback:
                            (bounds) => const LinearGradient(
                              colors: [
                                Color(0xffff7037d8),
                                Color(0xffff7241ea),
                                Color(0xffff783ee8),
                                Color(0xffff793eea),
                                Color(0xffff7e3cea),
                                Color(0xffff833aea),
                                Color(0xffff8334e2),
                                Color(0xffff9233ea),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ).createShader(Rect.fromLTWH(0, 0, 400, 100)),
                        child: Text(
                          'Mohammed Kaif',
                          style: GoogleFonts.poppins(
                            fontSize: 100,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      const Gap(8),
                      MyText(
                        text: "Full-Stack Developer | Flutter & Node.js",
                        textColor:
                            Theme.of(context).colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),

                      const Gap(10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.47,
                        child: MyText(
                          text:
                              "'Flutter Developer crafting fast, elegant, and impactful mobile experiences that bridge ideas to reality.'",
                          textColor: primaryColor,
                          textAlign: TextAlign.center,
                          fontSize: 30,
                        ),
                      ),

                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // 📧 Email
                          MouseRegion(
                            onEnter: (_) {
                              controller.isHoveringMail.value = true;
                              controller.onMailEnter(true);
                            },
                            onExit: (_) {
                              controller.isHoveringMail.value = false;
                              controller.onMailEnter(false);
                            },
                            child: Obx(
                              () => AnimatedScale(
                                scale:
                                    controller.isMailHovered.value ? 1.1 : 1.0,
                                duration: const Duration(milliseconds: 200),
                                child: InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () async {
                                    final Uri emailUri = Uri(
                                      scheme: 'mailto',
                                      path: 'mohammedkaif4343@gmail.com',
                                      query:
                                          'subject=Hello Mohammed&body=Hi, I’d like to connect!',
                                    );
                                    await controller.myLaunchUrl(
                                      emailUri.toString(),
                                    );
                                  },
                                  child: buildIconContainer(
                                    context,
                                    controller.toggle.value,
                                    controller.isHoveringMail.value,
                                    Icons.mail_outline_rounded,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Gap(30),
                          // 💼 LinkedIn
                          MouseRegion(
                            onEnter: (_) {
                              controller.isHoveringLinkedIn.value = true;
                              controller.onLinkedInEnter(true);
                            },
                            onExit: (_) {
                              controller.isHoveringLinkedIn.value = false;
                              controller.onLinkedInEnter(false);
                            },
                            child: Obx(
                              () => AnimatedScale(
                                scale:
                                    controller.isLinkedInHovered.value
                                        ? 1.1
                                        : 1.0,
                                duration: const Duration(milliseconds: 200),
                                child: InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap:
                                      () => controller.myLaunchUrl(
                                        'https://www.linkedin.com/in/mohammedkaif4343/',
                                      ),
                                  child: buildIconContainer(
                                    context,
                                    controller.toggle.value,
                                    controller.isHoveringLinkedIn.value,
                                    FontAwesomeIcons.linkedinIn,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Gap(30),
                          // 🧑‍💻 GitHub
                          MouseRegion(
                            onEnter: (_) {
                              controller.isHoveringGithub.value = true;
                              controller.onGithubEnter(true);
                            },
                            onExit: (_) {
                              controller.isHoveringGithub.value = false;
                              controller.onGithubEnter(false);
                            },
                            child: Obx(
                              () => AnimatedScale(
                                scale:
                                    controller.isGithubHovered.value
                                        ? 1.1
                                        : 1.0,
                                duration: const Duration(milliseconds: 200),
                                child: InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap:
                                      () => controller.myLaunchUrl(
                                        'https://github.com/mohammedkaif02',
                                      ),
                                  child: buildIconContainer(
                                    context,
                                    controller.toggle.value,
                                    controller.isHoveringGithub.value,
                                    FontAwesomeIcons.github,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Gap(30),
                          // 💬 WhatsApp
                          MouseRegion(
                            onEnter: (_) {
                              controller.isHoveringWhatsapp.value = true;
                              controller.onWhatsappEnter(true);
                            },
                            onExit: (_) {
                              controller.isHoveringWhatsapp.value = false;
                              controller.onWhatsappEnter(false);
                            },
                            child: Obx(
                              () => AnimatedScale(
                                scale:
                                    controller.isWhatsappHovered.value
                                        ? 1.1
                                        : 1.0,
                                duration: const Duration(milliseconds: 200),
                                child: InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap:
                                      () => controller.myLaunchUrl(
                                        'https://wa.me/916374185527?text=Hi%20Mohammed!',
                                      ),
                                  child: buildIconContainer(
                                    context,
                                    controller.toggle.value,
                                    controller.isHoveringWhatsapp.value,
                                    FontAwesomeIcons.whatsapp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // 👈 put your icons row here
                      const Gap(40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Let's Connect Button
                          MouseRegion(
                            onEnter: (_) {
                              controller.isHoveringConnect.value = true;
                              controller.onEnter(true);
                            },
                            onExit: (_) {
                              controller.isHoveringConnect.value = false;
                              controller.onEnter(false);
                            },
                            child: Obx(
                              () => AnimatedScale(
                                scale: controller.isHovered.value ? 1.1 : 1.0,
                                duration: Duration(milliseconds: 200),
                                child: InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    controller.scrollToSection(
                                      controller.contactKey,
                                      "Contact",
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 28,
                                      vertical: 11.5,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: primaryColor,
                                      boxShadow:
                                          controller.isHoveringConnect.value
                                              ? [
                                                BoxShadow(
                                                  color: primaryColor
                                                      .withOpacity(0.6),
                                                  blurRadius: 12,
                                                  spreadRadius: 1,
                                                ),
                                              ]
                                              : [],
                                    ),
                                    child: MyText(
                                      text: "Let's Connect",
                                      textColor: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Gap(50),
                          // Download CV Button
                          InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () => controller.downloadCV(),
                            child: Obx(() {
                              return MouseRegion(
                                onEnter: (_) => controller.onEnter2(true),
                                onExit: (_) => controller.onEnter2(false),
                                child: AnimatedScale(
                                  scale:
                                      controller.isHovered2.value ? 1.1 : 1.0,
                                  duration: Duration(milliseconds: 200),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 28,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: primaryColor,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: MyText(
                                      text: "Download CV",
                                      textColor: primaryColor,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),

                      const Gap(40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      desktop: Container(
        key: controller.homeKey,
        height: MediaQuery.of(context).size.height,
        // 👈 Full viewport height
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              controller.toggle.value == true
                  ? const Color(0xfffff1f7ff)
                  : const Color(0xffff111827),
              controller.toggle.value == true
                  ? const Color(0xfffff8fbff)
                  : const Color(0xffff141c2b),
              controller.toggle.value == true
                  ? const Color(0xffffffefdff)
                  : const Color(0xffff161e2d),
              controller.toggle.value == true
                  ? const Color(0xfffffbf8ff)
                  : const Color(0xffff1f2837),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          // 👈 Centers content both vertically & horizontally
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback:
                            (bounds) => const LinearGradient(
                              colors: [
                                Color(0xffff7037d8),
                                Color(0xffff7241ea),
                                Color(0xffff783ee8),
                                Color(0xffff793eea),
                                Color(0xffff7e3cea),
                                Color(0xffff833aea),
                                Color(0xffff8334e2),
                                Color(0xffff9233ea),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ).createShader(Rect.fromLTWH(0, 0, 400, 100)),
                        child: Text(
                          'Mohammed Kaif',
                          style: GoogleFonts.poppins(
                            fontSize: 100,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      const Gap(8),
                      MyText(
                        text: "Full-Stack Developer | Flutter & Node.js",
                        textColor:
                            Theme.of(context).colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),

                      const Gap(10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.47,
                        child: MyText(
                          text:
                              "'Flutter Developer crafting fast, elegant, and impactful mobile experiences that bridge ideas to reality.'",
                          textColor: primaryColor,
                          textAlign: TextAlign.center,
                          fontSize: 30,
                        ),
                      ),

                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // 📧 Email
                          MouseRegion(
                            onEnter: (_) {
                              controller.isHoveringMail.value = true;
                              controller.onMailEnter(true);
                            },
                            onExit: (_) {
                              controller.isHoveringMail.value = false;
                              controller.onMailEnter(false);
                            },
                            child: Obx(
                              () => AnimatedScale(
                                scale:
                                    controller.isMailHovered.value ? 1.1 : 1.0,
                                duration: const Duration(milliseconds: 200),
                                child: InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () async {
                                    final Uri emailUri = Uri(
                                      scheme: 'mailto',
                                      path: 'mohammedkaif4343@gmail.com',
                                      query:
                                          'subject=Hello Mohammed&body=Hi, I’d like to connect!',
                                    );
                                    await controller.myLaunchUrl(
                                      emailUri.toString(),
                                    );
                                  },
                                  child: buildIconContainer(
                                    context,
                                    controller.toggle.value,
                                    controller.isHoveringMail.value,
                                    Icons.mail_outline_rounded,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Gap(30),
                          // 💼 LinkedIn
                          MouseRegion(
                            onEnter: (_) {
                              controller.isHoveringLinkedIn.value = true;
                              controller.onLinkedInEnter(true);
                            },
                            onExit: (_) {
                              controller.isHoveringLinkedIn.value = false;
                              controller.onLinkedInEnter(false);
                            },
                            child: Obx(
                              () => AnimatedScale(
                                scale:
                                    controller.isLinkedInHovered.value
                                        ? 1.1
                                        : 1.0,
                                duration: const Duration(milliseconds: 200),
                                child: InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap:
                                      () => controller.myLaunchUrl(
                                        'https://www.linkedin.com/in/mohammedkaif4343/',
                                      ),
                                  child: buildIconContainer(
                                    context,
                                    controller.toggle.value,
                                    controller.isHoveringLinkedIn.value,
                                    FontAwesomeIcons.linkedinIn,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Gap(30),
                          // 🧑‍💻 GitHub
                          MouseRegion(
                            onEnter: (_) {
                              controller.isHoveringGithub.value = true;
                              controller.onGithubEnter(true);
                            },
                            onExit: (_) {
                              controller.isHoveringGithub.value = false;
                              controller.onGithubEnter(false);
                            },
                            child: Obx(
                              () => AnimatedScale(
                                scale:
                                    controller.isGithubHovered.value
                                        ? 1.1
                                        : 1.0,
                                duration: const Duration(milliseconds: 200),
                                child: InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap:
                                      () => controller.myLaunchUrl(
                                        'https://github.com/mohammedkaif02',
                                      ),
                                  child: buildIconContainer(
                                    context,
                                    controller.toggle.value,
                                    controller.isHoveringGithub.value,
                                    FontAwesomeIcons.github,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Gap(30),
                          // 💬 WhatsApp
                          MouseRegion(
                            onEnter: (_) {
                              controller.isHoveringWhatsapp.value = true;
                              controller.onWhatsappEnter(true);
                            },
                            onExit: (_) {
                              controller.isHoveringWhatsapp.value = false;
                              controller.onWhatsappEnter(false);
                            },
                            child: Obx(
                              () => AnimatedScale(
                                scale:
                                    controller.isWhatsappHovered.value
                                        ? 1.1
                                        : 1.0,
                                duration: const Duration(milliseconds: 200),
                                child: InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap:
                                      () => controller.myLaunchUrl(
                                        'https://wa.me/916374185527?text=Hi%20Mohammed!',
                                      ),
                                  child: buildIconContainer(
                                    context,
                                    controller.toggle.value,
                                    controller.isHoveringWhatsapp.value,
                                    FontAwesomeIcons.whatsapp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // 👈 put your icons row here
                      const Gap(40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Let's Connect Button
                          MouseRegion(
                            onEnter: (_) {
                              controller.isHoveringConnect.value = true;
                              controller.onEnter(true);
                            },
                            onExit: (_) {
                              controller.isHoveringConnect.value = false;
                              controller.onEnter(false);
                            },
                            child: Obx(
                              () => AnimatedScale(
                                scale: controller.isHovered.value ? 1.1 : 1.0,
                                duration: Duration(milliseconds: 200),
                                child: InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    controller.scrollToSection(
                                      controller.contactKey,
                                      "Contact",
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 28,
                                      vertical: 11.5,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: primaryColor,
                                      boxShadow:
                                          controller.isHoveringConnect.value
                                              ? [
                                                BoxShadow(
                                                  color: primaryColor
                                                      .withOpacity(0.6),
                                                  blurRadius: 12,
                                                  spreadRadius: 1,
                                                ),
                                              ]
                                              : [],
                                    ),
                                    child: MyText(
                                      text: "Let's Connect",
                                      textColor: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Gap(50),
                          // Download CV Button
                          InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () => controller.downloadCV(),
                            child: Obx(() {
                              return MouseRegion(
                                onEnter: (_) => controller.onEnter2(true),
                                onExit: (_) => controller.onEnter2(false),
                                child: AnimatedScale(
                                  scale:
                                      controller.isHovered2.value ? 1.1 : 1.0,
                                  duration: Duration(milliseconds: 200),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 28,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: primaryColor,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: MyText(
                                      text: "Download CV",
                                      textColor: primaryColor,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),

                      const Gap(40),
                    ],
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

Widget buildIconContainer(
  BuildContext context,
  bool isLight,
  bool isHovered,
  IconData icon,
) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11.5),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: isLight ? const Color(0xfffffbf8ff) : const Color(0xffff1f2937),
      boxShadow: [
        BoxShadow(
          color:
              isHovered
                  ? primaryColor.withOpacity(0.6)
                  : (isLight
                      ? Colors.grey.withOpacity(0.6)
                      : Colors.black54.withOpacity(0.6)),
          blurRadius: 12,
          spreadRadius: 1,
        ),
      ],
    ),
    // child: Image.asset(
    //   assetPath,
    //   width: 25,
    //   height: 25,
    //   color: Theme.of(context).colorScheme.onPrimaryContainer,
    // ),
    child: Icon(icon, color: Theme.of(context).colorScheme.onPrimaryContainer),
  );
}
*/
