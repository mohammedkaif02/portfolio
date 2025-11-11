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

    // Responsive text sizes
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

    // Responsive card width
    final double cardWidth =
        isMobile
            ? width * 0.8
            : isTablet
            ? width * 0.4
            : 330;

    return Container(
      key: controller.contactKey,
      color:
          controller.toggle.value
              ? const Color(0xfffffbf8ff)
              : const Color(0xffff111827),
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
          // ===== Title =====
          Column(
            children: [
              MyText(
                text: "Contact",
                fontSize: titleFontSize,
                textColor: Theme.of(context).colorScheme.onBackground,
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

          // ===== Subtitle =====
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 10 : 60),
            child: MyText(
              text:
                  "I’m always excited to connect, collaborate, and create meaningful digital experiences that make a difference.",
              fontSize: subtitleFontSize,
              textAlign: TextAlign.center,
              textColor: Theme.of(context).colorScheme.onBackground,
            ),
          ),

          SizedBox(height: isMobile ? 30 : 40),

          // ===== Headline =====
          FittedBox(
            fit: BoxFit.scaleDown,
            child: MyText(
              text: "LET'S WORK TOGETHER",
              fontSize: headlineFontSize,
              textColor: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(height: isMobile ? 40 : 80),

          // ===== Contact Cards =====
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

// ===== Contact Card Widget =====
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
                    textColor: Theme.of(context).colorScheme.onBackground,
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

/*
class Contact extends StatelessWidget {
  Contact({super.key});

  final ScrollControllerX controller = Get.put(ScrollControllerX());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Responsive(
      mobile: Container(
        key: controller.contactKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: MyText(
                text: "Contact",
                fontSize: 40,
                textColor: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    height: height * .45,
                    width: width * 45,
                    child: Image.asset(
                      "assets/Project_Image/contact.png",
                      // height: height * .4,
                    ),
                  ),
                  Gap(30),
                  MyText(
                    text: "LET'S WORK TOGETHER",
                    fontSize: 60,
                    textColor: Colors.white,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                  Gap(30),
                  // Gmail Container
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () async {
                      final Uri emailUri = Uri(
                        scheme: 'mailto',
                        path: 'hirfan0307@gmail.com',
                        query:
                            'subject=Hello&body=Hi, I would like to contact you.', // Optional
                      );
                      if (await canLaunchUrl(emailUri)) {
                        await launchUrl(emailUri);
                      } else {
                        print("Could not launch email app");
                      }
                    },
                    child: Container(
                      height: 45,
                      width: 330,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
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
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.mail_outline,
                            color: Colors.white,
                            size: 25,
                          ),
                          Gap(20),
                          MyText(
                            text: "hirfan0307@gmail.com",
                            fontSize: 20,
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),

                  Gap(30),

                  // WhatsApp Container
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () async {
                      String phoneNumber = "9360673455";
                      final Uri whatsappUri = Uri.parse(
                        "https://wa.me/$phoneNumber",
                      ); // Opens WhatsApp chat
                      if (await canLaunchUrl(whatsappUri)) {
                        await launchUrl(
                          whatsappUri,
                          mode: LaunchMode.externalApplication,
                        );
                      } else {
                        print("Could not launch WhatsApp");
                      }
                    },
                    child: Container(
                      height: 45,
                      width: 230,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
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
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/img/whatsapp.png", width: 25),
                          Gap(20),
                          MyText(
                            text: "9360673455",
                            fontSize: 20,
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(50),
                ],
              ),
            ),
          ],
        ),
      ),
      tablet: Container(
        key: controller.contactKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: MyText(
                text: "Contact",
                fontSize: 50,
                textColor: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Align(
              child: Padding(
                padding: EdgeInsets.only(
                  top:
                      MediaQuery.of(context).size.width /
                      (16 / 9) *
                      0.1, // Adjust multiplier as needed
                ),
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/Project_Image/contact.png",
                        height: height * .4,
                      ),
                      Gap(30),
                      MyText(
                        text: "LET'S WORK TOGETHER",
                        fontSize: 70,
                        textColor: Colors.white,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                      Gap(50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Gmail Container
                          InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () async {
                              final Uri emailUri = Uri(
                                scheme: 'mailto',
                                path: 'hirfan0307@gmail.com',
                                query:
                                    'subject=Hello&body=Hi, I would like to contact you.', // Optional
                              );
                              if (await canLaunchUrl(emailUri)) {
                                await launchUrl(emailUri);
                              } else {
                                print("Could not launch email app");
                              }
                            },
                            child: Container(
                              height: 45,
                              width: 330,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
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
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.mail_outline,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  Gap(20),
                                  MyText(
                                    text: "hirfan0307@gmail.com",
                                    fontSize: 20,
                                    textColor: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Gap(50),

                          // WhatsApp Container
                          InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () async {
                              String phoneNumber = "9360673455";
                              final Uri whatsappUri = Uri.parse(
                                "https://wa.me/$phoneNumber",
                              ); // Opens WhatsApp chat
                              if (await canLaunchUrl(whatsappUri)) {
                                await launchUrl(
                                  whatsappUri,
                                  mode: LaunchMode.externalApplication,
                                );
                              } else {
                                print("Could not launch WhatsApp");
                              }
                            },
                            child: Container(
                              height: 45,
                              width: 230,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
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
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/img/whatsapp.png",
                                    width: 25,
                                  ),
                                  Gap(20),
                                  MyText(
                                    text: "9360673455",
                                    fontSize: 20,
                                    textColor: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      desktop: Container(
        color:
            controller.toggle.value ? Color(0xfffffbf8ff) : Color(0xffff111827),
        key: controller.contactKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  MyText(
                    text: "Contact",
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
            Align(
              child: Padding(
                padding: EdgeInsets.only(
                  top:
                      MediaQuery.of(context).size.width /
                      (16 / 9) *
                      0.1, // Adjust multiplier as needed
                ),
                child: Center(
                  child: Column(
                    children: [
                      // Image.asset(
                      //   "assets/Project_Image/contact.png",
                      //   height: height * .6,
                      // ),
                      // Gap(30),
                      MyText(
                        text:
                            "I’m always excited to connect, collaborate, and create meaningful digital experiences that make a difference.",
                        fontSize: 26,
                      ),
                      MyText(
                        text: "LET'S WORK TOGETHER",
                        fontSize: 130,
                        textColor: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                      Gap(50),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     // Gmail Container
                      //     InkWell(
                      //       highlightColor: Colors.transparent,
                      //       splashColor: Colors.transparent,
                      //       onTap: () async {
                      //         final Uri emailUri = Uri(
                      //           scheme: 'mailto',
                      //           path: 'hirfan0307@gmail.com',
                      //           query:
                      //           'subject=Hello&body=Hi, I would like to contact you.', // Optional
                      //         );
                      //         if (await canLaunchUrl(emailUri)) {
                      //           await launchUrl(emailUri);
                      //         } else {
                      //           print("Could not launch email app");
                      //         }
                      //       },
                      //       child: MouseRegion(
                      //         onEnter: (_) => controller.onEnter(true),
                      //         onExit: (_) => controller.onEnter(false),
                      //         child: Obx(() {
                      //           return AnimatedScale(
                      //             scale: controller.isHovered.value ? 1.1 : 1.0,
                      //             duration: Duration(milliseconds: 200),
                      //             child: Container(
                      //               // height: 45,
                      //               // width: 330,
                      //               decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(18),
                      //                 color: secondaryColor.withOpacity(.9),
                      //                 boxShadow: [
                      //                   BoxShadow(
                      //                     spreadRadius: .8,
                      //                     blurRadius: 5,
                      //                     offset: Offset(-5, 5),
                      //                     color: Colors.black12,
                      //                   ),
                      //                   BoxShadow(
                      //                     spreadRadius: .8,
                      //                     blurRadius: 5,
                      //                     offset: Offset(.5, -.5),
                      //                     color: Colors.white24,
                      //                   ),
                      //                 ],
                      //               ),
                      //               child: Padding(
                      //                 padding: const EdgeInsets.fromLTRB(
                      //                   70,
                      //                   12.0,
                      //                   70,
                      //                   12,
                      //                 ),
                      //                 child: Column(
                      //                   mainAxisAlignment:
                      //                   MainAxisAlignment.center,
                      //                   children: [
                      //                     Container(
                      //                       decoration: BoxDecoration(
                      //                         shape: BoxShape.circle,
                      //                         gradient: const LinearGradient(
                      //                           colors: [
                      //                             primaryColor,
                      //                             Color(0xffff7241ea),
                      //                             Color(0xffff9233ea),
                      //                           ],
                      //                         ),
                      //                       ),
                      //                       child: Padding(
                      //                         padding: const EdgeInsets.all(
                      //                           12.0,
                      //                         ),
                      //                         child: Icon(
                      //                           Icons.mail_outline,
                      //                           color: Colors.white,
                      //                           size: 25,
                      //                         ),
                      //                       ),
                      //                     ),
                      //                     Gap(10),
                      //                     MyText(
                      //                       text: "Email",
                      //                       textColor: Colors.white54,
                      //                     ),
                      //                     Gap(10),
                      //                     MyText(
                      //                       text: "hirfan0307@gmail.com",
                      //                       fontSize: 16,
                      //                       textColor: Colors.white,
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //             ),
                      //           );
                      //         }),
                      //       ),
                      //     ),
                      //
                      //     Gap(50),
                      //
                      //     // WhatsApp Container
                      //     InkWell(
                      //       highlightColor: Colors.transparent,
                      //       splashColor: Colors.transparent,
                      //       onTap: () async {
                      //         String phoneNumber = "9360673455";
                      //         final Uri whatsappUri = Uri.parse(
                      //           "https://wa.me/$phoneNumber",
                      //         ); // Opens WhatsApp chat
                      //         if (await canLaunchUrl(whatsappUri)) {
                      //           await launchUrl(
                      //             whatsappUri,
                      //             mode: LaunchMode.externalApplication,
                      //           );
                      //         } else {
                      //           print("Could not launch WhatsApp");
                      //         }
                      //       },
                      //       child: MouseRegion(
                      //         onEnter: (_) => controller.onEnter2(true),
                      //         onExit: (_) => controller.onEnter2(false),
                      //         child: Obx(() {
                      //           return AnimatedScale(
                      //             scale:
                      //                 controller.isHovered2.value ? 1.1 : 1.0,
                      //             duration: Duration(milliseconds: 200),
                      //             child: Container(
                      //               height: 45,
                      //               width: 230,
                      //               decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(18),
                      //                 color: secondaryColor.withOpacity(.9),
                      //                 boxShadow: [
                      //                   BoxShadow(
                      //                     spreadRadius: .8,
                      //                     blurRadius: 5,
                      //                     offset: Offset(-5, 5),
                      //                     color: Colors.black12,
                      //                   ),
                      //                   BoxShadow(
                      //                     spreadRadius: .8,
                      //                     blurRadius: 5,
                      //                     offset: Offset(.5, -.5),
                      //                     color: Colors.white24,
                      //                   ),
                      //                 ],
                      //               ),
                      //               child: Row(
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.center,
                      //                 children: [
                      //                   Image.asset(
                      //                     "assets/img/whatsapp.png",
                      //                     width: 25,
                      //                   ),
                      //                   Gap(20),
                      //                   MyText(
                      //                     text: "9360673455",
                      //                     fontSize: 20,
                      //                     textColor: Colors.white,
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           );
                      //         }),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 40, // space between cards horizontally
                        runSpacing: 30, // space vertically when wrapped

                        children: [
                          _buildContactCard(
                            index: 0,
                            controller: controller,
                            context,
                            icon: CupertinoIcons.mail,
                            title: "Email",
                            value: "mohammedkaif4343@gmail.com",
                            onTap: () async {
                              final Uri emailUri = Uri(
                                scheme: 'mailto',
                                path: 'mohammedkaif4343@gmail.com',
                                query:
                                    'subject=Hello&body=Hi, I would like to contact you.',
                              );
                              if (await canLaunchUrl(emailUri)) {
                                await controller.myLaunchUrl(
                                  emailUri.toString(),
                                );
                              }
                            },
                          ),
                          _buildContactCard(
                            index: 1,
                            controller: controller,
                            context,
                            icon: FontAwesomeIcons.linkedinIn,
                            title: "LinkedIn",
                            value: "Mohammed Kaif",
                            onTap: () async {
                              const url =
                                  'https://www.linkedin.com/in/mohammedkaif4343/';
                              if (await canLaunchUrl(Uri.parse(url))) {
                                await controller.myLaunchUrl(
                                  Uri.parse(url).toString(),
                                );
                              }
                            },
                          ),
                          _buildContactCard(
                            index: 2,
                            controller: controller,
                            context,
                            icon: FontAwesomeIcons.github,
                            title: "GitHub",
                            value: "Mohammedkaif02",
                            onTap: () async {
                              const url = 'https://github.com/mohammedkaif02';
                              if (await canLaunchUrl(Uri.parse(url))) {
                                await controller.myLaunchUrl(
                                  Uri.parse(url).toString(),
                                );
                              }
                            },
                          ),
                          _buildContactCard(
                            index: 3,
                            controller: controller,
                            context,
                            icon: FontAwesomeIcons.whatsapp,
                            title: "Whatsapp",
                            value: "+91 63741 85527",
                            onTap: () async {
                              const url =
                                  'https://wa.me/916374185527?text=Hi%20Mohammed!';
                              if (await canLaunchUrl(Uri.parse(url))) {
                                await controller.myLaunchUrl(
                                  Uri.parse(url).toString(),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                      Gap(100),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
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
}) {
  return MouseRegion(
    onEnter: (_) => controller.setHover(index, true),
    onExit: (_) => controller.setHover(index, false),
    child: Obx(() {
      final isHovered = controller.hoverList[index];

      return AnimatedScale(
        scale: isHovered ? 1.07 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: 330,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color:
                controller.toggle.value
                    ? Colors.white
                    : const Color(0xff1f2837),
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
                ),
                const SizedBox(height: 8),
                MyText(
                  text: value,
                  fontSize: 15,
                  textColor: Theme.of(context).colorScheme.onBackground,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    }),
  );
}
*/
