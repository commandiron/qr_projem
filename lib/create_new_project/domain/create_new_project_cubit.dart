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
      saleAreaInfoFormKeys: [],
      pickedImageValidationResult: true,
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
        if(validateSaleAreaInfo()) {
          return true;
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
      emit(state.copyWith(pickedImageValidationResult: false));
      return false;
    }
    emit(state.copyWith(pickedImageValidationResult: true));
    return true;
  }
  void saveCompanyLogo(Uint8List image) {
    emit(state.copyWith(companyLogo: image));
    validateCompanyLogo();
  }

  bool validateProjectImages() {
    if(state.projectImages == null) {
      emit(state.copyWith(pickedImageValidationResult: false));
      return false;
    }
    if(state.projectImages!.isEmpty) {
      emit(state.copyWith(pickedImageValidationResult: false));
      return false;
    }
    emit(state.copyWith(pickedImageValidationResult: true));
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
    List<GlobalKey<FormState>>? newFormKeys;
    if(state.apartments == null) {
      newApartments = [];
      newApartments.add(ApartmentEntry());
      newFormKeys = [];
      newFormKeys.add(GlobalKey<FormState>());
    } else {
      newApartments = state.apartments;
      newFormKeys = state.saleAreaInfoFormKeys;
      if(state.apartments!.length < apartmentLimit) {
        newApartments?.add(ApartmentEntry());
        newFormKeys.add(GlobalKey<FormState>());
      }
    }
    emit(state.copyWith(apartments: newApartments, saleAreaInfoFormKeys: newFormKeys));
  }
  void removeApartment(int apartmentIndex) {
    if(state.apartments != null) {
      final newApartments = state.apartments;
      newApartments!.removeAt(apartmentIndex);
      final newFormKeys = state.saleAreaInfoFormKeys;
      newFormKeys.removeAt(apartmentIndex);
      emit(state.copyWith(apartments: newApartments, saleAreaInfoFormKeys: newFormKeys));
    }
  }
  bool validateSaleAreaInfo() {
    if(state.apartments == null) {
      emit(state.copyWith(pickedImageValidationResult: false));
      return false;
    }

    for(var apartment in state.apartments!) {
      if(apartment.images == null) {
        emit(state.copyWith(pickedImageValidationResult: false));
        return false;
      }
    }

    emit(state.copyWith(pickedImageValidationResult: true));

    for (var saleAreaInfoFormKey in state.saleAreaInfoFormKeys) {
      if(saleAreaInfoFormKey.currentState!.validate()) {
        saleAreaInfoFormKey.currentState!.save();
      }
    }

    if(state.saleAreaInfoFormKeys.any((saleAreaInfoFormKey) => !saleAreaInfoFormKey.currentState!.validate())) {
      return false;
    }
    return true;
  }
  void saveApartmentImages(List<Uint8List> images, int index) {
    const imageLimit = 2;
    final newImages = images;
    if(images.length > imageLimit) {
      newImages.removeRange(images.length - (images.length - imageLimit), images.length);
    }
    if(state.apartments != null) {
      final apartment = state.apartments![index];
      final newApartment = apartment.copyWith(images: newImages);
      final newApartments = state.apartments;
      newApartments![index] = newApartment;
      emit(
        state.copyWith(
          apartments: newApartments
        )
      );
    }
  }
  void removeApartmentImage(int index, int imageIndex) {
    if(state.apartments != null) {
      final images = state.apartments![index].images;
      images?.removeAt(imageIndex);
      final apartment = state.apartments![index];
      final newApartment = apartment.copyWith(images: images);
      final newApartments = state.apartments;
      newApartments![index] = newApartment;
      emit(state.copyWith(apartments: newApartments));
    }
  }
  void saveApartmentTitle(String title, int index) {
    if(state.apartments != null) {
      final apartment = state.apartments![index];
      final newApartment = apartment.copyWith(title: title);
      final newApartments = state.apartments;
      newApartments![index] = newApartment;
      emit(
        state.copyWith(
          apartments: newApartments
        )
      );
    }
  }
  void saveApartmentType(String type, int index) {
    if(state.apartments != null) {
      final apartment = state.apartments![index];
      final newApartment = apartment.copyWith(type: type);
      final newApartments = state.apartments;
      newApartments![index] = newApartment;
      emit(
        state.copyWith(
          apartments: newApartments
        )
      );
    }
  }
  void saveApartmentNetArea(String netArea, int index) {
    if(state.apartments != null) {
      final apartment = state.apartments![index];
      final newApartment = apartment.copyWith(netArea: netArea);
      final newApartments = state.apartments;
      newApartments![index] = newApartment;
      emit(
        state.copyWith(
          apartments: newApartments
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
