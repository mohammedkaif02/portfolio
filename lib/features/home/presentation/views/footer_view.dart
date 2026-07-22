import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mr_portfolio/core/constants/app_dimensions.dart';
import 'package:mr_portfolio/core/constants/app_strings.dart';
import 'package:mr_portfolio/core/theme/app_colors.dart';
import 'package:mr_portfolio/core/widgets/responsive.dart';
import 'package:mr_portfolio/features/home/presentation/controllers/theme_controller.dart';

class Footer extends StatelessWidget {
  Footer({super.key});

  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppDimensions.radiusM),
            topRight: Radius.circular(AppDimensions.radiusM),
          ),
          color:
              themeController.toggle.value == true
                  ? AppColors.lightBackground
                  : AppColors.darkBackground,
        ),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Developed By ${AppStrings.name}",
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: AppDimensions.fontBodyM,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(20),
            Text(
              AppStrings.footerCopyright,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: AppDimensions.fontBodyM,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      tablet: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppDimensions.radiusM),
            topRight: Radius.circular(AppDimensions.radiusM),
          ),
          color:
              themeController.toggle.value == true
                  ? AppColors.lightBackground
                  : AppColors.darkBackground,
          boxShadow: const [
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
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Developed By ${AppStrings.name}",
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: AppDimensions.fontBodyM,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(20),
            Text(
              AppStrings.footerCopyright,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: AppDimensions.fontBodyM,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      desktop: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppDimensions.radiusM),
            topRight: Radius.circular(AppDimensions.radiusM),
          ),
          color:
              themeController.toggle.value == true
                  ? AppColors.lightBackground
                  : AppColors.darkBackground,
          boxShadow: const [
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
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Developed By ${AppStrings.name}",
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: AppDimensions.fontBodyM,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(20),
            Text(
              AppStrings.footerCopyright,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: AppDimensions.fontBodyM,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
