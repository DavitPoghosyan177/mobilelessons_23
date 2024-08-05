import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:instagram_project/data/models/user_model.dart';
import 'package:instagram_project/domin/entities/user_entity.dart';

typedef FDocumentSnapshot = DocumentSnapshot<Map<String, dynamic>>;
late final FirebaseDatabase firebaseDatabase;

abstract class UserService {
  Future<void> saveUserToDB(UserModel userModel);
  Future<UserModel> getUserById(String userId);
  Future<void> deleteUser(String userId);
  Future<void> signOut();
  Future<bool> isUserExist(String userId);
  Future<void> updateUserData(UserEntity userEntity);
}
