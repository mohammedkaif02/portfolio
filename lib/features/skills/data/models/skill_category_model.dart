import 'package:flutter/material.dart';

class SkillCategory {
  final IconData icon;
  final Color color;
  final String title;
  final List<String> skills;
  final List<String> logo;

  SkillCategory({
    required this.icon,
    required this.color,
    required this.title,
    required this.skills,
    required this.logo,
  });
}
