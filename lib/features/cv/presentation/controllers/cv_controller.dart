import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_portfolio/features/cv/domain/usecases/download_cv_usecase.dart';

class CVController extends GetxController {
  final DownloadCVUseCase downloadCVUseCase;

  CVController({required this.downloadCVUseCase});

  RxBool isHoveringDownload = false.obs;

  void onHover(bool hover) {
    isHoveringDownload.value = hover;
  }

  Future<void> downloadCV() async {
    try {
      await downloadCVUseCase.execute();
    } catch (e) {
      debugPrint("Error downloading CV: $e");
    }
  }
}
