import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/select_plan/domain/select_plan_state.dart';

class SelectPlanCubit extends Cubit<SelectPlanState> {
  SelectPlanCubit(String? projectId) : super(SelectPlanState());
}
