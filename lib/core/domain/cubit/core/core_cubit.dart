
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/auth_repository.dart';
import 'core_state.dart';

class CoreCubit extends Cubit<CoreState> {

  CoreCubit() : super(CoreState(isUserAuthenticated: false));

  final AuthRepository _authRepository = AuthRepository();


  Future<void> getCurrentUser() async {
    _authRepository.getFirebaseUser(
      (user) {
        emit(
          CoreState(isUserAuthenticated: user != null)
        );
      }
    );
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
  }
}
