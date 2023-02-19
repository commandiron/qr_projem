import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(
    AuthState(
      isFirebaseUserExist: false
    )
  );

  final AuthRepository _authRepository = AuthRepository();

  void getFirebaseUser() {
    emit(
      AuthState(
        isFirebaseUserExist: _authRepository.getFirebaseUser() != null
      )
    );
  }

  void singInWithPhoneNumber(String phoneNumber) async {
    _authRepository.singInWithPhoneNumber(phoneNumber);
  }
}
