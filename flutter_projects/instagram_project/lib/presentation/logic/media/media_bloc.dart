import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:instagram_project/domin/repositories/media_repository.dart';


part 'media_event.dart';
part 'media_state.dart';

class MediaBloc extends Bloc<MediaEvent, MediaState> {
  MediaBloc(this._mediaRepository) : super(MediaInitial()) {
    on<UploadPictureFromCameraEvent>(_mapOnUploadPictureFromCameraEventToState);
    on<UploadPictureFromGalleryEvent>(
        _mapOnUploadPictureFromGalleryEventToState);
  }
  final MediaRepository _mediaRepository;

  FutureOr<void> _mapOnUploadPictureFromCameraEventToState(
      UploadPictureFromCameraEvent event, Emitter<MediaState> emit) async {
    try {
      emit(MediaLoading());
      final FileImage? fileImage = await _mediaRepository.uploadFromCamera();
      emit(MediaLoaded(fileImage: fileImage));
    } catch (e) {
      emit(MediaFailed(error: e.toString()));
    }
  }

  FutureOr<void> _mapOnUploadPictureFromGalleryEventToState(
      UploadPictureFromGalleryEvent event, Emitter<MediaState> emit) async {
    try {
      emit(MediaLoading());
      final FileImage? fileImage = await _mediaRepository.uploadPicture();
      emit(MediaLoaded(fileImage: fileImage));
    } catch (e) {
      emit(MediaFailed(error: e.toString()));
    }
  }
}
