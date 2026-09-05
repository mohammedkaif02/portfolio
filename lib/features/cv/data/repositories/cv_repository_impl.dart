import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/core/utils/result.dart';
import 'package:portfolio/features/cv/data/datasources/cv_file_data_source.dart';
import 'package:portfolio/features/cv/domain/repositories/cv_repository.dart';

class CvRepositoryImpl implements CvRepository {
  final CvFileDataSource fileDataSource;

  CvRepositoryImpl({required this.fileDataSource});

  @override
  Future<Result<void>> downloadAndLaunchCv({
    required String assetPath,
    required String fileName,
  }) async {
    try {
      await fileDataSource.saveAndLaunchFromAsset(
        assetPath: assetPath,
        fileName: fileName,
      );
      return const Success(null);
    } catch (e) {
      return Error(PlatformFailure('Failed to open or download CV: $e'));
    }
  }
}
