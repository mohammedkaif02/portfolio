import 'package:portfolio/core/utils/result.dart';
import 'package:portfolio/features/projects/domain/entities/project_entity.dart';
import 'package:portfolio/features/projects/domain/repositories/project_repository.dart';

class FilterProjectsUseCase {
  final ProjectRepository repository;

  FilterProjectsUseCase({required this.repository});

  Future<Result<List<ProjectEntity>>> execute(String category) async {
    return await repository.getProjectsByCategory(category);
  }
}
