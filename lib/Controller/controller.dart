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
  // Track hover for multiple cards
  RxList<RxBool> isHoveredList = List.generate(4, (_) => false.obs).obs;

  void onEnterCard(int index, bool hover) {
    isHoveredList[index].value = hover;
  }

  RxList<bool> hoverList = List.generate(4, (_) => false).obs;

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
  RxBool toggle = true.obs;

  void toggleTheme() {
    toggle.value = !toggle.value;

    if (toggle.value) {
      Get.changeThemeMode(ThemeMode.light);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
    }
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
    int itemCount = 6; // Adjust based on your Grid item count

    controllers = List.generate(
      itemCount,
      (index) => AnimationController(
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
              statuses[index] = status; // Store animation status for this index
            });
      statuses[index] = AnimationStatus.dismissed; // Initialize status
      return animation;
    });

    //=======================zoom effect
    zoomControllers = List.generate(
      6,
      (index) => AnimationController(
        duration: const Duration(milliseconds: 200),
        vsync: this,
      ),
    );

    zoomAnimations =
        zoomControllers
            .map(
              (controller) => Tween<double>(begin: 1.0, end: 1.1).animate(
                CurvedAnimation(parent: controller, curve: Curves.easeInOut),
              ),
            )
            .toList();

    //================video play
    videoPlayerController = VideoPlayerController.asset(
      "assets/videos/bg_video.mp4",
    );
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      // aspectRatio: 10 / 10,
      autoPlay: true,
      maxScale: 5,
      looping: true,
      autoInitialize: true,
      showControls: false,
    );
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

    double position = renderBox.localToGlobal(Offset.zero).dy;
    return position >= 0 && position < 200; // Adjust threshold as needed
  }

  void scrollToSection(GlobalKey key, String section) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
      selectedNavItem.value = section; // Update the selected nav item
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

  /*Future<void> downloadCV() async {
    try {
      // Load PDF file from assets
      ByteData data = await rootBundle.load("assets/pdf/Hirufan_CV.pdf");
      Uint8List bytes = data.buffer.asUint8List();

      // Convert to Blob
      final blob = html.Blob([bytes]);

      // Create object URL for the file
      final url = html.Url.createObjectUrlFromBlob(blob);

      // Create a hidden anchor element
      final anchor = html.AnchorElement(href: url)
        ..setAttribute("download", "Hirufan_CV.pdf")
        ..click(); // Auto-click to trigger download

      // Release the object URL after the download
      html.Url.revokeObjectUrl(url);
    } catch (e) {
      Get.snackbar("Error", "Failed to download CV: $e");
    }
  }*/

  Future<void> downloadCV() async {
    try {
      // Step 1: Detect user country using IP geolocation API
      final response = await http.get(Uri.parse('https://ipapi.co/json/'));
      String country = 'Unknown';
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        country = data['country_name'] ?? 'Unknown';
        print("Country=====$country");
      }

      // Step 2: Decide which PDF to load
      String pdfPath =
          country == "India"
              ? "assets/pdf/My_CV_1.pdf"
              : "assets/pdf/My_CV_1.pdf";

      // Step 3: Load selected PDF from assets
      ByteData data = await rootBundle.load(pdfPath);
      Uint8List bytes = data.buffer.asUint8List();

      // Step 4: Convert to Blob and download
      final blob = html.Blob([bytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor =
          html.AnchorElement(href: url)
            ..setAttribute("download", pdfPath.split('/').last)
            ..click();
      html.Url.revokeObjectUrl(url);
    } catch (e) {
      // Get.snackbar("Error", "Failed to download CV: $e");
    }
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

  //====================================================

  List<SkillList> skillsList = [
    SkillList(
      heading: "Dart",
      image: "assets/img/dart.png",
      paragraph:
          "Dart is a powerful, modern programming language optimized for building fast and scalable applications. Developed by Google, it is the primary language for Flutter, enabling seamless cross-platform app development. Dart features a clean syntax, sound null safety, and strong typing, making it both efficient and easy to learn. With its Just-In-Time (JIT) and Ahead-Of-Time (AOT) compilation, Dart ensures smooth development and high-performance execution. Its asynchronous programming capabilities simplify handling complex tasks like network requests and database operations. The Dart ecosystem includes a rich set of libraries and tools, enhancing productivity. Whether for mobile, web, or backend development, Dart is a versatile choice for developers.",
    ),
    SkillList(
      heading: "Flutter",
      image: "assets/img/flutter.png",
      paragraph:
          "Flutter is an open-source UI toolkit by Google for building natively compiled applications across mobile, web, and desktop from a single codebase. It uses the Dart programming language and features a rich set of customizable widgets for stunning UI designs. With its hot reload feature, developers can see real-time changes instantly, boosting productivity. Flutter ensures smooth performance with its Skia-rendered graphics and hardware acceleration. It supports cross-platform development without compromising on native performance. The strong community and extensive plugin ecosystem make Flutter a powerful choice for modern app development. From startups to enterprises, Flutter is transforming the way apps are built.",
    ),
    SkillList(
      heading: "Getx",
      image: "assets/img/getx.png",
      paragraph:
          "GetX is a lightweight and powerful state management solution for Flutter, known for its simplicity and high performance. It provides an intuitive way to manage state, dependencies, and routing with minimal boilerplate code. GetX enhances app performance by using reactive programming, ensuring efficient UI updates. It also includes built-in utilities for navigation, API handling, and local storage, reducing the need for external packages. With its easy-to-use syntax, GetX accelerates development while maintaining clean and maintainable code. The package follows a micro-framework approach, making it scalable for both small and large applications. Overall, GetX is a go-to choice for Flutter developers seeking speed, efficiency, and flexibility.",
    ),
    SkillList(
      heading: "REST API",
      image: "assets/img/rest_api.png",
      paragraph:
          "REST API (Representational State Transfer) is a widely used architecture for building web services that enable seamless communication between client and server. It follows a stateless, client-server model, ensuring scalability and flexibility in application development. REST APIs use standard HTTP methods like GET, POST, PUT, and DELETE to perform operations on resources. They exchange data in lightweight formats such as JSON or XML, making them efficient and easy to integrate. With proper authentication and security mechanisms, REST APIs ensure safe data transfer. They are widely used in mobile, web, and cloud applications for real-time data access. RESTful services enhance interoperability, allowing different systems to communicate effortlessly.",
    ),
    SkillList(
      heading: "FireBase",
      image: "assets/img/firebase.png",
      paragraph:
          "Firebase is a powerful backend-as-a-service (BaaS) platform by Google, designed to help developers build and scale applications effortlessly. It offers real-time databases, cloud storage, authentication, and hosting services, making backend management seamless. With Firebase Authentication, developers can integrate secure login methods like email, Google, and social logins. Firestore and Realtime Database provide scalable and efficient data storage with real-time syncing. Firebase Cloud Messaging (FCM) enables push notifications to engage users effectively. Its built-in analytics and crash reporting tools help optimize app performance. Whether for mobile or web, Firebase simplifies backend operations, allowing developers to focus on creating great user experiences.",
    ),
    SkillList(
      heading: "Figma",
      image: "assets/img/figma.png",
      paragraph:
          "Figma is a powerful cloud-based design tool widely used for UI/UX design and prototyping. It allows designers to create interactive and collaborative designs in real time. With its intuitive interface and robust features, Figma streamlines the design process for web and mobile applications. Components, auto-layout, and plugins enhance efficiency and maintain design consistency. Being web-based, it enables seamless teamwork without the need for installations. Figma’s version control ensures easy tracking of design changes. Its flexibility makes it an essential tool for designers, developers, and teams working on modern digital products.",
    ),
  ];

  List<PortfolioList> portfolioList = [
    PortfolioList(
      heading: "Masjid Management",
      image: "assets/Project_Image/smart_masjid.png",
      paragraph:
          "A Masjid Management System is a comprehensive digital solution designed to streamline the administration and operations of a mosque. It facilitates member registrations, donation tracking, event scheduling, prayer time management, and financial record-keeping. The system can also include features like automated notifications for prayer times and events, Zakat and Sadaqah management, and integration with payment gateways for online donations. With role-based access, administrators can efficiently oversee mosque activities, while community members stay informed and engaged. This system enhances transparency, improves operational efficiency, and fosters better community interaction within the masjid.",
    ),
    PortfolioList(
      heading: "Restaurant Management",
      image: "assets/Project_Image/restasmart_application.png",
      paragraph:
          "A Restaurant Management System with POS and User Reporting is a robust solution designed to streamline restaurant operations, enhance customer service, and optimize sales tracking. The system integrates a Point of Sale (POS) module for order processing, billing, and inventory management, ensuring seamless transactions across multiple devices like tablets, Android, Windows, and web platforms. It includes user reporting features that provide insights into staff performance, sales trends, customer preferences, and financial summaries. Managers can generate detailed reports on daily sales, expenses, stock usage, and employee activities, helping them make data-driven decisions. With role-based access, restaurant owners, cashiers, and waiters can efficiently manage operations, improving efficiency and profitability.",
    ),
    PortfolioList(
      heading: "RestaSmart website",
      image: "assets/Project_Image/restasmart_website.png",
      paragraph:
          "RestaSmart is a restaurant management application that simplifies operations. It offers features like POS, inventory management, employee scheduling, and CRM. The platform enhances efficiency, reduces complexities, and boosts productivity. Businesses can request a demo on the official website to explore its functionalities. RestaSmart provides flexible pricing based on business size and needs. Specific pricing details are available upon request. The application improves resource management and customer satisfaction. It helps restaurant owners streamline daily tasks effectively. RestaSmart supports business growth and increased profitability. It’s a powerful tool for modern restaurant management.",
    ),
    PortfolioList(
      heading: "KARS Admin",
      image: "assets/Project_Image/kars_admin.png",
      paragraph:
          "An Organization Management System for a Training Institute like the Kuwait Amateurs Radio Society is designed to efficiently manage training programs, trainers, memberships, and payments. The system allows trainers to register, enroll in courses, track their progress, and complete training before becoming eligible for membership. It also includes membership management features, enabling members to apply, renew, and make payments online. Automated reports provide insights into training completion rates, membership status, payment history, and engagement levels. With role-based access for administrators, trainers, and members, the system enhances transparency, streamlines operations, and ensures a smooth training-to-membership transition.",
    ),
    PortfolioList(
      heading: "KARS Websites",
      image: "assets/Project_Image/kars_website.png",
      paragraph:
          "The Kuwait Amateur Radio Society (KARS), founded in 1979, promotes amateur radio activities in Kuwait. It offers training courses for licensing exams and organizes local and international competitions. The society’s website provides training registration, news, events, and member details. KARS is affiliated with the International Amateur Radio Union (IARU) and issues special call signs for national events. Membership categories include active, ordinary, and honorary members. The headquarters feature advanced radio equipment, a library, and a postal office. KARS engages in community outreach to promote amateur radio. It collaborates with global radio societies to enhance knowledge-sharing. The society actively participates in national celebrations. KARS plays a crucial role in sustaining Kuwait’s amateur radio culture.",
    ),
    PortfolioList(
      heading: "Ummati",
      image: "assets/Project_Image/ummati.png",
      paragraph:
          "The Ummati App is a feature-rich Islamic lifestyle application designed to support the spiritual and daily needs of the Muslim community. It offers essential tools such as an Imaan Tracker, accurate prayer timings, and a Qibla Finder—especially useful when traveling. Users can also locate nearby masjids with ease, view real-time weather conditions along with the Hijri date, and access a user-friendly Quran reader and a wide collection of Hadiths. With its intuitive design and practical features, the app serves as a valuable companion for Muslims around the world.",
    ),
  ];

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

class SkillList {
  String heading;
  String image;
  String paragraph;

  SkillList({
    required this.heading,
    required this.image,
    required this.paragraph,
  });
}

class PortfolioList {
  String heading;
  String image;
  String paragraph;

  PortfolioList({
    required this.heading,
    required this.image,
    required this.paragraph,
  });
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
