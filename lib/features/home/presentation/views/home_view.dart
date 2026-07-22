import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mr_portfolio/core/constants/app_dimensions.dart';
import 'package:mr_portfolio/core/constants/app_strings.dart';
import 'package:mr_portfolio/core/theme/app_colors.dart';
import 'package:mr_portfolio/core/theme/theme_color.dart';
import 'package:mr_portfolio/core/widgets/my_text.dart';
import 'package:mr_portfolio/features/home/presentation/controllers/navigation_controller.dart';
import 'package:mr_portfolio/features/home/presentation/controllers/theme_controller.dart';
import 'package:mr_portfolio/features/cv/presentation/controllers/cv_controller.dart';
import 'package:mr_portfolio/features/cv/domain/usecases/download_cv_usecase.dart';
import 'package:mr_portfolio/features/cv/data/repositories/location_repository_impl.dart';
import 'package:mr_portfolio/features/home/presentation/widgets/status_badge.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final NavigationController navigationController = Get.find();
  final ThemeController themeController = Get.find();
  final CVController cvController = Get.put(
    CVController(
      downloadCVUseCase: DownloadCVUseCase(
        locationRepository: LocationRepositoryImpl(),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    if (width < AppDimensions.breakpointMobile) {
      return _buildMobileLayout(context, width, height);
    } else if (width < AppDimensions.breakpointTablet) {
      return _buildTabletLayout(context, width, height);
    } else {
      return _buildDesktopLayout(context, width, height);
    }
  }

  BoxDecoration _backgroundDecoration(bool isLight) {
    return BoxDecoration(
      gradient:
          isLight ? AppColors.lightHeroGradient : AppColors.darkHeroGradient,
    );
  }

  Widget _buildMobileLayout(BuildContext context, double width, double height) {
    return Container(
      key: navigationController.homeKey,
      height: height,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.07,
        vertical: AppDimensions.spaceXL,
      ),
      decoration: _backgroundDecoration(themeController.toggle.value),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap(height / 6),
            _gradientText(AppStrings.name, width * 0.09),
            const Gap(AppDimensions.spaceS),
            MyText(
              text: AppStrings.roleTitle,
              textColor: Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.bold,
              fontSize: width * 0.04,
            ),
            const Gap(AppDimensions.spaceM),
            SizedBox(
              width: width * 0.8,
              child: MyText(
                text: AppStrings.tagline,
                textColor: primaryColor,
                textAlign: TextAlign.center,
                fontSize: width * 0.04,
              ),
            ),
            const Gap(AppDimensions.spaceL),
            const StatusBadge(isCompact: true),
            const Gap(AppDimensions.spaceL),
            _socialIconsRow(context, AppDimensions.iconL),
            const Gap(AppDimensions.spaceHuge),
            _buttonsRow(context),
            const Gap(AppDimensions.spaceHuge),
          ],
        ),
      ),
    );
  }

  Widget _buildTabletLayout(BuildContext context, double width, double height) {
    return Container(
      key: navigationController.homeKey,
      height: height,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      decoration: _backgroundDecoration(themeController.toggle.value),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _gradientText(AppStrings.name, 65),
            const Gap(10),
            MyText(
              text: AppStrings.roleTitle,
              textColor: Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
            const Gap(15),
            SizedBox(
              width: width * 0.6,
              child: MyText(
                text: AppStrings.tagline,
                textColor: primaryColor,
                textAlign: TextAlign.center,
                fontSize: 22,
              ),
            ),
            const Gap(20),
            const StatusBadge(),
            const Gap(30),
            _socialIconsRow(context, 26),
            const Gap(40),
            _buttonsRow(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(
    BuildContext context,
    double width,
    double height,
  ) {
    return Container(
      key: navigationController.homeKey,
      height: height,
      width: double.infinity,
      decoration: _backgroundDecoration(themeController.toggle.value),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _gradientText(AppStrings.name, 100),
                    const Gap(8),
                    MyText(
                      text: AppStrings.roleTitle,
                      textColor: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                    const Gap(10),
                    SizedBox(
                      width: width * 0.47,
                      child: MyText(
                        text: AppStrings.tagline,
                        textColor: primaryColor,
                        textAlign: TextAlign.center,
                        fontSize: 30,
                      ),
                    ),
                    const Gap(20),
                    const StatusBadge(),
                    const Gap(30),
                    _socialIconsRow(context, 28),
                    const Gap(40),
                    _buttonsRow(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _gradientText(String text, double size) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback:
          (bounds) => const LinearGradient(
            colors: [
              Color(0xff7037d8),
              Color(0xff7241ea),
              Color(0xff793eea),
              Color(0xff8334e2),
              Color(0xff9233ea),
            ],
          ).createShader(const Rect.fromLTWH(0, 0, 400, 100)),
      child: MyText(
        text: text,
        fontSize: size,
        fontWeight: FontWeight.bold,
        textColor: Colors.white,
      ),
    );
  }

  Widget _socialIconsRow(BuildContext context, double iconSize) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 30,
      runSpacing: 20,
      children: [
        _hoverableIcon(
          context,
          icon: Icons.mail_outline_rounded,
          hoverValue: navigationController.isHoveringMail,
          onTap: () async {
            final Uri emailUri = Uri(
              scheme: 'mailto',
              path: AppStrings.personalEmail,
              query: 'subject=Hello Mohammed&body=Hi, I’d like to connect!',
            );
            await navigationController.myLaunchUrl(emailUri.toString());
          },
        ),
        _hoverableIcon(
          context,
          icon: FontAwesomeIcons.linkedinIn,
          hoverValue: navigationController.isHoveringLinkedIn,
          onTap: () => navigationController.myLaunchUrl(AppStrings.linkedInUrl),
        ),
        _hoverableIcon(
          context,
          icon: FontAwesomeIcons.github,
          hoverValue: navigationController.isHoveringGithub,
          onTap: () => navigationController.myLaunchUrl(AppStrings.gitHubUrl),
        ),
        _hoverableIcon(
          context,
          icon: FontAwesomeIcons.whatsapp,
          hoverValue: navigationController.isHoveringWhatsapp,
          onTap: () => navigationController.myLaunchUrl(AppStrings.whatsAppUrl),
        ),
      ],
    );
  }

  Widget _hoverableIcon(
    BuildContext context, {
    required IconData icon,
    required RxBool hoverValue,
    required VoidCallback onTap,
  }) {
    return MouseRegion(
      onEnter: (_) => hoverValue.value = true,
      onExit: (_) => hoverValue.value = false,
      child: Obx(
        () => AnimatedScale(
          scale: hoverValue.value ? 1.15 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow:
                  hoverValue.value
                      ? [
                        BoxShadow(
                          color: primaryColor.withValues(alpha: 0.4),
                          blurRadius: 15,
                          spreadRadius: 2,
                        ),
                      ]
                      : [],
            ),
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: onTap,
              child: buildIconContainer(
                context,
                themeController.toggle.value,
                hoverValue.value,
                icon,
                20,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonsRow(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 40,
      runSpacing: 20,
      children: [
        _hoverableButton(
          text: AppStrings.btnConnect,
          bgColor: primaryColor,
          textColor: Colors.white,
          hoverValue: navigationController.isHoveringConnect,
          onTap:
              () => navigationController.scrollToSection(
                navigationController.contactKey,
                "Contact",
              ),
        ),
        _hoverableButton(
          text: AppStrings.btnDownloadCV,
          bgColor: Colors.transparent,
          textColor: primaryColor,
          hoverValue: cvController.isHoveringDownload,
          onTap: cvController.downloadCV,
          border: Border.all(color: primaryColor, width: 1.5),
        ),
      ],
    );
  }

  Widget _hoverableButton({
    required String text,
    required Color bgColor,
    required Color textColor,
    required RxBool hoverValue,
    required VoidCallback onTap,
    Border? border,
  }) {
    return MouseRegion(
      onEnter: (_) => hoverValue.value = true,
      onExit: (_) => hoverValue.value = false,
      child: Obx(
        () => AnimatedScale(
          scale: hoverValue.value ? 1.08 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
            decoration: BoxDecoration(
              color: bgColor,
              border: border,
              borderRadius: BorderRadius.circular(8),
              boxShadow:
                  hoverValue.value
                      ? [
                        BoxShadow(
                          color: primaryColor.withValues(alpha: 0.5),
                          blurRadius: 12,
                          spreadRadius: 2,
                        ),
                      ]
                      : [],
            ),
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: onTap,
              child: MyText(text: text, textColor: textColor),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildIconContainer(
  BuildContext context,
  bool isLight,
  bool isHovered,
  IconData icon,
  double size,
) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11.5),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: isLight ? const Color(0xfffbf8ff) : const Color(0xff1f2937),
      boxShadow: [
        BoxShadow(
          color:
              isHovered
                  ? primaryColor.withValues(alpha: 0.6)
                  : (isLight
                      ? Colors.grey.withValues(alpha: 0.6)
                      : Colors.black54.withValues(alpha: 0.6)),
          blurRadius: 12,
          spreadRadius: 1,
        ),
      ],
    ),
    child: Icon(icon, color: Theme.of(context).colorScheme.onPrimaryContainer),
  );
}
