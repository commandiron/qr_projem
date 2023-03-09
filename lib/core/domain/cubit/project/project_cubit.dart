import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:qr_projem/core/domain/cubit/project/project_state.dart';
import 'package:qr_projem/core/domain/model/project.dart';

import '../../../data/repositories/project_repository.dart';

class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit() : super(ProjectState());

  final ProjectRepository _projectRepository = ProjectRepository();

   insertProject(Project project) {
    _projectRepository.insertProject(project);
  }
}
