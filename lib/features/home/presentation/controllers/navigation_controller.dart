import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationController extends GetxController {
  final ScrollController scrollController = ScrollController();
  
  RxString selectedNavItem = "Home".obs;
  RxString hoverNavItem = "".obs;
  RxBool isButtonVisible = false.obs;

  // Global Keys for Sections
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey aboutUsKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey whatIDoKey = GlobalKey();
  final GlobalKey projectKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  // Social Hover States
  RxList<RxBool> isHoveredList = List.generate(4, (_) => false.obs).obs;
  RxList<bool> hoverList = List.generate(4, (_) => false).obs;

  RxBool isHovered = false.obs;
  RxBool isHovered2 = false.obs;
  RxBool isMailHovered = false.obs;
  RxBool isGithubHovered = false.obs;
  RxBool isLinkedInHovered = false.obs;
  RxBool isWhatsappHovered = false.obs;
  RxBool isHoveredScrollTop = false.obs;

  // Glow Effect/Social Hover States
  RxBool isHoveringConnect = false.obs;
  RxBool isHoveringMail = false.obs;
  RxBool isHoveringGithub = false.obs;
  RxBool isHoveringLinkedIn = false.obs;
  RxBool isHoveringWhatsapp = false.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      isButtonVisible.value = scrollController.offset > 100;
    });
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isInView(homeKey)) {
      selectedNavItem.value = "Home";
    } else if (_isInView(aboutUsKey)) {
      selectedNavItem.value = "About";
    } else if (_isInView(experienceKey)) {
      selectedNavItem.value = "Experience";
    } else if (_isInView(whatIDoKey)) {
      selectedNavItem.value = "Skills";
    } else if (_isInView(projectKey)) {
      selectedNavItem.value = "Projects";
    } else if (_isInView(contactKey)) {
      selectedNavItem.value = "Contact";
    }
  }

  bool _isInView(GlobalKey key) {
    final RenderBox? renderBox =
        key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return false;

    double position = renderBox.localToGlobal(Offset.zero).dy;
    return position >= 0 && position < 200;
  }

  void scrollToSection(GlobalKey key, String section) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
      selectedNavItem.value = section;
    }
  }

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
    );
  }

  void onEnterCard(int index, bool hover) {
    if (index < isHoveredList.length) {
      isHoveredList[index].value = hover;
    }
  }

  void onEnter(bool hover) => isHovered.value = hover;
  
  void setHover(int index, bool value) {
    if (index < hoverList.length) {
      hoverList[index] = value;
      update();
    }
  }
  void onEnter2(bool hover) => isHovered2.value = hover;
  void onMailEnter(bool hover) => isMailHovered.value = hover;
  void onGithubEnter(bool hover) => isGithubHovered.value = hover;
  void onLinkedInEnter(bool hover) => isLinkedInHovered.value = hover;
  void onWhatsappEnter(bool hover) => isWhatsappHovered.value = hover;
  void onEnterScrollTop(bool hover) => isHoveredScrollTop.value = hover;

  Future<void> myLaunchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
