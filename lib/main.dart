import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/di/app_binding.dart';
import 'package:portfolio/core/theme/my_theme_colors.dart';
import 'package:portfolio/features/home/presentation/controllers/theme_controller.dart';
import 'package:portfolio/features/home/presentation/views/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Obx(
      () => GetMaterialApp(
        title: "Mohammed Kaif | Flutter Developer",
        initialBinding: AppBinding(),
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
        ),
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode:
            themeController.toggle.value ? ThemeMode.light : ThemeMode.dark,
        home: HomeScreen(),
      ),
    );
  }
}
