
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';


typedef FDocumentSnapshot = DocumentSnapshot<Map<String, dynamic>>;
late final FirebaseDatabase firebaseDatabase;

abstract class OtherUserService {
  Stream<QuerySnapshot<Map<String, dynamic>>> getUsersFromCollection();
}
