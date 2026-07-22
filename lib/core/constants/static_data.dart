import 'package:flutter/material.dart';
import 'package:mr_portfolio/features/experience/data/models/work_experience_model.dart';
import 'package:mr_portfolio/features/projects/data/models/project_model.dart';
import 'package:mr_portfolio/features/skills/data/models/skill_category_model.dart';

class StaticData {
  static final List<SkillCategory> skillData = [
    SkillCategory(
      icon: Icons.phone_android,
      color: const Color(0xff3b82f6),
      title: "Mobile Development",
      skills: const ["Flutter", "Dart", "Android", "iOS"],
      logo: const [
        "assets/icons/flutter.png",
        "assets/icons/dart.png",
        "assets/icons/android.png",
        "assets/icons/apple.png",
      ],
    ),
    SkillCategory(
      icon: Icons.layers_rounded,
      color: const Color(0xff8b5cf6),
      title: "State Management",
      skills: const ["GetX", "Bloc", "Provider"],
      logo: const [
        "assets/icons/getx.png",
        "assets/icons/bloc.png",
        "assets/icons/flutter.png",
      ],
    ),
    SkillCategory(
      icon: Icons.web_rounded,
      color: const Color(0xff22c55e),
      title: "Web Development",
      skills: const ["Flutter Web", "Go Router", "Auto Router"],
      logo: const [
        "assets/icons/flutter.png",
        "assets/icons/flutter.png",
        "assets/icons/flutter.png",
      ],
    ),
    SkillCategory(
      icon: Icons.storage_rounded,
      color: const Color(0xffef4444),
      title: "Backend & APIs",
      skills: const [
        "Node.js",
        "REST API",
        "gRPC",
        "GraphQL",
        "Firebase Auth",
        "GCP",
      ],
      logo: const [
        "assets/icons/nodejs.png",
        "assets/icons/api.png",
        "assets/icons/api.png",
        "assets/icons/api.png",
        "assets/icons/firebase.png",
        "assets/icons/google.png",
      ],
    ),
    SkillCategory(
      icon: Icons.cloud_circle_rounded,
      color: const Color(0xfff59e0b),
      title: "Database & Storage",
      skills: const ["PostgreSQL", "MySQL", "Firebase", "Hive"],
      logo: const [
        "assets/icons/postgresql.png",
        "assets/icons/mysql.png",
        "assets/icons/firebase.png",
        "assets/icons/hive.png",
      ],
    ),
    SkillCategory(
      icon: Icons.design_services_rounded,
      color: const Color(0xfff43f5e),
      title: "UI/UX & Tools",
      skills: const [
        "Figma",
        "Git",
        "GitHub",
        "GitLab",
        "VS Code",
        "CI/CD",
        "Android Studio",
        "Xcode",
      ],
      logo: const [
        "assets/icons/figma.png",
        "assets/icons/git.png",
        "assets/icons/github.png",
        "assets/icons/gitlab.png",
        "assets/icons/vscode.png",
        "assets/icons/cicd.png",
        "assets/icons/androidstudio.png",
        "assets/icons/apple.png",
      ],
    ),
  ];

  static final List<ProjectItem> projectList = [
    ProjectItem(
      image: "assets/Project_Image/tesseriq_logistics.png",
      heading: "Tesseriq Mobile Logistics Platform",
      category: "Mobile App",
      description:
          "A production-grade mobile logistics application supporting trip management and financial reconciliation. Built with Flutter, Dart, Clean Architecture, gRPC streaming API communication, GetX state management, and an offline-first architecture with Hive for high-reliability local data persistence and seamless background synchronization.",
      technologies: const [
        "Flutter",
        "Dart",
        "Clean Architecture",
        "gRPC",
        "GetX",
        "Hive",
        "Figma",
        "Git",
      ],
      highlights: const [
        "Engineered a cross-platform Flutter mobile application from Figma designs using Clean Architecture",
        "Architected an offline-first mobile data model with Hive for zero-latency local caching",
        "Implemented high-performance gRPC streaming API communication for live GPS trip tracking",
        "Structured state management with GetX controllers for multi-device sync",
      ],
    ),
    ProjectItem(
      image: "assets/Project_Image/restasmart_application.png",
      heading: "Restaurant POS Software",
      category: "Enterprise System",
      description:
          "Developed a full-featured POS and Restaurant Management application with e-commerce style workflows including order management, billing, payments, and push notifications. Designed intuitive user interfaces in Figma and implemented a responsive UI in Flutter, improving customer service speed by 20%. Integrated GitLab CI/CD pipelines to automate builds and deployments across multiple devices, reducing deployment time by 40%.",
      technologies: const [
        "Flutter",
        "Dart",
        "Node.js",
        "JavaScript",
        "Firebase",
        "Google Cloud",
        "PostgreSQL",
        "GitLab",
      ],
      highlights: const [
        "Built multi-platform POS workflows (Android, iOS, Windows, Web) with Flutter",
        "Improved order processing speed by 20% through optimized UI layout and state caching",
        "Configured GitLab CI/CD pipelines, slashing automated build & deploy times by 40%",
        "Integrated payment gateways, thermal receipt printing, and real-time push notifications",
      ],
    ),
    ProjectItem(
      heading: "RestaSmart Website",
      image: "assets/Project_Image/restasmart_website.png",
      category: "Web Platform",
      description:
          "Developed and optimized the official RestaSmart product website, focusing on performance, SEO best practices, and responsive design. Integrated lead-capture forms and demo booking systems to maximize marketing outreach and customer conversion rates.",
      technologies: const [
        "Flutter",
        "Dart",
        "Node.js",
        "JavaScript",
        "Firebase",
        "Google Cloud",
        "PostgreSQL",
        "GitLab",
      ],
      highlights: const [
        "Optimized web load times and implemented SEO metadata standards for search visibility",
        "Built dynamic lead-capture forms with automated backend validation",
        "Configured interactive demo request scheduling workflows",
      ],
    ),
    ProjectItem(
      image: "assets/Project_Image/kars_admin.png",
      heading: "KARS Admin Portal",
      category: "Enterprise System",
      description:
          "Designed and built an administrative portal for the Kuwait Amateur Radio Society to efficiently manage training programs, trainers, memberships, and online payments. Streamlined the entire training-to-membership transition with automated reports and secure workflows.",
      technologies: const [
        "Flutter",
        "Dart",
        "Node.js",
        "JavaScript",
        "Firebase",
        "Google Cloud",
        "PostgreSQL",
        "GitLab",
      ],
      highlights: const [
        "Created an end-to-end administration panel for course & member management",
        "Integrated payment gateways for membership registration and renewal fees",
        "Automated member progress reporting and certificate eligibility tracking",
      ],
    ),
    ProjectItem(
      heading: "KARS Public Website",
      image: "assets/Project_Image/kars_website.png",
      category: "Web Platform",
      description:
          "Built the high-performance public portal for the Kuwait Amateur Radio Society (KARS). Implemented event calendars, registration forms for licensing courses, news feeds, and membership details, enhancing digital engagement for the local amateur radio community.",
      technologies: const [
        "Flutter",
        "Dart",
        "Node.js",
        "JavaScript",
        "Firebase",
        "Google Cloud",
        "PostgreSQL",
        "GitLab",
      ],
      highlights: const [
        "Engineered community portal features: licensing registration, news feeds, and event hub",
        "Designed accessible responsive UI with cross-browser and mobile web compatibility",
        "Configured Cloud-hosted backend integrations for dynamic news updates",
      ],
    ),
    ProjectItem(
      heading: "Ummati App",
      image: "assets/Project_Image/ummati.png",
      category: "Mobile App",
      description:
          "Created Ummati, a feature-rich Islamic lifestyle mobile application. Integrated location services for prayer timings and Qibla direction, scheduled local push notifications for reminders, and set up local caching to ensure core utilities remain fast and offline-accessible.",
      technologies: const [
        "Flutter",
        "Dart",
        "Node.js",
        "JavaScript",
        "Firebase",
        "Google Cloud",
        "PostgreSQL",
        "GitLab",
      ],
      highlights: const [
        "Integrated location-based GPS services for high-accuracy prayer calculations and Qibla compass",
        "Configured local OS notification scheduling for daily prayer alerts",
        "Implemented local database caching for instant offline access to prayer data",
      ],
    ),
  ];

  static final List<WorkExperienceItem> experienceList = [
    WorkExperienceItem(
      role: "UI/UX Developer",
      company: "Tesseriq",
      duration: "Nov 2025 – Present",
      location: "Remote",
      isRemote: true,
      bulletPoints: const [
        "Developed and deployed scalable Flutter applications from Figma designs using Clean Architecture and GetX, building reusable UI components that improved development efficiency and maintained a consistent user interface.",
        "Optimized API communication, widget rendering, and GetX state management, improving application performance by 25% while enhancing UI responsiveness.",
      ],
      technologies: const [
        "Flutter",
        "Dart",
        "Clean Architecture",
        "GetX",
        "Figma",
      ],
    ),
    WorkExperienceItem(
      role: "Software Developer",
      company: "Spin Info Solutions Private Limited",
      duration: "Aug 2024 – Aug 2025",
      location: "Pondicherry, India",
      isRemote: false,
      bulletPoints: const [
        "Developed client-facing mobile applications using Flutter and Dart, integrating payment gateways and push notifications; reduced development time by 30% through reusable UI components and modular architecture.",
        "Collaborated with designers, backend engineers, and product teams in Agile sprints, contributing to feature planning, Figma-to-Flutter UI implementation, API integration, and code reviews using GitHub and Jira.",
        "Improved app performance and scalability by 25% through optimized API handling, clean architecture patterns, and efficient state management.",
      ],
      technologies: const [
        "Flutter",
        "Dart",
        "REST APIs",
        "Payment Gateways",
        "GitHub",
        "Jira",
      ],
    ),
    WorkExperienceItem(
      role: "Software Developer Intern",
      company: "Spin Info Solutions Private Limited",
      duration: "Mar 2024 – Aug 2024",
      location: "Pondicherry, India",
      isRemote: false,
      bulletPoints: const [
        "Built responsive and high-performance mobile applications using Flutter, handling end-to-end development from UI implementation to deployment.",
        "Collaborated with senior developers to improve app features, fix bugs, and enhance overall stability and user experience.",
      ],
      technologies: const ["Flutter", "Dart", "REST APIs", "Bug Fixing", "Git"],
    ),
  ];
}
