import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mr_portfolio/Controller/controller.dart';
import 'package:mr_portfolio/MyText.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
  Contact({super.key});

  final ScrollControllerX controller = Get.put(ScrollControllerX());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    final isTablet = width >= 600 && width < 1100;
    final double titleFontSize =
        isMobile
            ? 32
            : isTablet
            ? 42
            : 50;
    final double subtitleFontSize =
        isMobile
            ? 16
            : isTablet
            ? 20
            : 26;
    final double headlineFontSize =
        isMobile
            ? 40
            : isTablet
            ? 70
            : 130;
    final double cardWidth =
        isMobile
            ? width * 0.8
            : isTablet
            ? width * 0.4
            : 330;

    return Container(
      key: controller.contactKey,
      width: double.infinity,
      color:
          controller.toggle.value
              ? const Color(0xfffbf8ff)
              : const Color(0xff111827),
      padding: EdgeInsets.symmetric(
        horizontal:
            isMobile
                ? 20
                : isTablet
                ? 60
                : 160,
        vertical: isMobile ? 40 : 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              MyText(
                text: "Contact",
                fontSize: titleFontSize,
                textColor: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
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

          SizedBox(height: isMobile ? 40 : 80),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 10 : 60),
            child: MyText(
              text:
                  "I’m always excited to connect, collaborate, and create meaningful digital experiences that make a difference.",
              fontSize: subtitleFontSize,
              textAlign: TextAlign.center,
              textColor: Color(0xff7037d8),
            ),
          ),

          SizedBox(height: isMobile ? 30 : 40),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: MyText(
              text: "LET'S WORK TOGETHER",
              fontSize: headlineFontSize,
              textColor: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(height: isMobile ? 40 : 80),

          Wrap(
            alignment: WrapAlignment.center,
            spacing: isMobile ? 20 : 40,
            runSpacing: isMobile ? 20 : 30,
            children: [
              _buildContactCard(
                context,
                index: 0,
                controller: controller,
                icon: CupertinoIcons.mail,
                title: "Email",
                value: "mohammedkaif4343@gmail.com",
                width: cardWidth,
                onTap: () async {
                  final Uri emailUri = Uri(
                    scheme: 'mailto',
                    path: 'mohammedkaif4343@gmail.com',
                    query:
                        'subject=Hello&body=Hi, I would like to contact you.',
                  );
                  if (await canLaunchUrl(emailUri)) {
                    await controller.myLaunchUrl(emailUri.toString());
                  }
                },
              ),
              _buildContactCard(
                context,
                index: 1,
                controller: controller,
                icon: FontAwesomeIcons.linkedinIn,
                title: "LinkedIn",
                value: "Mohammed Kaif",
                width: cardWidth,
                onTap: () async {
                  const url = 'https://www.linkedin.com/in/mohammedkaif4343/';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await controller.myLaunchUrl(url);
                  }
                },
              ),
              _buildContactCard(
                context,
                index: 2,
                controller: controller,
                icon: FontAwesomeIcons.github,
                title: "GitHub",
                value: "Mohammedkaif02",
                width: cardWidth,
                onTap: () async {
                  const url = 'https://github.com/mohammedkaif02';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await controller.myLaunchUrl(url);
                  }
                },
              ),
              _buildContactCard(
                context,
                index: 3,
                controller: controller,
                icon: FontAwesomeIcons.whatsapp,
                title: "Whatsapp",
                value: "+91 63741 85527",
                width: cardWidth,
                onTap: () async {
                  const url = 'https://wa.me/916374185527?text=Hi%20Mohammed!';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await controller.myLaunchUrl(url);
                  }
                },
              ),
            ],
          ),

          SizedBox(height: isMobile ? 60 : 100),
        ],
      ),
    );
  }
}

Widget _buildContactCard(
  BuildContext context, {
  required IconData icon,
  required String title,
  required String value,
  required int index,
  required ScrollControllerX controller,
  required VoidCallback onTap,
  required double width,
}) {
  return MouseRegion(
    onEnter: (_) => controller.setHover(index, true),
    onExit: (_) => controller.setHover(index, false),
    child: Obx(() {
      final isHovered = controller.hoverList[index];
      final isDark = !controller.toggle.value;

      return AnimatedScale(
        scale: isHovered ? 1.07 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: isDark ? const Color(0xff1f2837) : Colors.white,
            boxShadow: [
              BoxShadow(
                color:
                    isHovered
                        ? const Color(0xff7241ea).withOpacity(0.5)
                        : Colors.black12,
                blurRadius: isHovered ? 15 : 5,
                spreadRadius: isHovered ? 1.5 : 0.8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: onTap,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors:
                          isHovered
                              ? [
                                const Color(0xff9233ea),
                                const Color(0xff7241ea),
                              ]
                              : [
                                const Color(0xff7241ea),
                                const Color(0xff9233ea),
                              ],
                    ),
                    boxShadow:
                        isHovered
                            ? [
                              BoxShadow(
                                color: const Color(0xff7241ea).withOpacity(0.6),
                                blurRadius: 15,
                                spreadRadius: 2,
                              ),
                            ]
                            : [],
                  ),
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(icon, color: Colors.white, size: 25),
                ),
                const SizedBox(height: 10),
                MyText(
                  text: title,
                  textColor:
                      controller.toggle.value ? Colors.black54 : Colors.white54,
                  fontSize: 16,
                ),
                const SizedBox(height: 8),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: MyText(
                    text: value,
                    fontSize: 15,
                    textColor: Theme.of(context).colorScheme.secondary,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }),
  );
}
