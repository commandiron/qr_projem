import 'package:qr_projem/core/presentation/helper/ui_state.dart';

class SelectPlanState {
  UiState uiState;
  String? projectId;

  SelectPlanState(
    {
      required this.uiState,
      this.projectId,
    }
  );

  SelectPlanState copyWith(
      {
        UiState? uiState,
        String? projectId,
      }
      ) {
    return SelectPlanState(
      uiState: uiState ?? this.uiState,
      projectId: projectId ?? this.projectId,
    );
  }
}

