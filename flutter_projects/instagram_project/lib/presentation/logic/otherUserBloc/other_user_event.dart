part of 'other_user_bloc.dart';

sealed class OtherUserEvent extends Equatable {
  const OtherUserEvent();

  @override
  List<Object> get props => [];
}

class GetUsersCollectionEvent extends OtherUserEvent {
  const GetUsersCollectionEvent();
}
