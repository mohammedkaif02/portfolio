import 'dart:async';
import 'dart:convert';
import 'dart:html' as html;

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class ScrollControllerX extends GetxController
    with GetTickerProviderStateMixin {
  RxList<RxBool> isHoveredList = List
      .generate(4, (_) => false.obs)
      .obs;

  void onEnterCard(int index, bool hover) {
    isHoveredList[index].value = hover;
  }

  RxList<bool> hoverList = List
      .generate(4, (_) => false)
      .obs;

  void setHover(int index, bool value) {
    hoverList[index] = value;
    update();
  }

  Future<void> myLaunchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  //=========================================================
  final ScrollController scrollController = ScrollController();

  RxString selectedNavItem = "Home".obs;
  RxString hoverNavItem = "".obs;
  RxBool toggle = false.obs;

  void toggleTheme() {
    toggle.value = !toggle.value;
    Get.changeThemeMode(toggle.value ? ThemeMode.light : ThemeMode.dark);
  }

  // Define Global Keys for sections
  GlobalKey homeKey = GlobalKey();
  GlobalKey aboutUsKey = GlobalKey();
  GlobalKey whatIDoKey = GlobalKey();
  GlobalKey projectKey = GlobalKey();
  GlobalKey contactKey = GlobalKey();

  late List<AnimationController> controllers;
  late List<Animation<double>> animations;
  var statuses = <int, AnimationStatus>{}.obs;
  RxBool isButtonVisible = false.obs;
  late List<AnimationController> zoomControllers;
  late List<Animation<double>> zoomAnimations;
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
  RxBool isInitialized = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.offset > 100) {
        isButtonVisible.value = true;
      } else {
        isButtonVisible.value = false;
      }
    });

    scrollController.addListener(_onScroll);
    int itemCount = 6;

    controllers = List.generate(
      itemCount,
          (index) =>
          AnimationController(
            vsync: this,
            duration: const Duration(seconds: 1),
          ),
    );

    animations = List.generate(itemCount, (index) {
      var animation =
      Tween(begin: 0.0, end: 1.0).animate(controllers[index])
        ..addListener(() {
          update();
        })
        ..addStatusListener((status) {
          statuses[index] = status;
        });
      statuses[index] = AnimationStatus.dismissed;
      return animation;
    });

    //=======================zoom effect
    zoomControllers = List.generate(
      6,
          (index) =>
          AnimationController(
            duration: const Duration(milliseconds: 200),
            vsync: this,
          ),
    );

    zoomAnimations =
        zoomControllers
            .map(
              (controller) =>
              Tween<double>(begin: 1.0, end: 1.1).animate(
                CurvedAnimation(parent: controller, curve: Curves.easeInOut),
              ),
        )
            .toList();

    //================video play
  } //onInit End

  void _onScroll() {
    double offset = scrollController.offset;

    if (_isInView(homeKey)) {
      selectedNavItem.value = "Home";
    } else if (_isInView(aboutUsKey)) {
      selectedNavItem.value = "About";
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

    double position = renderBox
        .localToGlobal(Offset.zero)
        .dy;
    return position >= 0 && position < 200;
  }

  void scrollToSection(GlobalKey key, String section) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
      selectedNavItem.value = section;
    }
  }

  //=====================================
  void zoomIn(int index) {
    zoomControllers[index].forward();
  }

  void zoomOut(int index) {
    zoomControllers[index].reverse();
  }

  //===================================

  var isHovered = false.obs;

  void onEnter(bool hover) => isHovered.value = hover;

  //==========================
  var isHovered2 = false.obs;

  void onEnter2(bool hover) => isHovered2.value = hover;
  var isMailHovered = false.obs;

  void onMailEnter(bool hover) => isMailHovered.value = hover;

  var isGithubHovered = false.obs;

  void onGithubEnter(bool hover) => isGithubHovered.value = hover;

  var isLinkedInHovered = false.obs;

  void onLinkedInEnter(bool hover) => isLinkedInHovered.value = hover;

  var isWhatsappHovered = false.obs;

  void onWhatsappEnter(bool hover) => isWhatsappHovered.value = hover;

  //==========================
  var isHoveredScrollTop = false.obs;

  void onEnterScrollTop(bool hover) => isHoveredScrollTop.value = hover;

  //=================flip==========
  void toggleAnimation(int index, {required bool forward}) {
    if (forward) {
      controllers[index].forward();
    } else {
      controllers[index].reverse();
    }
  }

  void toggleAnimation1(int index) {
    if (controllers[index].isCompleted) {
      controllers[index].reverse();
    } else {
      controllers[index].forward();
    }
    update();
  }

  @override
  void onClose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var controller in zoomControllers) {
      controller.dispose();
    }
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.onClose();
  }

  //=====================CV download function==========

  Future<String?> getCountryFromIP() async {
    try {
      final response = await http.get(Uri.parse('http://ip-api.com/json/'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['country']; // e.g., "India"
      }
    } catch (e) {
      print('Failed to fetch country: $e');
    }
    return null;
  }


  Future<void> downloadCV() async {
    try {
      final response = await http.get(Uri.parse('https://ipapi.co/json/'));
      String country = 'Unknown';
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        country = data['country_name'] ?? 'Unknown';
        print("Country=====$country");
      }

      String pdfPath =
      country == "India"
          ? "assets/pdf/My_CV_1.pdf"
          : "assets/pdf/My_CV_1.pdf";

      ByteData data = await rootBundle.load(pdfPath);
      Uint8List bytes = data.buffer.asUint8List();

      final blob = html.Blob([bytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor =
      html.AnchorElement(href: url)
        ..setAttribute("download", pdfPath
            .split('/')
            .last)
        ..click();
      html.Url.revokeObjectUrl(url);
    } catch (e) {}
  }

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 700),
      curve: Curves.easeInOut,
    );
  }

  //=====================glow effect====================
  RxBool isHoveringConnect = false.obs;
  RxBool isHoveringMail = false.obs;
  RxBool isHoveringGithub = false.obs;
  RxBool isHoveringLinkedIn = false.obs;
  RxBool isHoveringWhatsapp = false.obs;
  RxBool isHoveringDownload = false.obs;


  List<ProjectItem> projectList = [
    ProjectItem(
      image: "assets/Project_Image/restasmart_application.png",
      heading: "Restaurant Management",
      description:
      "A Restaurant Management System with POS and User Reporting is a robust solution designed to streamline restaurant operations, enhance customer service, and optimize sales tracking. The system integrates a Point of Sale (POS) module for order processing, billing, and inventory management, ensuring seamless transactions across multiple devices like tablets, Android, Windows, and web platforms. It includes user reporting features that provide insights into staff performance, sales trends, customer preferences, and financial summaries. Managers can generate detailed reports on daily sales, expenses, stock usage, and employee activities, helping them make data-driven decisions. With role-based access, restaurant owners, cashiers, and waiters can efficiently manage operations, improving efficiency and profitability.",
      technologies: [
        "Flutter",
        "Dart",
        "Node.js",
        "JavaScript",
        "Firebase",
        "Google Cloud",
        "PostgreSQL",
        "GitLab",
      ],
    ),
    ProjectItem(
      image: "assets/Project_Image/inventory.png",
      heading: "Inventory Management",
      description:
      "The Inventory Management System is a centralized solution designed to efficiently manage stock levels, product data, and material movements across various departments. It helps businesses maintain accurate inventory records, automate stock adjustments, and ensure timely replenishment through real-time tracking.The system includes key modules such as Item Management, Group Item Classification, Material Requests, Price Lists, Stock Adjustments, and Delivery Management, all working together to provide a complete inventory workflow. It supports dynamic data synchronization with cloud databases and ensures that updates in stock quantities, pricing, and transactions reflect instantly across the platform.Built to handle both mobile and web interfaces, the system offers a user-friendly dashboard for monitoring inventory performance, reducing manual errors, and improving operational efficiency.",
      technologies: [
        "Flutter",
        "Dart",
        "Getx",
        "Node.js",
        "JavaScript",
        "Firebase",
        "PostgreSQL",
        "GitLab",
      ],
    ),

    ProjectItem(
      heading: "RestaSmart website",
      image: "assets/Project_Image/restasmart_website.png",
      description:
      "RestaSmart is a restaurant management application that simplifies operations. It offers features like POS, inventory management, employee scheduling, and CRM. The platform enhances efficiency, reduces complexities, and boosts productivity. Businesses can request a demo on the official website to explore its functionalities. RestaSmart provides flexible pricing based on business size and needs. Specific pricing details are available upon request. The application improves resource management and customer satisfaction. It helps restaurant owners streamline daily tasks effectively. RestaSmart supports business growth and increased profitability. It’s a powerful tool for modern restaurant management.",
      technologies: [
        "Flutter",
        "Dart",
        "Node.js",
        "JavaScript",
        "Firebase",
        "Google Cloud",
        "PostgreSQL",
        "GitLab",
      ],
    ),
    ProjectItem(
      image: "assets/Project_Image/kars_admin.png",
      heading: "KARS Admin",

      description:
      "An Organization Management System for a Training Institute like the Kuwait Amateurs Radio Society is designed to efficiently manage training programs, trainers, memberships, and payments. The system allows trainers to register, enroll in courses, track their progress, and complete training before becoming eligible for membership. It also includes membership management features, enabling members to apply, renew, and make payments online. Automated reports provide insights into training completion rates, membership status, payment history, and engagement levels. With role-based access for administrators, trainers, and members, the system enhances transparency, streamlines operations, and ensures a smooth training-to-membership transition.",
      technologies: [
        "Flutter",
        "Dart",
        "Node.js",
        "JavaScript",
        "Firebase",
        "Google Cloud",
        "PostgreSQL",
        "GitLab",
      ],
    ),
    ProjectItem(
      heading: "KARS Websites",
      image: "assets/Project_Image/kars_website.png",
      description:
      "The Kuwait Amateur Radio Society (KARS), founded in 1979, promotes amateur radio activities in Kuwait. It offers training courses for licensing exams and organizes local and international competitions. The society’s website provides training registration, news, events, and member details. KARS is affiliated with the International Amateur Radio Union (IARU) and issues special call signs for national events. Membership categories include active, ordinary, and honorary members. The headquarters feature advanced radio equipment, a library, and a postal office. KARS engages in community outreach to promote amateur radio. It collaborates with global radio societies to enhance knowledge-sharing. The society actively participates in national celebrations. KARS plays a crucial role in sustaining Kuwait’s amateur radio culture.",
      technologies: [
        "Flutter",
        "Dart",
        "Node.js",
        "JavaScript",
        "Firebase",
        "Google Cloud",
        "PostgreSQL",
        "GitLab",
      ],
    ),
    ProjectItem(
      heading: "Ummati",
      image: "assets/Project_Image/ummati.png",
      description:
      "The Ummati App is a feature-rich Islamic lifestyle application designed to support the spiritual and daily needs of the Muslim community. It offers essential tools such as an Imaan Tracker, accurate prayer timings, and a Qibla Finder—especially useful when traveling. Users can also locate nearby masjids with ease, view real-time weather conditions along with the Hijri date, and access a user-friendly Quran reader and a wide collection of Hadiths. With its intuitive design and practical features, the app serves as a valuable companion for Muslims around the world.",
      technologies: [
        "Flutter",
        "Dart",
        "Node.js",
        "JavaScript",
        "Firebase",
        "Google Cloud",
        "PostgreSQL",
        "GitLab",
      ],
    ),

    // Add more items...
  ];
}


class ProjectItem {
  final String image;
  final String heading;
  final String description;
  final List<String> technologies;

  ProjectItem({
    required this.image,
    required this.heading,
    required this.description,
    required this.technologies,
  });
}
