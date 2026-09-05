import 'package:portfolio/core/utils/result.dart';
import 'package:portfolio/features/experience/domain/entities/work_experience_entity.dart';

abstract class ExperienceRepository {
  Future<Result<List<WorkExperienceEntity>>> getExperiences();
}
