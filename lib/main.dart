import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_portfolio/Controller/controller.dart';
import 'package:mr_portfolio/View/home_screen.dart';
import 'package:mr_portfolio/widgets/my_theme_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ScrollControllerX());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ScrollControllerX>();

    return Obx(
      () => GetMaterialApp(
        title: "Mohammed Kaif",
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
        ),
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: controller.toggle.value ? ThemeMode.light : ThemeMode.dark,
        home: HomeScreen(),
      ),
    );
  }
}
