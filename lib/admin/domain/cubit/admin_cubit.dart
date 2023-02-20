import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/admin/domain/cubit/admin_state.dart';

import '../../../core/data/repositories/project_repository.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit() : super(AdminState());

  final ProjectRepository _projectRepository = ProjectRepository();

  void adminInsert() {
    _projectRepository.adminInsert(
      "We6kFC7cKVgAtPa8zV0SukNPCnH3",
      "0",
      AdminState.projectDemirliIns
    );
  }
}
