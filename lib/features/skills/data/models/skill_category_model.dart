import 'package:portfolio/features/skills/domain/entities/skill_category_entity.dart';

class SkillCategoryModel extends SkillCategoryEntity {
  const SkillCategoryModel({
    required super.icon,
    required super.color,
    required super.title,
    super.tag,
    required super.skills,
    required super.logo,
  });

  SkillCategoryEntity toEntity() => this;
}

typedef SkillCategory = SkillCategoryEntity;
