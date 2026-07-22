import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  RxBool toggle = false.obs;

  void toggleTheme() {
    toggle.value = !toggle.value;
    Get.changeThemeMode(toggle.value ? ThemeMode.light : ThemeMode.dark);
  }
}
