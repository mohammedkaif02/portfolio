import 'package:portfolio/core/utils/result.dart';
import 'package:portfolio/features/skills/domain/entities/skill_category_entity.dart';

abstract class SkillsRepository {
  Future<Result<List<SkillCategoryEntity>>> getSkills();
}
