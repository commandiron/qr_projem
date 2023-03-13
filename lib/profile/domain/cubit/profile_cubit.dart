import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/data/repositories/project_repository.dart';
import 'package:qr_projem/core/presentation/helper/ui_state.dart';
import 'package:qr_projem/profile/domain/cubit/profile_state.dart';

import '../../../core/domain/model/project.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(
    ProfileState(
      uiState: UiInitial(),
      projects: []
    )
  );

  void init() {
    getUserProjects();
  }

  final ProjectRepository _projectRepository = ProjectRepository();

  Future<void> getUserProjects() async {
    emit(state.copyWith(uiState: UiLoading()));

    final projects = await _projectRepository.getUserProjects();

    if(projects == null) {
      emit(state.copyWith(uiState: UiError()));
      return;
    }

    emit(state.copyWith(uiState: UiSuccess(), projects: projects));
  }

  Future<void> deleteUserProject(int index) async {

    emit(state.copyWith(uiState: UiLoading()));

    if(state.projects[index].paymentStatus == PaymentStatus.approved) {
      emit(state.copyWith(uiState: UiError("Ödeme yapılmış Qr'ı silmek için lütfen iletişime geçin.")));
      return;
    }

    final projectId = state.projects[index].id;
    final result = await _projectRepository.deleteUserProjectById(projectId);
    if(result == null) {
      emit(state.copyWith(uiState: UiError()));
      return;
    }

    await getUserProjects();
  }


}
