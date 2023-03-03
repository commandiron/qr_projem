import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/data/repositories/project_repository.dart';
import '../presentation/steps/contact_info.dart';
import '../presentation/steps/project_info.dart';
import 'create_new_project_state.dart';

class CreateNewProjectCubit extends Cubit<CreateNewProjectState> {
  CreateNewProjectCubit() : super(
    CreateNewProjectState(
      scrollController: ScrollController(),
      stepPages: [
        StepPage(
            index: ProjectInfo.stepPageIndex,
            title: "Proje Bilgileri",
            view: const ProjectInfo(),
            isDone: false
        ),
        StepPage(
            index: ContactInfo.stepPageIndex,
            title: "İletişim Bilgileri",
            view: const ContactInfo(),
            isDone: true
        ),
      ],
      stepPageIndex: 0,
      nameTextEditingController: TextEditingController(),
    )
  );

  void back() {
    final backPageIndex = state.stepPageIndex - 1;
    if(backPageIndex > -1) {
      jumpToStepPage(backPageIndex);
    }
  }

  void next() {
     if(validateStepsPage()) {
       final nextPageIndex = state.stepPageIndex + 1;
       if(nextPageIndex < state.stepPages.length) {
         jumpToStepPage(nextPageIndex);
       }
     }
  }

  bool validateStepsPage() {
    switch(state.stepPages[state.stepPageIndex].index) {
      case ProjectInfo.stepPageIndex : {
        if(state.nameTextEditingController.text.isNotEmpty) {
          return true;
        } else {
          emit(state.copyWith(nameTextFieldErrorMessage: "Lütfen ilgili alanı doldurunuz."));
          return false;
        }
      }
      case ContactInfo.stepPageIndex : {
        return true;
      }
      default : {
        return false;
      }
    }
  }

  void jumpToStepPage(int index) {
    emit(state.copyWith(stepPageIndex: index));
  }

  void setStartTime(DateTime dateTime) {
    emit(state.copyWith(startTime: dateTime));
  }
  void setFinishTime(DateTime dateTime) {
    emit(state.copyWith(finishTime: dateTime));
  }

  final ProjectRepository _projectRepository = ProjectRepository();

  void insertProject() {}
}
