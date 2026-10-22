import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p1210_5/bloc/user_event.dart';
import 'package:p1210_5/bloc/user_state.dart';
import 'package:p1210_5/model/user.dart';
import 'package:p1210_5/services/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserEmptyState()) {
    on<UserLoadEvent>((event, emit) async {
      emit(UserLoadingState());

      try {
        final List<User> loadedUserList = await userRepository.getAllUsers();

        emit(UserLoadedState(loadedUser: loadedUserList));
      } catch (_) {
        emit(UserErrorState());
      }
    });

    on<UserClearEvent>((event, emit) {
      emit(UserEmptyState());
    });
  }
}

// class UserBloc extends Bloc<UserEvent, UserState> {
//   final UserRepository userRepository;
//   UserBloc({required this.userRepository}) : super(UserEmptyState()) {
//     on<UserLoadEvent>((event, emit) async {
//       emit(UserLoadingState());

//       try {
//         final List<User> loadedUserList = await userRepository.getAllUsers();
//         emit(UserLoadedState(loadedUser: loadedUserList));
//       } catch (_) {
//         emit(UserErrorState());
//       }
//     });
//     on<UserClearEvent>((event, emit) async {
//       emit(UserEmptyState());
//     });
//   }
// }
