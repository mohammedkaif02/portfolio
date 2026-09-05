import 'package:portfolio/features/experience/data/models/work_experience_model.dart';

abstract class ExperienceLocalDataSource {
  Future<List<WorkExperienceModel>> getExperiences();
}

class ExperienceLocalDataSourceImpl implements ExperienceLocalDataSource {
  @override
  Future<List<WorkExperienceModel>> getExperiences() async {
    return _mockExperiences;
  }

  static const List<WorkExperienceModel> _mockExperiences = [
    WorkExperienceModel(
      role: "Flutter Developer",
      company: "Tesseriq",
      duration: "Nov 2025 – Aug 2026",
      location: "Remote",
      isRemote: true,
      bulletPoints: [
        "Developed and deployed scalable Flutter applications from Figma designs using Clean Architecture and GetX, building reusable UI components that improved development efficiency and maintained a consistent user interface.",
        "Optimized API communication, widget rendering, and GetX state management, improving application performance by 25% while enhancing UI responsiveness.",
      ],
      technologies: ["Flutter", "Dart", "Clean Architecture", "GetX", "Figma"],
    ),
    WorkExperienceModel(
      role: "Software Developer",
      company: "Spin Info Solutions Private Limited",
      duration: "Aug 2024 – Aug 2025",
      location: "Pondicherry, India",
      isRemote: false,
      bulletPoints: [
        "Developed client-facing mobile applications using Flutter and Dart, integrating payment gateways and push notifications; reduced development time by 30% through reusable UI components and modular architecture.",
        "Collaborated with designers, backend engineers, and product teams in Agile sprints, contributing to feature planning, Figma-to-Flutter UI implementation, API integration, and code reviews using GitHub and Jira.",
        "Improved app performance and scalability by 25% through optimized API handling, clean architecture patterns, and efficient state management.",
      ],
      technologies: [
        "Flutter",
        "Dart",
        "REST APIs",
        "Payment Gateways",
        "GitHub",
        "Jira",
      ],
    ),
    WorkExperienceModel(
      role: "Software Developer Intern",
      company: "Spin Info Solutions Private Limited",
      duration: "Mar 2024 – Aug 2024",
      location: "Pondicherry, India",
      isRemote: false,
      bulletPoints: [
        "Built responsive and high-performance mobile applications using Flutter, handling end-to-end development from UI implementation to deployment.",
        "Collaborated with senior developers to improve app features, fix bugs, and enhance overall stability and user experience.",
      ],
      technologies: ["Flutter", "Dart", "REST APIs", "Bug Fixing", "Git"],
    ),
  ];
}
