import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:instagram_project/data/models/post/post_model.dart';
import 'package:instagram_project/domin/entities/user_entity.dart';
import 'package:instagram_project/domin/repositories/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc(this.postRepository) : super(PostInitial()) {
    on<GetAllPostsByUserIdEvent>(_mapGetAllPostsByUserIdEventToState);
    on<UploadProfilePostEvent>(_mapUploadProfilePostEventToState);
    on<UploadProfilePhotoEvent>(_mapUploadProfilePhotoEventToState);
    on<GetUserByIdForPostEvent>(_mapGetUserByIdEventToState);
  }

  final PostRepository postRepository;

  Future<void> _mapGetAllPostsByUserIdEventToState(
      GetAllPostsByUserIdEvent event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      await for (var snapshot
          in postRepository.getAllPostsByUserId(event.userId)) {
        emit(PostLoaded(snapshot));
      }
    } catch (error) {
      emit(PostLoadFaild(error.toString()));
    }
  }

  FutureOr<void> _mapUploadProfilePhotoEventToState(
      UploadProfilePhotoEvent event, Emitter<PostState> emit) async {
    try {
      emit(PostLoading());
      await postRepository.uploadProfilePicture(event.userId, event.file);
      add(GetUserByIdForPostEvent(userId: event.userId));
    } catch (e) {
      emit(PostLoadFaild(e.toString()));
    }
  }

  FutureOr<void> _mapUploadProfilePostEventToState(
      UploadProfilePostEvent event, Emitter<PostState> emit) async {
    try {
      emit(PostLoading());
      await postRepository.uploadProfilePosts(event.userId, event.file);
      add(GetUserByIdForPostEvent(userId: event.userId));
    } catch (e) {
      emit(PostLoadFaild(e.toString()));
    }
  }

  FutureOr<void> _mapGetUserByIdEventToState(
      GetUserByIdForPostEvent event, Emitter<PostState> emit) async {
    try {
      emit(PostLoading());
      final UserEntity userEntity =
          await postRepository.getUserForPostById(event.userId);
      emit(UserLoadedForPost(userEntity));
    } catch (e) {
      emit(PostLoadFaild(e.toString()));
    }
  }
}
