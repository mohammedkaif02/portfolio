import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  // Determine device type based on width
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 767;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 767 &&
          MediaQuery.of(context).size.width <= 1024;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 1024;


  // Get the aspect ratio
  static double getAspectRatio(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.width / size.height;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double aspectRatio = getAspectRatio(context);

    debugPrint('Width: ${size.width}, Height: ${size.height}, Aspect Ratio: $aspectRatio');

    if (isDesktop(context)) {
      return desktop;
    } else if (isTablet(context)) {
      return tablet;
    } else {
      return mobile;
    }
  }
}
