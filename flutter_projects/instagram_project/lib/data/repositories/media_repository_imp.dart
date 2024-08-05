import 'package:flutter/material.dart';
import 'package:instagram_project/data/services/media_service/media_serivce.dart';
import 'package:instagram_project/domin/repositories/media_repository.dart';

class MediaRepostoryImp implements MediaRepository {
  MediaRepostoryImp({required this.mediaService});

  final MediaService mediaService;

  @override
  Future<FileImage?> uploadFromCamera() {
    return mediaService.uploadFromCamera();
  }

  @override
  Future<FileImage?> uploadPicture() {
    return mediaService.uploadPicture();
  }
}
