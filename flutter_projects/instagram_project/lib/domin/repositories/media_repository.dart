import 'package:flutter/material.dart';

abstract class MediaRepository {
  Future<FileImage?> uploadPicture();
  Future<FileImage?> uploadFromCamera();
}
