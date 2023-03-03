import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../core/data/repositories/project_repository.dart';
import '../presentation/steps/contact_info.dart';
import '../presentation/steps/project_info.dart';
import 'create_new_project_state.dart';

class CreateNewProjectCubit extends Cubit<CreateNewProjectState> {
  CreateNewProjectCubit() : super(
    CreateNewProjectState(
      scrollController: ScrollController(),
      stepPages: StepPage.items,
      stepPageIndex: 0,
      nameTextEditingController: TextEditingController(),
      startTimeTextEditingController: TextEditingController(),
      finishTimeTextEditingController: TextEditingController(),
      contactInfoFormKey: GlobalKey<FormState>()
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
         state.stepPages[state.stepPageIndex].isDone = true;
         jumpToStepPage(nextPageIndex);
       }
     }
  }

  bool validateStepsPage() {
    switch(state.stepPageIndex) {
      case ProjectInfo.stepPageIndex : {
        if(state.nameTextEditingController.text.isEmpty) {
          emit(state.copyWith(nameTextFieldErrorMessage: "Lütfen ilgili alanı doldurunuz."));
          return false;
        }
        if(state.nameTextEditingController.text.isNotEmpty) {
          emit(state.copyWith(nameTextFieldErrorMessage: null));
        }
        if(state.startTimeTextEditingController.text.isEmpty) {
          emit(state.copyWith(startTimeTextFieldErrorMessage: "Lütfen ilgili alanı doldurunuz."));
          return false;
        }
        if(state.startTimeTextEditingController.text.isNotEmpty) {
          emit(state.copyWith(startTimeTextFieldErrorMessage: null));
          print(state.startTimeTextFieldErrorMessage);
        }
        if(state.finishTimeTextEditingController.text.isEmpty) {
          emit(state.copyWith(finishTimeTextFieldErrorMessage: "Lütfen ilgili alanı doldurunuz."));
          return false;
        }
        if(state.finishTimeTextEditingController.text.isNotEmpty) {
          emit(state.copyWith(finishTimeTextFieldErrorMessage: null));
        }
        return true;
      }
      case ContactInfo.stepPageIndex : {
        if(state.contactInfoFormKey.currentState!.validate()) {
          return true;
        } else {
          return false;
        }
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
    state.startTimeTextEditingController.text = DateFormat("dd/MM/yyyy").format(dateTime);
    emit(state.copyWith(startTime: dateTime));
  }
  void setFinishTime(DateTime dateTime) {
    state.finishTimeTextEditingController.text = DateFormat("dd/MM/yyyy").format(dateTime);
    emit(state.copyWith(finishTime: dateTime));
  }

  final ProjectRepository _projectRepository = ProjectRepository();

  void insertProject() {}
}
