import 'package:flutter/services.dart';
import 'package:mr_portfolio/core/constants/app_constants.dart';
import 'package:mr_portfolio/core/utils/download_helper.dart' as download_helper;
import 'package:mr_portfolio/features/cv/domain/repositories/location_repository.dart';

class DownloadCVUseCase {
  final LocationRepository locationRepository;

  DownloadCVUseCase({required this.locationRepository});

  Future<void> execute() async {
    String country = 'Unknown';
    try {
      final fetchedCountry = await locationRepository.getCountryFromIP();
      if (fetchedCountry != null) {
        country = fetchedCountry;
      }
    } catch (_) {
      // Fallback if check fails
    }

    final String pdfPath = country == "India"
        ? AppConstants.cvPdfPathIndia
        : AppConstants.cvPdfPathGlobal;

    final ByteData data = await rootBundle.load(pdfPath);
    final Uint8List bytes = data.buffer.asUint8List();

    await download_helper.saveAndLaunchFile(bytes, pdfPath.split('/').last);
  }
}
