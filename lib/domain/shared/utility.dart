import 'dart:convert';
import 'package:architecture/config/logger.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

import 'package:flutter/foundation.dart';

class Utility {

  static hideKeyboard(BuildContext context)=>FocusScope.of(context).unfocus();

  static Uint8List dataFromBase64String(String base64String){

    return base64Decode(base64String);
  }

  static String base64String(Uint8List data) {
    return base64Encode(data);
  }

  static Future<Uint8List?> compressImageSize(Uint8List images) async{

    try {


      const int maxSize = 500 * 1024; // 500 KB

      // Check if the image size is already smaller than the max size
      if (images.lengthInBytes <= maxSize) {
        // No need to compress if it's already small enough
        return images;
      }

      // Calculate the compression ratio to fit within the maxSize
      final double compressionRatio = maxSize / images.lengthInBytes;

      // Create a compressed image

      final img.Image image = img.decodeImage(images)!;
      final img.Image compressedImage = img.copyResize(
        image,
        width: (image.width * compressionRatio).toInt(),
        height: (image.height * compressionRatio).toInt(),
      );

      // Save the compressed image
      final Uint8List compressedBytes = img.encodeJpg(compressedImage,quality: 30);
      Logger.debug(tag: "compressImageSize", message: "Image Compressed");
      return compressedBytes;
    } catch (error) {
      Logger.error(tag: "compressImageSizeTAG",message: "Error on Image Compressed");
      return null;
    }
  }

}
