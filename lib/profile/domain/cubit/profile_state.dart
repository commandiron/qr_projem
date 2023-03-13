import '../../../core/domain/model/project.dart';
import '../../../core/presentation/helper/ui_state.dart';

class ProfileState {
  UiState uiState;
  List<Project> projects;

  ProfileState(
    {
      required this.uiState,
      required this.projects
    }
  );

  ProfileState copyWith(
      {
        UiState? uiState,
        List<Project>? projects,
      }
      ) {
    return ProfileState(
      uiState: uiState ?? this.uiState,
      projects: projects ?? this.projects
    );
  }
}
