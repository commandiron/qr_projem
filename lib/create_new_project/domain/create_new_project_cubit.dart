import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/create_new_project/presentation/steps/company_logo/company_logo.dart';
import 'package:qr_projem/create_new_project/presentation/steps/sale_area_info/sale_area_info.dart';

import '../../core/data/repositories/project_repository.dart';
import '../presentation/steps/contact_info/contact_info.dart';
import '../presentation/steps/project_images/project_images.dart';
import '../presentation/steps/project_info/project_info.dart';
import 'create_new_project_state.dart';
import 'entiries/apartment_entry.dart';

class CreateNewProjectCubit extends Cubit<CreateNewProjectState> {
  CreateNewProjectCubit() : super(
    CreateNewProjectState(
      scrollController: ScrollController(),
      stepPages: StepPage.items,
      stepPageIndex: 0,
      projectInfoFormKey: GlobalKey<FormState>(),
      contactInfoFormKey: GlobalKey<FormState>(),
      validationResult: true,
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
        }
        return false;
      }
      case ContactInfo.stepPageIndex : {
        if(state.contactInfoFormKey.currentState!.validate()) {
          state.contactInfoFormKey.currentState!.save();
          return true;
        }
        return false;
      }
      case CompanyLogo.stepPageIndex : {
        if(validateCompanyLogo()) {
          return true;
        }
        return false;
      }
      case ProjectImages.stepPageIndex : {
        if(validateProjectImages()) {
          return true;
        }
        return false;
      }
      case SaleAreaInfo.stepPageIndex : {
        if(state.apartments != null) {
          if(state.apartments!.any(
              (element) =>
                element.title != null
                  || element.imageUrls!= null
                  || element.type!= null
                  || element.netArea!= null
                  || element.grossArea!= null
            )
          ) {
            return true;
          }
          return false;
        }
        return false;
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
  void saveEstimatedFinishTime(DateTime? estimatedFinishTime) {
    emit(state.copyWith(estimatedFinishTime: estimatedFinishTime));
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

  bool validateCompanyLogo() {
    if(state.companyLogo == null) {
      emit(state.copyWith(validationResult: false));
      return false;
    }
    emit(state.copyWith(validationResult: true));
    return true;
  }
  void saveCompanyLogo(Uint8List image) {
    emit(state.copyWith(companyLogo: image));
    validateCompanyLogo();
  }

  bool validateProjectImages() {
    if(state.projectImages == null) {
      emit(state.copyWith(validationResult: false));
      return false;
    }
    if(state.projectImages!.isEmpty) {
      emit(state.copyWith(validationResult: false));
      return false;
    }
    emit(state.copyWith(validationResult: true));
    return true;
  }
  void saveProjectImages(List<Uint8List> images) {
    const imageLimit = 4;
    if(images.length > imageLimit) {
      images.removeRange(images.length - (images.length - imageLimit), images.length);
    }
    emit(state.copyWith(projectImages: images));
    validateProjectImages();
  }
  void removeProjectImage(int imageIndex) {
    final images = state.projectImages;
    images?.removeAt(imageIndex);
    emit(state.copyWith(projectImages: images));
  }

  void addApartment() {
    const apartmentLimit = 3;
    List<ApartmentEntry>? newApartments;
    if(state.apartments == null) {
      newApartments = [];
      newApartments.add(ApartmentEntry());
    } else {
      newApartments = state.apartments;
      if(state.apartments!.length < apartmentLimit) {
        newApartments?.add(ApartmentEntry());
      }
    }
    emit(state.copyWith(apartments: newApartments));
  }
  void saveApartmentName(String title, int index) {
    if(state.apartments != null) {
      emit(
        state.copyWith(
          apartments: state.apartments!.map(
            (apartment) => apartment.copyWith(
              title: title
            )
          ).toList()
        )
      );
    }
  }

  void jumpToStepPage(int index) {
    emit(state.copyWith(stepPageIndex: index));
  }

  final ProjectRepository _projectRepository = ProjectRepository();

  void insertProject() {}
}
