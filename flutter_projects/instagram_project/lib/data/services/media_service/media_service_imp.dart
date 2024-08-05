import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_project/data/services/media_service/media_serivce.dart';

class MediaServiceImp implements MediaService {
  ImagePicker get picker => ImagePicker();

  @override
  Future<FileImage?> uploadFromCamera() async {
    XFile? xFile = await picker.pickImage(source: ImageSource.camera);
    if (xFile != null) {
      return FileImage(File(xFile.path));
    }
    return null;
  }

  @override
  Future<FileImage?> uploadPicture() async {
    XFile? xFile = await picker.pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      return FileImage(File(xFile.path));
    }
    return null;
  }
}
