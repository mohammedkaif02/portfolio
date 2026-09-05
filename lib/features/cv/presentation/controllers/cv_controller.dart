import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/features/cv/domain/usecases/download_cv_usecase.dart';

class CVController extends GetxController {
  final DownloadCVUseCase downloadCVUseCase;

  CVController({required this.downloadCVUseCase});

  final RxBool isHoveringDownload = false.obs;
  final RxBool isDownloading = false.obs;

  void onHover(bool hover) {
    isHoveringDownload.value = hover;
  }

  Future<void> downloadCV() async {
    isDownloading.value = true;
    try {
      final result = await downloadCVUseCase.execute();
      result.when(
        success: (_) => debugPrint("CV opened/downloaded successfully"),
        error:
            (failure) => debugPrint("Error downloading CV: ${failure.message}"),
      );
    } catch (e) {
      debugPrint("Error downloading CV: $e");
    } finally {
      isDownloading.value = false;
    }
  }
}
