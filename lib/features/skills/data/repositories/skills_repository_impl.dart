import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/core/utils/result.dart';
import 'package:portfolio/features/skills/data/datasources/skills_local_data_source.dart';
import 'package:portfolio/features/skills/domain/entities/skill_category_entity.dart';
import 'package:portfolio/features/skills/domain/repositories/skills_repository.dart';

class SkillsRepositoryImpl implements SkillsRepository {
  final SkillsLocalDataSource localDataSource;

  SkillsRepositoryImpl({required this.localDataSource});

  @override
  Future<Result<List<SkillCategoryEntity>>> getSkills() async {
    try {
      final skills = await localDataSource.getSkills();
      return Success(skills);
    } catch (e) {
      return Error(CacheFailure('Failed to load skills dataset: $e'));
    }
  }
}
