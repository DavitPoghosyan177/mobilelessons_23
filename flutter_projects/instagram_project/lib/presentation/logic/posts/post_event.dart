part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class GetAllPostsByUserIdEvent extends PostEvent {
  final String userId;
  const GetAllPostsByUserIdEvent({
    required this.userId,
  });
}
class UploadProfilePhotoEvent extends PostEvent {
  const UploadProfilePhotoEvent(this.userId, this.file);
  final String userId;
  final File file;
}
class UploadProfilePostEvent extends PostEvent {
  const UploadProfilePostEvent(this.userId, this.file);
  final String userId;
  final File file;
}
class GetUserByIdForPostEvent extends PostEvent {
  final String userId;
  const GetUserByIdForPostEvent({required this.userId});
}
