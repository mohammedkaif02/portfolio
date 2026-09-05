import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/core/utils/result.dart';
import 'package:portfolio/features/cv/domain/repositories/cv_repository.dart';
import 'package:portfolio/features/cv/domain/repositories/location_repository.dart';
import 'package:portfolio/features/cv/domain/usecases/download_cv_usecase.dart';
import 'package:portfolio/features/experience/data/datasources/experience_local_data_source.dart';
import 'package:portfolio/features/experience/data/repositories/experience_repository_impl.dart';
import 'package:portfolio/features/experience/domain/usecases/get_experience_usecase.dart';
import 'package:portfolio/features/projects/data/datasources/project_local_data_source.dart';
import 'package:portfolio/features/projects/data/repositories/project_repository_impl.dart';
import 'package:portfolio/features/projects/domain/usecases/filter_projects_usecase.dart';
import 'package:portfolio/features/projects/domain/usecases/get_projects_usecase.dart';
import 'package:portfolio/features/skills/data/datasources/skills_local_data_source.dart';
import 'package:portfolio/features/skills/data/repositories/skills_repository_impl.dart';
import 'package:portfolio/features/skills/domain/usecases/get_skills_usecase.dart';

// Mock Repositories for CV testing
class FakeLocationRepository implements LocationRepository {
  final String? mockCountry;
  FakeLocationRepository({this.mockCountry = 'India'});

  @override
  Future<String?> getCountryFromIP() async => mockCountry;
}

class FakeCvRepository implements CvRepository {
  String? downloadedPath;
  String? downloadedFileName;

  @override
  Future<Result<void>> downloadAndLaunchCv({
    required String assetPath,
    required String fileName,
  }) async {
    downloadedPath = assetPath;
    downloadedFileName = fileName;
    return const Success(null);
  }
}

void main() {
  group('Projects Clean Architecture UseCases', () {
    late ProjectRepositoryImpl repository;
    late GetProjectsUseCase getProjectsUseCase;
    late FilterProjectsUseCase filterProjectsUseCase;

    setUp(() {
      final localDataSource = ProjectLocalDataSourceImpl();
      repository = ProjectRepositoryImpl(localDataSource: localDataSource);
      getProjectsUseCase = GetProjectsUseCase(repository: repository);
      filterProjectsUseCase = FilterProjectsUseCase(repository: repository);
    });

    test(
      'GetProjectsUseCase returns valid project list with Success result',
      () async {
        final result = await getProjectsUseCase.execute();

        expect(result.isSuccess, isTrue);
        final projects = result.dataOrNull!;
        expect(projects.isNotEmpty, isTrue);
        expect(
          projects.any(
            (p) => p.title.contains("MALIYAH") || p.title.contains("MĀLIYAH"),
          ),
          isTrue,
        );
        expect(projects.first.keyMetrics.isNotEmpty, isTrue);
      },
    );

    test('FilterProjectsUseCase filters correctly by category', () async {
      final mobileResult = await filterProjectsUseCase.execute("Mobile App");
      expect(mobileResult.isSuccess, isTrue);
      final mobileProjects = mobileResult.dataOrNull!;
      expect(mobileProjects.every((p) => p.category == "Mobile App"), isTrue);

      final allResult = await filterProjectsUseCase.execute("All");
      expect(allResult.isSuccess, isTrue);
      expect(allResult.dataOrNull!.length, greaterThan(mobileProjects.length));
    });
  });

  group('Experience Clean Architecture UseCases', () {
    test('GetExperienceUseCase returns valid work experiences', () async {
      final localDataSource = ExperienceLocalDataSourceImpl();
      final repository = ExperienceRepositoryImpl(
        localDataSource: localDataSource,
      );
      final useCase = GetExperienceUseCase(repository: repository);

      final result = await useCase.execute();

      expect(result.isSuccess, isTrue);
      final experiences = result.dataOrNull!;
      expect(experiences.isNotEmpty, isTrue);
      expect(experiences.any((e) => e.company == "Tesseriq"), isTrue);
    });
  });

  group('Skills Clean Architecture UseCases', () {
    test(
      'GetSkillsUseCase returns skill categories with tech stacks',
      () async {
        final localDataSource = SkillsLocalDataSourceImpl();
        final repository = SkillsRepositoryImpl(
          localDataSource: localDataSource,
        );
        final useCase = GetSkillsUseCase(repository: repository);

        final result = await useCase.execute();

        expect(result.isSuccess, isTrue);
        final skills = result.dataOrNull!;
        expect(skills.isNotEmpty, isTrue);
        expect(skills.any((s) => s.title == "Mobile Development"), isTrue);
      },
    );
  });

  group('CV Clean Architecture UseCase', () {
    test('DownloadCVUseCase selects India CV when country is India', () async {
      final fakeLocationRepo = FakeLocationRepository(mockCountry: 'India');
      final fakeCvRepo = FakeCvRepository();
      final useCase = DownloadCVUseCase(
        locationRepository: fakeLocationRepo,
        cvRepository: fakeCvRepo,
      );

      final result = await useCase.execute();

      expect(result.isSuccess, isTrue);
      expect(fakeCvRepo.downloadedPath, contains('MohammedKaif.pdf'));
      expect(
        fakeCvRepo.downloadedFileName,
        contains('Mohammed_Kaif_Flutter_Resume.pdf'),
      );
    });
  });
}
