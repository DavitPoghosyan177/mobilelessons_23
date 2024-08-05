import 'dart:io';

import 'package:instagram_project/data/models/post/post_model.dart';
import 'package:instagram_project/domin/entities/user_entity.dart';

abstract class PostRepository {
  Stream<List<Post>> getAllPostsByUserId(String userId);
  Future<void> uploadProfilePicture(String userId, File file);
  Future<void> uploadProfilePosts(String userId, File file);
  Future<UserEntity> getUserForPostById(String userId);
}
