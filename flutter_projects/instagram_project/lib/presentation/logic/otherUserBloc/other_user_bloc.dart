import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:instagram_project/data/models/user_model.dart';
import 'package:instagram_project/domin/entities/user_entity.dart';
import 'package:instagram_project/domin/repositories/other_user_repository.dart';

part 'other_user_event.dart';
part 'other_user_state.dart';

class OtherUserBloc extends Bloc<OtherUserEvent, OtherUserState> {
  OtherUserBloc(this.otherUserRepositories) : super(UserInitial()) {
    on<GetUsersCollectionEvent>(_mapGetUsersCollectionEventToState);
  }

  final OtherUserRepository otherUserRepositories;

  FutureOr<void> _mapGetUsersCollectionEventToState(
      GetUsersCollectionEvent event, Emitter<OtherUserState> emit) async {
    try {
      await for (var snapshot
          in otherUserRepositories.getUsersFromCollection()) {
        final users =
            snapshot.docs.map((doc) => UserModel.fromJson(doc.data())).toList();
        emit(UsersLoaded(users));
      }
    } catch (error) {
      emit(UserError(error.toString()));
    }
  }
}
