import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_project/data/services/other_user_service/other_user_service.dart';
import 'package:instagram_project/domin/repositories/other_user_repository.dart';

class OtherUserRepositoryImp implements OtherUserRepository {
  OtherUserRepositoryImp({required this.otherUserService});

  final OtherUserService otherUserService;

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getUsersFromCollection() {
    return otherUserService.getUsersFromCollection();
  }
// @override
//   Stream<DocumentSnapshot<Map<String, dynamic>>> getUserFromCollection(String userId) {
//     return otherUserService.getUserFromCollection(userId);    
//   }
}
