
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/auth_repository.dart';
import 'core_state.dart';

class CoreCubit extends Cubit<CoreState> {
  final AuthRepository authRepository;
  CoreCubit(this.authRepository,) : super(CoreState(isUserAuthenticated: false));

  Future<void> getCurrentUser() async {
    authRepository.getFirebaseUser(
      (user) {
        print(user);
        emit(
          CoreState(isUserAuthenticated: user != null)
        );
      }
    );
  }

  Future<void> signOut() async {
    await authRepository.signOut();
  }
}
