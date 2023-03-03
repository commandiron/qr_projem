import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/data/repositories/project_repository.dart';
import 'create_new_project_state.dart';

class CreateNewProjectCubit extends Cubit<CreateNewProjectState> {
  CreateNewProjectCubit() : super(
    CreateNewProjectState(
      scrollController: ScrollController(),
      nameTextEditingController: TextEditingController(),
    )
  );

  void setStartTime(DateTime dateTime) {
    emit(state.copyWith(startTime: dateTime));
  }
  void setFinishTime(DateTime dateTime) {
    emit(state.copyWith(finishTime: dateTime));
  }

  final ProjectRepository _projectRepository = ProjectRepository();

  void insertProject() {}
}
