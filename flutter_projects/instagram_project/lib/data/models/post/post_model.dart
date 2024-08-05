import 'package:json_annotation/json_annotation.dart';
part 'post_model.g.dart';
@JsonSerializable()
class Post {
  final String? userId;
  
  final String? postUrl;
  final num? timestamp;
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
  Post(this.postUrl, this.userId, this.timestamp);
}