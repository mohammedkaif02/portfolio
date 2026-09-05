import 'package:portfolio/core/utils/result.dart';
import 'package:portfolio/features/projects/domain/entities/project_entity.dart';
import 'package:portfolio/features/projects/domain/repositories/project_repository.dart';

class GetProjectsUseCase {
  final ProjectRepository repository;

  GetProjectsUseCase({required this.repository});

  Future<Result<List<ProjectEntity>>> execute() async {
    return await repository.getProjects();
  }
}
