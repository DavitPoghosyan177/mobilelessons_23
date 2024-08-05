import 'dart:io';
import 'package:instagram_project/data/models/post/post_model.dart';
import 'package:instagram_project/data/services/post_service/post_service.dart';
import 'package:instagram_project/domin/entities/user_entity.dart';
import 'package:instagram_project/domin/repositories/post_repository.dart';

class PostRepositoryImp implements PostRepository {
  PostRepositoryImp({required this.postService});

  final PostService postService;
 @override
  Stream<List<Post>> getAllPostsByUserId(userId) {
    return postService.getAllPostsByUserId(userId);
  }
  @override
  Future<void> uploadProfilePicture(String userId, File file) async {
    await postService.uploadProfilePicture(userId, file);
  }
@override
  Future<void> uploadProfilePosts(String userId, File file) async {
    await postService.uploadProfilePosts(userId, file);
  }
@override
  Future<UserEntity> getUserForPostById(String userId) {
    return postService.getUserForPostById(userId);
  }
}
