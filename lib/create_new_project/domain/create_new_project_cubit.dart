import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/create_new_project/domain/entiries/project_entry.dart';
import 'package:qr_projem/create_new_project/presentation/steps/company_logo/company_logo.dart';

import '../../core/data/repositories/project_repository.dart';
import '../presentation/steps/apartments_info/apartments_info.dart';
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
      apartmentInfoFormKeys: [],
      projectEntry: ProjectEntry()
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
      case ApartmentsInfo.stepPageIndex : {
        if(validateApartmentsInfo()) {
          return true;
        }
        return false;
      }
      default : {
        return false;
      }
    }
  }

  void saveName(String name) {
    emit(state.copyWith(projectEntry: state.projectEntry.copyWith(name: name)));
  }
  void saveStartTime(DateTime startTime) {
    emit(state.copyWith(projectEntry: state.projectEntry.copyWith(startTime: startTime)));
  }
  void saveEstimatedFinishTime(DateTime estimatedFinishTime) {
    emit(state.copyWith(projectEntry: state.projectEntry.copyWith(estimatedFinishTime: estimatedFinishTime)));
  }
  void savePhoneNumber(String phoneNumber) {
    emit(state.copyWith(projectEntry: state.projectEntry.copyWith(companyPhone: phoneNumber)));
  }
  void saveEmail(String email) {
    emit(state.copyWith(projectEntry: state.projectEntry.copyWith(companyMail: email)));
  }
  void saveAddress(String address) {
    emit(state.copyWith(projectEntry: state.projectEntry.copyWith(companyAddress: address)));
  }
  void saveLocationUrl(String locationUrl) {
    emit(state.copyWith(projectEntry: state.projectEntry.copyWith(companyLocationUrl: locationUrl)));
  }
  bool validateCompanyLogo() {
    if(state.projectEntry.companyLogo == null) {
      return false;
    }
    return true;
  }
  void saveCompanyLogo(Uint8List image) {
    emit(state.copyWith(projectEntry: state.projectEntry.copyWith(companyLogo: image)));
    validateCompanyLogo();
  }
  bool validateProjectImages() {
    if(state.projectEntry.projectImages == null) {
      return false;
    }
    if(state.projectEntry.projectImages!.isEmpty) {
      return false;
    }
    return true;
  }
  void saveProjectImages(List<Uint8List> images) {
    const imageLimit = 4;
    if(images.length > imageLimit) {
      images.removeRange(images.length - (images.length - imageLimit), images.length);
    }
    emit(state.copyWith(projectEntry: state.projectEntry.copyWith(projectImages: images)));
    validateProjectImages();
  }
  void removeProjectImage(int imageIndex) {
    final newImages = state.projectEntry.projectImages?..removeAt(imageIndex);
    emit(state.copyWith(projectEntry: state.projectEntry.copyWith(projectImages: newImages)));
  }
  void addApartment() {
    const apartmentLimit = 3;
    final apartments = (state.projectEntry.apartments ?? []);
    if(apartments.length < apartmentLimit) {
      final newApartments = apartments..add(ApartmentEntry());
      final newFormKeys = (state.apartmentInfoFormKeys)..add(GlobalKey<FormState>());
      emit(
        state.copyWith(
          projectEntry: state.projectEntry.copyWith(apartments: newApartments),
          apartmentInfoFormKeys: newFormKeys
        ),
      );
    }
  }
  void removeApartment(int apartmentIndex) {
    final apartments = state.projectEntry.apartments;
    if(apartments != null) {
      final newApartments = apartments..removeAt(apartmentIndex);
      final newFormKeys = (state.apartmentInfoFormKeys)..removeAt(apartmentIndex);
      emit(
        state.copyWith(
          projectEntry: state.projectEntry.copyWith(apartments: newApartments),
          apartmentInfoFormKeys: newFormKeys
        )
      );
    }
  }
  bool validateApartmentsInfo() {
    if(state.projectEntry.apartments == null) {
      return false;
    }

    for (var saleAreaInfoFormKey in state.apartmentInfoFormKeys) {
      if(saleAreaInfoFormKey.currentState!.validate()) {
        saleAreaInfoFormKey.currentState!.save();
      }
    }

    for(var apartment in state.projectEntry.apartments!) {
      if(apartment.images == null) {
        return false;
      }
      if(apartment.images!.isEmpty) {
        return false;
      }
    }

    if(state.apartmentInfoFormKeys.any((saleAreaInfoFormKey) => !saleAreaInfoFormKey.currentState!.validate())) {
      return false;
    }
    return true;
  }
  void saveApartmentImages(List<Uint8List> images, int index) {
    const imageLimit = 2;
    if(images.length > imageLimit) {
      images.removeRange(images.length - (images.length - imageLimit), images.length);
    }
    if(state.projectEntry.apartments != null) {
      final apartment = state.projectEntry.apartments![index];
      final newApartment = apartment.copyWith(images: images);
      final newApartments = state.projectEntry.apartments;
      newApartments![index] = newApartment;
      emit(
        state.copyWith(
          projectEntry: state.projectEntry.copyWith(apartments: newApartments),
        )
      );
    }
  }
  void removeApartmentImage(int index, int imageIndex) {
    if(state.projectEntry.apartments != null) {
      final images = state.projectEntry.apartments![index].images?..removeAt(imageIndex);
      final apartment = state.projectEntry.apartments![index];
      final newApartment = apartment.copyWith(images: images);
      final newApartments = state.projectEntry.apartments;
      newApartments![index] = newApartment;
      emit(state.copyWith(projectEntry: state.projectEntry.copyWith(apartments: newApartments)));
    }
  }
  void saveApartmentTitle(String title, int index) {
    if(state.projectEntry.apartments != null) {
      final apartment = state.projectEntry.apartments![index];
      final newApartment = apartment.copyWith(title: title);
      final newApartments = state.projectEntry.apartments;
      newApartments![index] = newApartment;
      emit(
        state.copyWith(
          projectEntry: state.projectEntry.copyWith(apartments: newApartments)
        )
      );
    }
  }
  void saveApartmentType(String type, int index) {
    if(state.projectEntry.apartments != null) {
      final apartment = state.projectEntry.apartments![index];
      final newApartment = apartment.copyWith(type: type);
      final newApartments = state.projectEntry.apartments;
      newApartments![index] = newApartment;
      emit(
        state.copyWith(
          projectEntry: state.projectEntry.copyWith(apartments: newApartments),
        )
      );
    }
  }
  void saveApartmentNetArea(String netArea, int index) {
    if(state.projectEntry.apartments != null) {
      final apartment = state.projectEntry.apartments![index];
      final newApartment = apartment.copyWith(netArea: netArea);
      final newApartments = state.projectEntry.apartments;
      newApartments![index] = newApartment;
      emit(
        state.copyWith(
          projectEntry: state.projectEntry.copyWith(apartments: newApartments),
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
