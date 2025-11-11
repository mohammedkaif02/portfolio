import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mr_portfolio/Controller/controller.dart';
import 'package:mr_portfolio/responsive.dart';
import 'package:mr_portfolio/themeColor.dart';

class Footer extends StatelessWidget {
  Footer({super.key});

  final ScrollControllerX controller = Get.put(ScrollControllerX());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Responsive(
      mobile: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
          ),
          color:
              controller.toggle.value == true
                  ? Colors.white
                  : Color(0xffff1f2837),
          // boxShadow: [
          //   BoxShadow(
          //     spreadRadius: .8,
          //     blurRadius: 5,
          //     offset: Offset(-5, 5),
          //     color: Colors.black12,
          //   ),
          //   BoxShadow(
          //     spreadRadius: .8,
          //     blurRadius: 5,
          //     offset: Offset(.5, -.5),
          //     color: Colors.white24,
          //   ),
          // ],
        ),
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // // Navigation Links
            // Wrap(
            //   alignment: WrapAlignment.center,
            //   spacing: 30,
            //   children: [
            //     _footerNavItem(
            //       "Home",
            //       () => controller.scrollToSection(controller.homeKey, "Home"),
            //     ),
            //     _footerNavItem(
            //       "About",
            //       () => controller.scrollToSection(
            //         controller.aboutUsKey,
            //         "About",
            //       ),
            //     ),
            //     _footerNavItem(
            //       "My Skills",
            //       () => controller.scrollToSection(
            //         controller.whatIDoKey,
            //         "My Skills",
            //       ),
            //     ),
            //     _footerNavItem(
            //       "Projects",
            //       () => controller.scrollToSection(
            //         controller.projectKey,
            //         "Projects",
            //       ),
            //     ),
            //     _footerNavItem(
            //       "Contact",
            //       () => controller.scrollToSection(
            //         controller.contactKey,
            //         "Contact",
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(height: 20),
            //
            // // Social Media Icons
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     _socialIcon(FontAwesomeIcons.linkedin, () {
            //       controller.launchURL("https://linkedin.com/");
            //     }, "LinkedIn"),
            //     _socialIcon(FontAwesomeIcons.github, () {
            //       controller.launchURL("https://github.com/");
            //     }, "GitHub"),
            //   ],
            // ),
            // SizedBox(height: 20),

            // Copyright Text
            Text(
              "Developed By Mohammed Kaif",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            Gap(20),
            Text(
              "© 2025 All Rights Reserved.",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      tablet: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
          ),
          color:
              controller.toggle.value == true
                  ? Colors.white
                  : Color(0xffff1f2837),
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
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // // Navigation Links
            // Wrap(
            //   alignment: WrapAlignment.center,
            //   spacing: 30,
            //   children: [
            //     _footerNavItem(
            //       "Home",
            //       () => controller.scrollToSection(controller.homeKey, "Home"),
            //     ),
            //     _footerNavItem(
            //       "About",
            //       () => controller.scrollToSection(
            //         controller.aboutUsKey,
            //         "About",
            //       ),
            //     ),
            //     _footerNavItem(
            //       "My Skills",
            //       () => controller.scrollToSection(
            //         controller.whatIDoKey,
            //         "My Skills",
            //       ),
            //     ),
            //     _footerNavItem(
            //       "Projects",
            //       () => controller.scrollToSection(
            //         controller.projectKey,
            //         "Projects",
            //       ),
            //     ),
            //     _footerNavItem(
            //       "Contact",
            //       () => controller.scrollToSection(
            //         controller.contactKey,
            //         "Contact",
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(height: 20),
            //
            // // Social Media Icons
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     _socialIcon(FontAwesomeIcons.linkedin, () {
            //       controller.launchURL("https://linkedin.com/");
            //     }, "LinkedIn"),
            //     _socialIcon(FontAwesomeIcons.github, () {
            //       controller.launchURL("https://github.com/");
            //     }, "GitHub"),
            //   ],
            // ),
            // SizedBox(height: 20),

            // Copyright Text
            Text(
              "Developed By Mohammed Kaif",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            Gap(20),
            Text(
              "© 2025 All Rights Reserved.",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      desktop: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
          ),
          color:
              controller.toggle.value == true
                  ? Colors.white
                  : Color(0xffff1f2837),
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
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // // Navigation Links
            // Wrap(
            //   alignment: WrapAlignment.center,
            //   spacing: 30,
            //   children: [
            //     _footerNavItem(
            //       "Home",
            //       () => controller.scrollToSection(controller.homeKey, "Home"),
            //     ),
            //     _footerNavItem(
            //       "About",
            //       () => controller.scrollToSection(
            //         controller.aboutUsKey,
            //         "About",
            //       ),
            //     ),
            //     _footerNavItem(
            //       "My Skills",
            //       () => controller.scrollToSection(
            //         controller.whatIDoKey,
            //         "My Skills",
            //       ),
            //     ),
            //     _footerNavItem(
            //       "Projects",
            //       () => controller.scrollToSection(
            //         controller.projectKey,
            //         "Projects",
            //       ),
            //     ),
            //     _footerNavItem(
            //       "Contact",
            //       () => controller.scrollToSection(
            //         controller.contactKey,
            //         "Contact",
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(height: 20),
            //
            // // Social Media Icons
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     _socialIcon(FontAwesomeIcons.linkedin, () {
            //       controller.launchURL("https://linkedin.com/");
            //     }, "LinkedIn"),
            //     _socialIcon(FontAwesomeIcons.github, () {
            //       controller.launchURL("https://github.com/");
            //     }, "GitHub"),
            //   ],
            // ),
            // SizedBox(height: 20),

            // Copyright Text
            Text(
              "Developed By Mohammed Kaif",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            Gap(20),
            Text(
              "© 2025 All Rights Reserved.",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _footerNavItem(String title, VoidCallback onTap) {
    final controller = Get.put(ScrollControllerX());
    return Obx(() {
      bool isSelected = controller.selectedNavItem.value == title;
      bool isHovered = controller.hoverNavItem.value == title;

      return MouseRegion(
        onEnter: (_) => controller.hoverNavItem.value = title,
        onExit: (_) => controller.hoverNavItem.value = "",
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: onTap,
          child: AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 300),
            style: TextStyle(
              fontSize: 20,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color:
                  isSelected
                      ? primaryColor
                      : isHovered
                      ? primaryColor.withOpacity(0.7)
                      : Colors.white54,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(title),
            ),
          ),
        ),
      );
    });
  }

  Widget _socialIcon(IconData icon, VoidCallback onTap, String tooltip) {
    RxBool isHovered = false.obs;

    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: Obx(
        () => IconButton(
          icon: Icon(
            icon,
            size: 30,
            color: isHovered.value ? primaryColor : Colors.white54,
          ),
          onPressed: onTap,
          tooltip: tooltip,
        ),
      ),
    );
  }
}
