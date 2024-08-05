import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:instagram_project/data/models/post/post_model.dart';
import 'package:instagram_project/data/models/user_model.dart';
import 'package:instagram_project/data/services/post_service/post_service.dart';



class PostServiceImp implements PostService {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;

  PostServiceImp(this.firebaseFirestore, this.firebaseStorage);

  @override
  Stream<List<Post>> getAllPostsByUserId(String userId) async* {
      Stream getposts = firebaseFirestore
          .collection('posts')
          .where('userId', isEqualTo: userId)
          .orderBy('timestamp', descending: true)
          .snapshots();
          await for(final QuerySnapshot<Map<String, dynamic>> post in getposts){

        yield post.docs.map((e) => Post.fromJson(e.data())).toList();

          }
  }
    @override
  Future<void> uploadProfilePicture(String userId, File file) async {
    final Reference ref = firebaseStorage
        .ref('usersAvatar/')
        .child(Timestamp.now().millisecondsSinceEpoch.toString());
    await ref.putFile(file);
    final String downloadUrl = await ref.getDownloadURL();
    await firebaseFirestore
        .collection('users')
        .doc(userId)
        .update({'photoUrl': downloadUrl});
  }
  @override
  Future<void> uploadProfilePosts(String userId, File file) async {
    final Reference ref = firebaseStorage
        .ref('usersPosts/')
        .child(Timestamp.now().millisecondsSinceEpoch.toString());
    await ref.putFile(file);
    final String downloadUrl = await ref.getDownloadURL();
    await firebaseFirestore
        .collection('posts').add({'userId': userId,
    'postUrl': downloadUrl,
    'timestamp': Timestamp.now().millisecondsSinceEpoch});
  }
  @override
  Future<UserModel> getUserForPostById(String userId) async {
    final FDocumentSnapshot snapshot =
        await firebaseFirestore.collection('users').doc(userId).get();
    if (snapshot.exists && snapshot.data() != null) {
      return UserModel.fromJson(snapshot.data()!);
    }
    throw Exception('User doesn\'t exist');
  }
}
