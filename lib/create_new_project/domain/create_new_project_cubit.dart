import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/create_new_project/presentation/steps/company_logo.dart';

import '../../core/data/repositories/project_repository.dart';
import '../presentation/steps/contact_info.dart';
import '../presentation/steps/project_images.dart';
import '../presentation/steps/project_info.dart';
import 'create_new_project_state.dart';

class CreateNewProjectCubit extends Cubit<CreateNewProjectState> {
  CreateNewProjectCubit() : super(
    CreateNewProjectState(
      scrollController: ScrollController(),
      stepPages: StepPage.items,
      stepPageIndex: 0,
      projectInfoFormKey: GlobalKey<FormState>(),
      contactInfoFormKey: GlobalKey<FormState>(),
    )
  );

  void init() {
    state.stepPages.sort((a, b) => a.index.compareTo(b.index),);
  }

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
    switch(state.stepPageIndex) {
      case ProjectInfo.stepPageIndex : {
        if(state.projectInfoFormKey.currentState!.validate()) {
          state.projectInfoFormKey.currentState!.save();
          return true;
        } else {
          return false;
        }
      }
      case ContactInfo.stepPageIndex : {
        if(state.contactInfoFormKey.currentState!.validate()) {
          state.contactInfoFormKey.currentState!.save();
          return true;
        } else {
          return false;
        }
      }
      case CompanyLogo.stepPageIndex : {
        if(state.companyImage != null) {
          return true;
        } else {
          return false;
        }
      }
      case ProjectImages.stepPageIndex : {
        if(state.projectImages != null) {
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

  void saveName(String? name) {
    emit(state.copyWith(name: name));
  }
  void saveStartTime(DateTime? startTime) {
    emit(state.copyWith(startTime: startTime));
  }
  void saveFinishTime(DateTime? finishTime) {
    emit(state.copyWith(finishTime: finishTime));
  }

  void savePhoneNumber(String? phoneNumber) {
    emit(state.copyWith(companyPhone: phoneNumber));
  }
  void saveEmail(String? email) {
    emit(state.copyWith(companyMail: email));
  }
  void saveAddress(String? address) {
    emit(state.copyWith(companyAddress: address));
  }
  void saveLocationUrl(String? locationUrl) {
    emit(state.copyWith(companyLocationUrl: locationUrl));
  }

  void saveCompanyImage(Uint8List image) {
    emit(state.copyWith(companyImage: image));
  }

  void saveProjectImages(List<Uint8List> images) {
    const imageLimit = 4;
    if(images.length > imageLimit) {
      images.removeRange(images.length - (images.length - imageLimit), images.length);
    }
    emit(state.copyWith(projectImages: images));
  }



  void jumpToStepPage(int index) {
    emit(state.copyWith(stepPageIndex: index));
  }

  final ProjectRepository _projectRepository = ProjectRepository();

  void insertProject() {}
}
