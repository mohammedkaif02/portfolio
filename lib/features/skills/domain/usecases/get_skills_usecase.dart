import 'package:portfolio/core/utils/result.dart';
import 'package:portfolio/features/skills/domain/entities/skill_category_entity.dart';
import 'package:portfolio/features/skills/domain/repositories/skills_repository.dart';

class GetSkillsUseCase {
  final SkillsRepository repository;

  GetSkillsUseCase({required this.repository});

  Future<Result<List<SkillCategoryEntity>>> execute() async {
    return await repository.getSkills();
  }
}
