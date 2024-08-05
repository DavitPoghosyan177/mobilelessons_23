// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      json['postUrl'] as String?,
      json['userId'] as String?,
      json['timestamp'] as num?,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'userId': instance.userId,
      'postUrl': instance.postUrl,
      'timestamp': instance.timestamp,
    };
