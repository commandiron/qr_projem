import 'package:qr_projem/core/presentation/helper/ui_state.dart';

class SelectPlanState {
  UiState uiState;
  String? projectId;
  bool isPlanSelected;

  SelectPlanState(
    {
      required this.uiState,
      this.projectId,
      required this.isPlanSelected
    }
  );

  SelectPlanState copyWith(
      {
        UiState? uiState,
        String? projectId,
        bool? isPlanSelected,
      }
      ) {
    return SelectPlanState(
      uiState: uiState ?? this.uiState,
      projectId: projectId ?? this.projectId,
      isPlanSelected: isPlanSelected ?? this.isPlanSelected
    );
  }
}

