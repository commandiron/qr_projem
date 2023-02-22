
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/auth_repository.dart';
import 'core_state.dart';

class CoreCubit extends Cubit<CoreState> {

  CoreCubit() : super(CoreState(isUserAuthenticated: false));

  final AuthRepository _authRepository = AuthRepository();


  Future<void> getCurrentUser() async {
    emit(
      CoreState(isUserAuthenticated: await _authRepository.getFirebaseUser() != null)
    );
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
    emit(
      CoreState(isUserAuthenticated: await _authRepository.getFirebaseUser() != null)
    );
  }
}
