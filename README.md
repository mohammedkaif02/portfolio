# Mohammed Kaif — Mobile App Engineer & Flutter Specialist

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Architecture](https://img.shields.io/badge/Architecture-Clean%20Architecture-7241EA?style=for-the-badge&logo=appveyor&logoColor=white)](https://blog.cleancoder.com/)
[![Tests](https://img.shields.io/badge/Tests-100%25%20Passing-22C55E?style=for-the-badge&logo=githubactions&logoColor=white)](#testing--verification)
[![License](https://img.shields.io/badge/License-MIT-38BDF8?style=for-the-badge)](LICENSE)

> Production-grade, cross-platform portfolio application engineered with **Clean Architecture**, strict layer decoupling, responsive Material 3 design, and verifiable project case studies.

---

## 🏛️ Architecture Overview

The application strictly adheres to **Uncle Bob's Clean Architecture & SOLID Principles**, ensuring testability, maintainability, and zero UI leaks into business logic.

```
┌─────────────────────────────────────────────────────────────┐
│                    PRESENTATION LAYER                       │
│  • Responsive Material 3 Views (Mobile, Tablet, Desktop)   │
│  • GetX Reactive State Management & ViewModels              │
│  • Interactive 3-Layer Architecture Modal Explorer          │
│  • Floating Recruiter Quick-Action Dock                     │
└──────────────────────────────┬──────────────────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────┐
│                       DOMAIN LAYER                          │
│               (Pure Dart — Zero UI Leaks)                   │
│  • Pure Entities: ProjectEntity, WorkExperienceEntity       │
│  • Abstract Repository Contracts                            │
│  • Single-Responsibility UseCases                           │
│  • Functional Error Handling via Result<T> sealed classes   │
└──────────────────────────────▲──────────────────────────────┘
                               │
                               │ Implements
┌──────────────────────────────┴──────────────────────────────┐
│                        DATA LAYER                           │
│  • Repository Implementations                               │
│  • Local & Remote DataSources (with mock latency / cache)   │
│  • Data Models with JSON Serialization & Entity Mappers     │
│  • Platform I/O & File Services (WASM/Mobile agnostic)      │
└─────────────────────────────────────────────────────────────┘
```

---

## 🚀 Key Engineering Highlights

- **Pure Domain Boundary**: Domain layer contains zero Flutter UI imports, framework bindings, or platform packages.
- **Functional Result Modeling**: Replaces raw unhandled exceptions with a type-safe `Result<T>` sealed class (`Success<T>`, `Error<T>`) and typed `Failure` hierarchy.
- **Centralized Dependency Injection**: Managed via GetX `AppBinding` and registered hierarchically before application startup (`initialBinding`).
- **Recruiter Quick Dock**: Floating bottom glassmorphism dock providing 1-click access to CV Download, Email, GitHub, LinkedIn, and WhatsApp.
- **Interactive Architecture Explorer**: Visual architecture breakdown inside project modals detailing state machines, data flow, and key technical metrics.
- **Zero-Latency Web Startup**: Custom animated CSS preloader in `web/index.html` featuring neon orbital pulsing and branded monogram (`MK`).
- **Comprehensive Testing Suite**: Unit tests for all Domain UseCases and smoke tests for app bootstrapping.

---

## 📁 Project Structure

```text
lib/
├── core/
│   ├── constants/             # AppConstants, AppStrings, AppDimensions, AppAssets
│   ├── di/                    # Centralized AppBinding (Dependency Injection)
│   ├── error/                 # Failure sealed hierarchy (Server, Cache, Platform)
│   ├── theme/                 # Light & Dark Material 3 theme configurations
│   ├── utils/                 # Functional Result<T> pattern, Download helpers
│   └── widgets/               # RecruiterDock, ScrollReveal, SectionHeader, etc.
│
├── features/
│   ├── projects/              # Projects Showcase
│   │   ├── domain/            # ProjectEntity, ProjectRepository, UseCases
│   │   ├── data/              # ProjectModel, ProjectLocalDataSource, RepositoryImpl
│   │   └── presentation/      # ProjectsController, ProjectsView, ProjectArchitectureModal
│   │
│   ├── experience/            # Work Experience & Career Timeline
│   │   ├── domain/            # WorkExperienceEntity, ExperienceRepository, UseCases
│   │   ├── data/              # WorkExperienceModel, LocalDataSource, RepositoryImpl
│   │   └── presentation/      # ExperienceController, ExperienceView, TimelineItem
│   │
│   ├── skills/                # Technical Competencies & Tech Stack
│   │   ├── domain/            # SkillCategoryEntity, SkillsRepository, UseCases
│   │   ├── data/              # SkillCategoryModel, LocalDataSource, RepositoryImpl
│   │   └── presentation/      # SkillsController, MySkillsView, SkillCategoryCard
│   │
│   ├── cv/                    # CV Orchestration & Geolocation
│   │   ├── domain/            # CvRepository, LocationRepository, DownloadCVUseCase
│   │   ├── data/              # CvFileDataSource, CvRepositoryImpl, LocationRepositoryImpl
│   │   └── presentation/      # CVController
│   │
│   ├── about/                 # Candidate Bio, Metrics & Core Capabilities
│   ├── contact/               # Contact Channels & Interview Scheduler
│   └── home/                  # Responsive Layouts, NavigationController, HeroVisual
│
└── main.dart                  # Application Entry Point & Bootstrap
```

---

## 🛠️ Showcase Projects

| Project | Key Technologies | Architectural Highlights |
| :--- | :--- | :--- |
| **MĀLIYAH** | Flutter, BLoC/Cubit, Google ML Kit, FL Chart | Clean Architecture, On-device OCR (<250ms), 100% offline privacy |
| **Tesseriq Logistics** | Flutter, gRPC, GetX, Hive | Offline-First caching, real-time bidirectional streaming |
| **RestaSmart POS** | Flutter, Node.js, GitLab CI/CD, PostgreSQL | Cross-platform POS, automated builds (-40% deployment time) |
| **KARS Portal** | Flutter Web, Firebase, Cloud Backend | Role-Based Access Control (RBAC), licensing & event registry |

---

## 🧪 Testing & Verification

Run the full automated test suite:
```bash
flutter test
```

Run static analysis:
```bash
flutter analyze
```

Run locally:
```bash
# Web
flutter run -d chrome

# Mobile
flutter run
```

---

## 📬 Connect with Mohammed Kaif

- **Email**: [mohammedkaif4343@gmail.com](mailto:mohammedkaif4343@gmail.com)
- **LinkedIn**: [linkedin.com/in/mohammedkaif4343](https://www.linkedin.com/in/mohammedkaif4343/)
- **GitHub**: [github.com/mohammedkaif02](https://github.com/mohammedkaif02)
- **WhatsApp**: [+91 63741 85527](https://wa.me/916374185527)

---
*Built with Flutter, Dart, and Clean Architecture principles.*
