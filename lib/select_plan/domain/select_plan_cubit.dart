import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/domain/model/project.dart';
import 'package:qr_projem/core/presentation/helper/ui_state.dart';
import 'package:qr_projem/select_plan/domain/select_plan_state.dart';

import '../../core/data/repositories/project_repository.dart';

class SelectPlanCubit extends Cubit<SelectPlanState> {
  SelectPlanCubit(String? projectId) : super(
    SelectPlanState(
      uiState: UiInitial(),
      projectId: projectId,
    )
  );

  void init() {
    if(state.projectId == null) {
      emit(state.copyWith(uiState: UiError()));
    }
  }

  final ProjectRepository _projectRepository = ProjectRepository();

  Future<void> selectStandardPlan() async {
    if(state.projectId != null) {
      emit(state.copyWith(uiState: UiLoading()));
      await _projectRepository.updateProjectPaymentStatus(state.projectId!, PaymentStatus.pendingStandardPlan);
      emit(state.copyWith(uiState: UiSuccess()));
    } else {
      emit(state.copyWith(uiState: UiError()));
    }
  }

  Future<void> selectPersonalizedPlan() async {
    if(state.projectId != null) {
      emit(state.copyWith(uiState: UiLoading()));
      await _projectRepository.updateProjectPaymentStatus(state.projectId!, PaymentStatus.pendingPersonalizedPlan);
      emit(state.copyWith(uiState: UiSuccess()));
    } else {
      emit(state.copyWith(uiState: UiError()));
    }
  }
}
