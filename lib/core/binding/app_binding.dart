import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/features/cv/data/datasources/cv_file_data_source.dart';
import 'package:portfolio/features/cv/data/repositories/cv_repository_impl.dart';
import 'package:portfolio/features/cv/data/repositories/location_repository_impl.dart';
import 'package:portfolio/features/cv/domain/repositories/cv_repository.dart';
import 'package:portfolio/features/cv/domain/repositories/location_repository.dart';
import 'package:portfolio/features/cv/domain/usecases/download_cv_usecase.dart';
import 'package:portfolio/features/cv/presentation/controllers/cv_controller.dart';
import 'package:portfolio/features/experience/data/datasources/experience_local_data_source.dart';
import 'package:portfolio/features/experience/data/repositories/experience_repository_impl.dart';
import 'package:portfolio/features/experience/domain/repositories/experience_repository.dart';
import 'package:portfolio/features/experience/domain/usecases/get_experience_usecase.dart';
import 'package:portfolio/features/experience/presentation/controllers/experience_controller.dart';
import 'package:portfolio/features/home/presentation/controllers/navigation_controller.dart';
import 'package:portfolio/features/home/presentation/controllers/theme_controller.dart';
import 'package:portfolio/features/projects/data/datasources/project_local_data_source.dart';
import 'package:portfolio/features/projects/data/repositories/project_repository_impl.dart';
import 'package:portfolio/features/projects/domain/repositories/project_repository.dart';
import 'package:portfolio/features/projects/domain/usecases/filter_projects_usecase.dart';
import 'package:portfolio/features/projects/domain/usecases/get_projects_usecase.dart';
import 'package:portfolio/features/projects/presentation/controllers/projects_controller.dart';
import 'package:portfolio/features/skills/data/datasources/skills_local_data_source.dart';
import 'package:portfolio/features/skills/data/repositories/skills_repository_impl.dart';
import 'package:portfolio/features/skills/domain/repositories/skills_repository.dart';
import 'package:portfolio/features/skills/domain/usecases/get_skills_usecase.dart';
import 'package:portfolio/features/skills/presentation/controllers/skills_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<http.Client>(() => http.Client(), fenix: true);
    Get.lazyPut<ThemeController>(() => ThemeController(), fenix: true);
    Get.lazyPut<NavigationController>(() => NavigationController(), fenix: true);

    Get.lazyPut<LocationRepository>(
      () => LocationRepositoryImpl(client: Get.find<http.Client>()),
      fenix: true,
    );
    Get.lazyPut<CvFileDataSource>(() => CvFileDataSourceImpl(), fenix: true);
    Get.lazyPut<CvRepository>(
      () => CvRepositoryImpl(fileDataSource: Get.find<CvFileDataSource>()),
      fenix: true,
    );
    Get.lazyPut<DownloadCVUseCase>(
      () => DownloadCVUseCase(
        locationRepository: Get.find<LocationRepository>(),
        cvRepository: Get.find<CvRepository>(),
      ),
      fenix: true,
    );
    Get.lazyPut<CVController>(
      () => CVController(downloadCVUseCase: Get.find<DownloadCVUseCase>()),
      fenix: true,
    );

    Get.lazyPut<ProjectLocalDataSource>(
      () => ProjectLocalDataSourceImpl(),
      fenix: true,
    );
    Get.lazyPut<ProjectRepository>(
      () => ProjectRepositoryImpl(
        localDataSource: Get.find<ProjectLocalDataSource>(),
      ),
      fenix: true,
    );
    Get.lazyPut<GetProjectsUseCase>(
      () => GetProjectsUseCase(repository: Get.find<ProjectRepository>()),
      fenix: true,
    );
    Get.lazyPut<FilterProjectsUseCase>(
      () => FilterProjectsUseCase(repository: Get.find<ProjectRepository>()),
      fenix: true,
    );
    Get.lazyPut<ProjectsController>(
      () => ProjectsController(
        getProjectsUseCase: Get.find<GetProjectsUseCase>(),
        filterProjectsUseCase: Get.find<FilterProjectsUseCase>(),
      ),
      fenix: true,
    );

    Get.lazyPut<ExperienceLocalDataSource>(
      () => ExperienceLocalDataSourceImpl(),
      fenix: true,
    );
    Get.lazyPut<ExperienceRepository>(
      () => ExperienceRepositoryImpl(
        localDataSource: Get.find<ExperienceLocalDataSource>(),
      ),
      fenix: true,
    );
    Get.lazyPut<GetExperienceUseCase>(
      () => GetExperienceUseCase(repository: Get.find<ExperienceRepository>()),
      fenix: true,
    );
    Get.lazyPut<ExperienceController>(
      () => ExperienceController(
        getExperienceUseCase: Get.find<GetExperienceUseCase>(),
      ),
      fenix: true,
    );

    Get.lazyPut<SkillsLocalDataSource>(
      () => SkillsLocalDataSourceImpl(),
      fenix: true,
    );
    Get.lazyPut<SkillsRepository>(
      () => SkillsRepositoryImpl(
        localDataSource: Get.find<SkillsLocalDataSource>(),
      ),
      fenix: true,
    );
    Get.lazyPut<GetSkillsUseCase>(
      () => GetSkillsUseCase(repository: Get.find<SkillsRepository>()),
      fenix: true,
    );
    Get.lazyPut<SkillsController>(
      () => SkillsController(
        getSkillsUseCase: Get.find<GetSkillsUseCase>(),
      ),
      fenix: true,
    );
  }
}
