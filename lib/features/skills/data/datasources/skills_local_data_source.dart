import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/features/skills/data/models/skill_category_model.dart';

abstract class SkillsLocalDataSource {
  Future<List<SkillCategoryModel>> getSkills();
}

class SkillsLocalDataSourceImpl implements SkillsLocalDataSource {
  @override
  Future<List<SkillCategoryModel>> getSkills() async {
    return _mockSkills;
  }

  static const List<SkillCategoryModel> _mockSkills = [
    SkillCategoryModel(
      icon: Icons.phone_android,
      color: Color(0xff3b82f6),
      title: "Mobile Development",
      tag: "Core Stack",
      skills: ["Flutter", "Dart", "Android", "iOS"],
      logo: [
        AppAssets.flutter,
        AppAssets.dart,
        AppAssets.android,
        AppAssets.apple,
      ],
    ),
    SkillCategoryModel(
      icon: Icons.layers_rounded,
      color: Color(0xff8b5cf6),
      title: "State Management",
      tag: "Architecture",
      skills: ["GetX", "Bloc", "Provider"],
      logo: [AppAssets.getx, AppAssets.bloc, AppAssets.flutter],
    ),
    SkillCategoryModel(
      icon: Icons.web_rounded,
      color: Color(0xff22c55e),
      title: "Web Development",
      tag: "Cross-Platform",
      skills: ["Flutter Web", "Go Router", "Auto Router"],
      logo: [AppAssets.flutter, AppAssets.flutter, AppAssets.flutter],
    ),
    SkillCategoryModel(
      icon: Icons.storage_rounded,
      color: Color(0xffef4444),
      title: "Backend & APIs",
      tag: "Integration",
      skills: [
        "Node.js",
        "REST API",
        "gRPC",
        "GraphQL",
        "Firebase Auth",
        "GCP",
      ],
      logo: [
        AppAssets.nodejs,
        AppAssets.api,
        AppAssets.api,
        AppAssets.api,
        AppAssets.firebase,
        AppAssets.google,
      ],
    ),
    SkillCategoryModel(
      icon: Icons.cloud_circle_rounded,
      color: Color(0xfff59e0b),
      title: "Database & Storage",
      tag: "Persistence",
      skills: ["PostgreSQL", "MySQL", "Firebase", "Hive"],
      logo: [
        AppAssets.postgresql,
        AppAssets.mysql,
        AppAssets.firebase,
        AppAssets.hive,
      ],
    ),
    SkillCategoryModel(
      icon: Icons.design_services_rounded,
      color: Color(0xfff43f5e),
      title: "UI/UX & Tools",
      tag: "DevOps & Design",
      skills: [
        "Figma",
        "Git",
        "GitHub",
        "GitLab",
        "VS Code",
        "CI/CD",
        "Android Studio",
        "Xcode",
      ],
      logo: [
        AppAssets.figma,
        AppAssets.git,
        AppAssets.github,
        AppAssets.gitlab,
        AppAssets.vscode,
        AppAssets.cicd,
        AppAssets.androidStudio,
        AppAssets.apple,
      ],
    ),
  ];
}
