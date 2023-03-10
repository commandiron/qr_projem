
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/auth_repository.dart';
import 'core_state.dart';

class CoreCubit extends Cubit<CoreState> {

  CoreCubit(this.authRepository,) : super(
    CoreState(
      isUserAuthenticated: false,
      isUserAdmin: false
    )
  );

  final AuthRepository authRepository;

  Future<void> getCurrentUser() async {
    authRepository.user.listen((user) {
      if(state.isUserAuthenticated == false) {
        if(user != null) {
          if(user.uid == "We6kFC7cKVgAtPa8zV0SukNPCnH3") {
            emit(
              CoreState(isUserAuthenticated: true, isUserAdmin: true, userUid: user.uid)
            );
          } else {
            emit(
              CoreState(isUserAuthenticated: true, isUserAdmin: false, userUid: user.uid)
            );
          }       
        }
      } else {
        if(state.isUserAuthenticated == true) {
          if(user == null) {
            emit(
              CoreState(isUserAuthenticated: false, isUserAdmin: false, userUid: null)
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
