import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/features/projects/data/models/project_model.dart';

abstract class ProjectLocalDataSource {
  Future<List<ProjectModel>> getProjects();
}

class ProjectLocalDataSourceImpl implements ProjectLocalDataSource {
  @override
  Future<List<ProjectModel>> getProjects() async {
    return _projects;
  }

  static const List<ProjectModel> _projects = [
    ProjectModel(
      id: 'maliyah-finance',
      image: AppAssets.maliyah,
      title: "MALIYAH - Personal Wealth & Finance Platform",
      category: "Mobile App",
      description:
          "An ultra-premium, privacy-first personal wealth and finance operating system. Built with Flutter, Dart, Clean Architecture, and BLoC state management, featuring on-device AI receipt and UPI screenshot OCR scanning via Google ML Kit, dual-ledger Khata debt tracking, an automated EMI/recurring expense engine, and interactive financial analytics.",
      technologies: [
        "Flutter",
        "Dart",
        "BLoC / Cubit",
        "Clean Architecture",
        "Google ML Kit",
        "On-Device AI / OCR",
        "FL Chart",
        "Material 3",
        "Git",
      ],
      highlights: [
        "Integrated on-device Google ML Kit Vision OCR to parse UPI transaction screenshots and store receipts in <250ms with 100% offline privacy",
        "Architected predictable state machines with BLoC & Cubit, supporting multi-tenant local session isolation and live net-worth calculations",
        "Built interactive spending trend bar charts and category distribution donut charts using FL Chart at fluid 60 FPS",
      ],
      githubUrl: "https://github.com/mohammedkaif02/maliyah",
      liveUrl: null,
      playStoreUrl: null,
      architectureOverview:
          "Implemented 3-layer Clean Architecture with BLoC and Cubit state management. Uses on-device Google ML Kit Vision for OCR extraction, local Hive persistence for zero-cloud offline privacy, and reactive streams for real-time net worth calculation.",
      keyMetrics: {
        "OCR Speed": "<250ms",
        "State Engine": "BLoC / Cubit",
        "Architecture": "Clean Architecture",
        "Privacy": "100% Offline",
      },
    ),
    ProjectModel(
      id: 'tesseriq-logistics',
      image: AppAssets.tesseriqLogistics,
      title: "Tesseriq Mobile Logistics Platform",
      category: "Mobile App",
      description:
          "A production-grade mobile logistics application supporting trip management and financial reconciliation. Built with Flutter, Dart, Clean Architecture, gRPC streaming API communication, GetX state management, and an offline-first architecture with Hive for high-reliability local data persistence and seamless background synchronization.",
      technologies: [
        "Flutter",
        "Dart",
        "Clean Architecture",
        "gRPC",
        "GetX",
        "Hive",
        "Figma",
        "Git",
      ],
      highlights: [
        "Engineered a cross-platform Flutter mobile application from Figma designs using Clean Architecture",
        "Architected an offline-first mobile data model with Hive for zero-latency local caching",
        "Implemented high-performance gRPC streaming API communication for live GPS trip tracking",
        "Structured state management with GetX controllers for multi-device sync",
      ],
      githubUrl: null,
      liveUrl: null,
      playStoreUrl: "https://play.google.com/store/apps/details?id=com.tesseriq.tesseriq",
      architectureOverview:
          "Engineered with an Offline-First architectural pattern using Hive local key-value storage synchronized over gRPC bidirectional streams for sub-second driver location updates and trip logs.",
      keyMetrics: {
        "Protocol": "gRPC Streaming",
        "State": "GetX",
        "Storage": "Hive Offline-First",
        "Sync Latency": "<100ms",
      },
    ),
    ProjectModel(
      id: 'restasmart-pos',
      image: AppAssets.restasmartApplication,
      title: "Restaurant POS Software",
      category: "Enterprise System",
      description:
          "Developed a full-featured POS and Restaurant Management application with e-commerce style workflows including order management, billing, payments, and push notifications. Designed intuitive user interfaces in Figma and implemented a responsive UI in Flutter, improving customer service speed by 20%. Integrated GitLab CI/CD pipelines to automate builds and deployments across multiple devices, reducing deployment time by 40%.",
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
      highlights: [
        "Built multi-platform POS workflows (Android, iOS, Windows, Web) with Flutter",
        "Improved order processing speed by 20% through optimized UI layout and state caching",
        "Configured GitLab CI/CD pipelines, slashing automated build & deploy times by 40%",
        "Integrated payment gateways, thermal receipt printing, and real-time push notifications",
      ],
      githubUrl: null,
      liveUrl: null,
      playStoreUrl: null,
      architectureOverview:
          "Modular client-server enterprise architecture with Flutter frontend and Node.js microservices. Uses automated GitLab CI/CD runner pipelines for multi-device testing and artifact generation.",
      keyMetrics: {
        "Order Speedup": "+20%",
        "CI/CD Speedup": "+40%",
        "Platforms": "Android, iOS, Windows, Web",
        "Database": "PostgreSQL",
      },
    ),
    ProjectModel(
      id: 'restasmart-web',
      image: AppAssets.restasmartWebsite,
      title: "RestaSmart Website",
      category: "Web Platform",
      description:
          "Developed and optimized the official RestaSmart product website, focusing on performance, SEO best practices, and responsive design. Integrated lead-capture forms and demo booking systems to maximize marketing outreach and customer conversion rates.",
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
      highlights: [
        "Optimized web load times and implemented SEO metadata standards for search visibility",
        "Built dynamic lead-capture forms with automated backend validation",
        "Configured interactive demo request scheduling workflows",
      ],
      githubUrl: null,
      liveUrl: null,
      playStoreUrl: null,
      architectureOverview:
          "SEO-optimized Flutter Web platform leveraging responsive layout constraints, semantic web tags, and cloud backend integrations.",
      keyMetrics: {
        "Platform": "Flutter Web",
        "Responsiveness": "Desktop, Tablet, Mobile",
        "Conversion": "Lead Generation Flow",
      },
    ),
    ProjectModel(
      id: 'kars-admin',
      image: AppAssets.karsAdmin,
      title: "KARS Admin Portal",
      category: "Enterprise System",
      description:
          "Designed and built an administrative portal for the Kuwait Amateur Radio Society to efficiently manage training programs, trainers, memberships, and online payments. Streamlined the entire training-to-membership transition with automated reports and secure workflows.",
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
      highlights: [
        "Created an end-to-end administration panel for course & member management",
        "Integrated payment gateways for membership registration and renewal fees",
        "Automated member progress reporting and certificate eligibility tracking",
      ],
      githubUrl: null,
      liveUrl: null,
      playStoreUrl: null,
      architectureOverview:
          "Role-Based Access Control administrative portal with encrypted payment gateway hooks and dynamic PDF certificate generation.",
      keyMetrics: {
        "Role": "Enterprise Admin Portal",
        "Security": "RBAC & Cloud Auth",
        "Region": "Kuwait Society Operations",
      },
    ),
    ProjectModel(
      id: 'kars-website',
      image: AppAssets.karsWebsite,
      title: "KARS Public Website",
      category: "Web Platform",
      description:
          "Built the high-performance public portal for the Kuwait Amateur Radio Society (KARS). Implemented event calendars, registration forms for licensing courses, news feeds, and membership details, enhancing digital engagement for the local amateur radio community.",
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
      highlights: [
        "Engineered community portal features: licensing registration, news feeds, and event hub",
        "Designed accessible responsive UI with cross-browser and mobile web compatibility",
        "Configured Cloud-hosted backend integrations for dynamic news updates",
      ],
      githubUrl: null,
      liveUrl: null,
      playStoreUrl: null,
      architectureOverview:
          "High-traffic public web portal with responsive Material 3 layout and dynamic event scheduling integration.",
      keyMetrics: {
        "Audience": "Public Community",
        "Integration": "Event Calendar & News",
        "Platform": "Flutter Web",
      },
    ),
  ];
}
