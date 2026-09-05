import 'package:portfolio/core/utils/result.dart';
import 'package:portfolio/features/projects/domain/entities/project_entity.dart';

abstract class ProjectRepository {
  Future<Result<List<ProjectEntity>>> getProjects();
  Future<Result<List<ProjectEntity>>> getProjectsByCategory(String category);
}
