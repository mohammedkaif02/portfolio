import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/utils/result.dart';
import 'package:portfolio/features/cv/domain/repositories/cv_repository.dart';
import 'package:portfolio/features/cv/domain/repositories/location_repository.dart';

class DownloadCVUseCase {
  final LocationRepository locationRepository;
  final CvRepository cvRepository;

  DownloadCVUseCase({
    required this.locationRepository,
    required this.cvRepository,
  });

  Future<Result<void>> execute() async {
    String country = 'Unknown';
    try {
      final fetchedCountry = await locationRepository.getCountryFromIP();
      if (fetchedCountry != null && fetchedCountry.isNotEmpty) {
        country = fetchedCountry;
      }
    } catch (_) {
      // Graceful fallback to default
    }

    final String pdfPath =
        country.toLowerCase() == "india"
            ? AppConstants.cvPdfPathIndia
            : AppConstants.cvPdfPathGlobal;

    return await cvRepository.downloadAndLaunchCv(
      assetPath: pdfPath,
      fileName: AppConstants.cvPdfFileName,
    );
  }
}
