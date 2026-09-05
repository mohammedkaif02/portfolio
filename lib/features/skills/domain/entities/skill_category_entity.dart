import 'package:flutter/material.dart';

class SkillCategoryEntity {
  final IconData icon;
  final Color color;
  final String title;
  final String? tag;
  final List<String> skills;
  final List<String> logo;

  const SkillCategoryEntity({
    required this.icon,
    required this.color,
    required this.title,
    this.tag,
    required this.skills,
    required this.logo,
  });
}
