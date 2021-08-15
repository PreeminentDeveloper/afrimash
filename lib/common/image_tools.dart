import 'dart:convert';
import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

export 'package:inspireui/utils.dart'
    show HexColor, Videos, GmsTools, EncodeUtils;

class ImageTools {
  static Future<String> compressAndConvertImagesForUploading(
      List<dynamic> images) async {
    var base64 = StringBuffer();
    for (final image in images) {
      base64..write(await compressImage(image))..write(',');
    }
    return base64.toString();
  }

  static Future<String> compressImage(dynamic image) async {
    var base64 = '';
    const quality = 60;
    if (image is Asset) {
      final byteData = await image.getByteData(quality: 100);
      final bytes = byteData.buffer.asUint8List();
      final result = await FlutterImageCompress.compressWithList(
        bytes,
        minHeight: 800,
        minWidth: 800,
        quality: quality,
        format: CompressFormat.jpeg,
      );
      base64 += base64Encode(result);
    }
    if (image is PickedFile) {
      /// disable as not support File on web
      final result = await FlutterImageCompress.compressWithFile(
        File(image.path).absolute.path,
        minWidth: 800,
        minHeight: 800,
        quality: quality,
        format: CompressFormat.jpeg,
      );
      base64 += base64Encode(result);
    }
    if (image is String) {
      if (image.contains('http')) {
        base64 += image;
      }
    }
    return base64;
  }
}
