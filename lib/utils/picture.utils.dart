import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PictureUtils {

  ///
  /// Opens the dialog for picture choice
  ///
  Future<File> getImage(BuildContext context) async {
    File file;
    if (Theme.of(context).platform ==
        TargetPlatform.android) {
      file = await FilePicker.getFile(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png', 'jpeg'],
      );
    } else if (Theme.of(context).platform ==
        TargetPlatform.iOS) {
      file = await _getImage(ImageSource.gallery);
    }
    return file;
  }

  /// Helper for IOS get image
  Future<File> _getImage(ImageSource _source) async {
    return await ImagePicker.pickImage(source: _source);
  }

}