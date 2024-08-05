part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState({
    this.posts,
    this.userEntity,
  });

  final List<Post>? posts;
  final UserEntity? userEntity;

  @override
  List<Object?> get props => [
        posts,
        userEntity,
      ];
}

final class PostInitial extends PostState {}

final class PostLoadFaild extends PostState {
  final String message;

  const PostLoadFaild(this.message);
}

final class PostLoading extends PostState {}

class PostLoaded extends PostState {
  const PostLoaded(List<Post> posts) : super(posts: posts);
}

final class UserLoadedForPost extends PostState {
  const UserLoadedForPost(UserEntity? model) : super(userEntity: model);
}
