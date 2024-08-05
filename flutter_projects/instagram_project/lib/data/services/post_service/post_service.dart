
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:instagram_project/data/models/post/post_model.dart';
import 'package:instagram_project/data/models/user_model.dart';


typedef FDocumentSnapshot = DocumentSnapshot<Map<String, dynamic>>;
late final FirebaseDatabase firebaseDatabase;

abstract class PostService {
  Stream<List<Post>> getAllPostsByUserId(String userId);
  Future<void> uploadProfilePosts(String userId, File file);
  Future<void> uploadProfilePicture(String userId, File file);
  Future<UserModel> getUserForPostById(String userId);

}
