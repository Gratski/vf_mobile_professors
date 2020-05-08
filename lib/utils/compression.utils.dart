import 'dart:io';
import 'dart:math' as math;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path/path.dart';

class CompressionUtils {

  ////////////////////////////////////////
  // Compression Helper
  ////////////////////////////////////////
  Future<File> compressAndGetFile(File file) async {
    String filename = basename(file.path);
    Directory dir = await path_provider.getTemporaryDirectory();
    final targetPath = dir.absolute.path +
        "/vfit_${DateTime.now().toIso8601String()}_$filename";

    var compressedFile = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path, targetPath,
        minWidth: 400, quality: 25);

    return compressedFile;
  }

  ///
  /// Calculates the compressed file size
  ///
  Future<int> compressAndGetFileSize(File file) async {
    final compressedFile = await compressAndGetFile(file);
    return await compressedFile.length();
  }

  double _calcScale({
    double srcWidth,
    double srcHeight,
    double minWidth,
    double minHeight,
  }) {
    var scaleW = srcWidth / minWidth;
    var scaleH = srcHeight / minHeight;

    var scale = math.max(1.0, math.min(scaleW, scaleH));

    return scale;
  }

}