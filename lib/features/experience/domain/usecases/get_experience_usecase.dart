import 'package:portfolio/core/utils/result.dart';
import 'package:portfolio/features/experience/domain/entities/work_experience_entity.dart';
import 'package:portfolio/features/experience/domain/repositories/experience_repository.dart';

class GetExperienceUseCase {
  final ExperienceRepository repository;

  GetExperienceUseCase({required this.repository});

  Future<Result<List<WorkExperienceEntity>>> execute() async {
    return await repository.getExperiences();
  }
}
