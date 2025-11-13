import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
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
        if (constraints.maxWidth < 650) {
          return _buildMobileLayout(context, width, height);
        } else if (constraints.maxWidth < 1100) {
          return _buildTabletLayout(context, width, height);
        } else {
          return _buildDesktopLayout(context, width, height);
        }
      },
    );
  }

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
            _gradientText("Mohammed Kaif", width * 0.09),
            const Gap(10),
            MyText(
              text: "Full-Stack Developer | Flutter & Node.js",
              textColor: Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.bold,
              fontSize: width * 0.04,
            ),
            const Gap(15),
            SizedBox(
              width: width * 0.8,
              child: MyText(
                text:
                    "'Crafting fast, elegant, and impactful Flutter apps that turn ideas into reality.'",
                textColor: primaryColor,
                textAlign: TextAlign.center,
                fontSize: width * 0.04,
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
      child: MyText(
        text: text,

        fontSize: size,
        fontWeight: FontWeight.bold,
        textColor: Colors.white,
      ),
    );
  }

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
      color: isLight ? const Color(0xfffbf8ff) : const Color(0xff1f2937),
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
    child: Icon(icon, color: Theme.of(context).colorScheme.onPrimaryContainer),
  );
}
