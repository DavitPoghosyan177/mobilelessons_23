import 'package:flutter/material.dart';

abstract class MediaService {
  Future<FileImage?> uploadPicture();
  Future<FileImage?> uploadFromCamera();
}

