import 'package:json_annotation/json_annotation.dart';
import '../../data/models/user_model.dart';

class UserEntity {
  UserEntity({
    this.userId,
    this.email,
    this.displayName,
    this.photoUrl,

  });
  factory UserEntity.fromModel(UserModel userModel) {
    return UserEntity(
        userId: userModel.userId,
        email: userModel.email,
        displayName: userModel.displayName,
        photoUrl: userModel.photoUrl);
  }
  UserModel toModel(){
    return UserModel(
       userId: userId,
        email: email,
        displayName: displayName,
        photoUrl: photoUrl,
    );
  }
  final String? userId;
  @JsonKey(includeIfNull: false)
  final String? email;
  @JsonKey(includeIfNull: false)
  final String? displayName;
  @JsonKey(includeIfNull: false)
  final String? photoUrl;
}
