
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_project/data/services/other_user_service/other_user_service.dart';

class OtherUserServiceImp implements OtherUserService {

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getUsersFromCollection() {
    return FirebaseFirestore.instance.collection('users').snapshots();
}
  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserFromCollection(
    String userId) {
  return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .snapshots();
}

}



