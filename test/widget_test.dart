import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/di/app_binding.dart';
import 'package:portfolio/main.dart';

void main() {
  testWidgets('Portfolio app bootstrap smoke test', (
    WidgetTester tester,
  ) async {
    // Set a desktop viewport size so all responsive components lay out smoothly
    tester.view.physicalSize = const Size(1440, 1024);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    // Initialize clean dependency injection
    Get.reset();
    AppBinding().dependencies();

    // Pump MyApp
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    // Verify main brand name is present
    expect(find.text("Mohammed Kaif"), findsWidgets);

    // Verify navigation elements exist
    expect(find.text("Home"), findsWidgets);
    expect(find.text("About"), findsWidgets);
    expect(find.text("Projects"), findsWidgets);
  });
}
