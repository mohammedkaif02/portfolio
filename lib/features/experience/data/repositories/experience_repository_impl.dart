import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/core/utils/result.dart';
import 'package:portfolio/features/experience/data/datasources/experience_local_data_source.dart';
import 'package:portfolio/features/experience/domain/entities/work_experience_entity.dart';
import 'package:portfolio/features/experience/domain/repositories/experience_repository.dart';

class ExperienceRepositoryImpl implements ExperienceRepository {
  final ExperienceLocalDataSource localDataSource;

  ExperienceRepositoryImpl({required this.localDataSource});

  @override
  Future<Result<List<WorkExperienceEntity>>> getExperiences() async {
    try {
      final experiences = await localDataSource.getExperiences();
      return Success(experiences);
    } catch (e) {
      return Error(CacheFailure('Failed to load work experience dataset: $e'));
    }
  }
}
