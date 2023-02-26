
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/auth_repository.dart';
import 'core_state.dart';

class CoreCubit extends Cubit<CoreState> {

  CoreCubit(this.authRepository,) : super(
    CoreState(
      isUserAuthenticated: false
    )
  );

  final AuthRepository authRepository;

  Future<void> getCurrentUser() async {

    authRepository.user.listen((user) {
      if(state.isUserAuthenticated == false) {
        if(user != null) {
          emit(
            CoreState(isUserAuthenticated: true)
          );
        }
      } else {
        if(state.isUserAuthenticated == true) {
          if(user == null) {
            emit(
              CoreState(isUserAuthenticated: false)
            );
          }
        }
      }
    });
  }

  Future<void> signOut() async {
    await authRepository.signOut();
  }
}
