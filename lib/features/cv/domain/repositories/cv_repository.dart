import 'package:portfolio/core/utils/result.dart';

abstract class CvRepository {
  Future<Result<void>> downloadAndLaunchCv({
    required String assetPath,
    required String fileName,
  });
}
