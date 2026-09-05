import 'package:flutter/services.dart';
import 'package:portfolio/core/utils/download_helper.dart' as download_helper;

abstract class CvFileDataSource {
  Future<void> saveAndLaunchFromAsset({
    required String assetPath,
    required String fileName,
  });
}

class CvFileDataSourceImpl implements CvFileDataSource {
  @override
  Future<void> saveAndLaunchFromAsset({
    required String assetPath,
    required String fileName,
  }) async {
    final ByteData data = await rootBundle.load(assetPath);
    final Uint8List bytes = data.buffer.asUint8List();
    await download_helper.saveAndLaunchFile(bytes, fileName);
  }
}
