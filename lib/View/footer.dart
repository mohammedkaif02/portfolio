import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mr_portfolio/Controller/controller.dart';
import 'package:mr_portfolio/responsive.dart';

class Footer extends StatelessWidget {
  Footer({super.key});

  final ScrollControllerX controller = Get.put(ScrollControllerX());

  @override
  Widget build(BuildContext context) {
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
                  : Color(0xff1f2837),
        ),
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Developed By Mohammed Kaif",
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            Gap(20),
            Text(
              "© 2025 All Rights Reserved.",
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
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
                  : Color(0xff1f2837),
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
            Text(
              "Developed By Mohammed Kaif",
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            Gap(20),
            Text(
              "© 2025 All Rights Reserved.",
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
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
                  : Color(0xff1f2837),
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
            Text(
              "Developed By Mohammed Kaif",
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            Gap(20),
            Text(
              "© 2025 All Rights Reserved.",
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
