import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/core/utils/result.dart';
import 'package:portfolio/features/projects/data/datasources/project_local_data_source.dart';
import 'package:portfolio/features/projects/domain/entities/project_entity.dart';
import 'package:portfolio/features/projects/domain/repositories/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectLocalDataSource localDataSource;

  ProjectRepositoryImpl({required this.localDataSource});

  @override
  Future<Result<List<ProjectEntity>>> getProjects() async {
    try {
      final projects = await localDataSource.getProjects();
      return Success(projects);
    } catch (e) {
      return Error(CacheFailure('Failed to load project dataset: $e'));
    }
  }

  @override
  Future<Result<List<ProjectEntity>>> getProjectsByCategory(
    String category,
  ) async {
    try {
      final projects = await localDataSource.getProjects();
      if (category == "All") {
        return Success(projects);
      }
      final filtered = projects.where((p) => p.category == category).toList();
      return Success(filtered);
    } catch (e) {
      return Error(CacheFailure('Failed to filter project dataset: $e'));
    }
  }
}
