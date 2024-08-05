part of 'other_user_bloc.dart';

sealed class OtherUserState extends Equatable {
  const OtherUserState({
    this.users,
  });

  final List<UserEntity>? users;
  
  @override
  List<Object?> get props => [users];
}

final class UserInitial extends OtherUserState {}

final class UserProgress extends OtherUserState {}

final class UsersLoaded extends OtherUserState {
  const UsersLoaded(List<UserEntity> users) : super(users: users);
}

final class UserError extends OtherUserState {
  final String message;

  const UserError(this.message);
}
