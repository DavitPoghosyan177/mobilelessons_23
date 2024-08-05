import 'package:cloud_firestore/cloud_firestore.dart';

abstract class OtherUserRepository {
  Stream<QuerySnapshot<Map<String, dynamic>>> getUsersFromCollection();
  // Stream<DocumentSnapshot<Map<String, dynamic>>> getUserFromCollection(
  //     String userId);
}
