import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/domain/model/project.dart';
import 'package:qr_projem/select_plan/domain/select_plan_state.dart';

import '../../core/data/repositories/project_repository.dart';

class SelectPlanCubit extends Cubit<SelectPlanState> {
  SelectPlanCubit(String? projectId) : super(
    SelectPlanState(
      projectId: projectId
    )
  );

  final ProjectRepository _projectRepository = ProjectRepository();

  Future<void> selectStandardPlan() async {
    if(state.projectId != null) {
      await _projectRepository.updateProjectPaymentStatus(state.projectId!, PaymentStatus.pendingStandardPlan);
    }
  }

  Future<void> selectPersonalizedPlan() async {
    if(state.projectId != null) {
      await _projectRepository.updateProjectPaymentStatus(state.projectId!, PaymentStatus.pendingPersonalizedPlan);
    }
  }

}
