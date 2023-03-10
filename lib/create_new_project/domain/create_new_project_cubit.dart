import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/data/repositories/storage_repository.dart';
import 'package:qr_projem/core/domain/model/project.dart';
import 'package:qr_projem/core/presentation/helper/ui_state.dart';
import 'package:qr_projem/create_new_project/domain/entiries/project_entry.dart';
import 'package:qr_projem/create_new_project/presentation/steps/company_logo/company_logo.dart';
import 'package:qr_projem/create_new_project/presentation/steps/project_features/project_features.dart';
import 'package:uuid/uuid.dart';

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
      uiState: UiInitial(),
      scrollController: ScrollController(),
      stepPages: StepPage.items,
      stepPageIndex: 0,
      projectInfoFormKey: GlobalKey<FormState>(),
      contactInfoFormKey: GlobalKey<FormState>(),
      apartmentInfoFormKeys: [],
      projectFeaturesFormKey: GlobalKey<FormState>(),
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
       } else {
         insertProject();
       }
     }
  }

  bool validateStepsPage() {
    switch(state.stepPageIndex) {
      case ProjectInfo.stepPageIndex : {
        return validateProjectInfo();
      }
      case ContactInfo.stepPageIndex : {
        return validateContactInfo();
      }
      case CompanyLogo.stepPageIndex : {
        return validateCompanyLogo();
      }
      case ProjectImages.stepPageIndex : {
        return validateProjectImages();
      }
      case ApartmentsInfo.stepPageIndex : {
        return validateApartmentsInfo();
      }
      case ProjectFeatures.stepPageIndex : {
        return validateProjectFeature();
      }
      default : {
        return false;
      }
    }
  }

  bool validateProjectInfo() {
    if(state.projectInfoFormKey.currentState!.validate()) {
      state.projectInfoFormKey.currentState!.save();
      return true;
    }
    return false;
  }
  void saveName(String name) {
    emit(state.copyWith(projectEntry: state.projectEntry.copyWith(name: name)));
  }
  void saveStartDate(DateTime startDate) {
    emit(state.copyWith(projectEntry: state.projectEntry.copyWith(startDate: startDate)));
  }
  void saveEstimatedFinishDate(DateTime estimatedFinishDate) {
    emit(state.copyWith(projectEntry: state.projectEntry.copyWith(estimatedFinishDate: estimatedFinishDate)));
  }
  void saveLocationUrl(String locationUrl) {
    emit(state.copyWith(projectEntry: state.projectEntry.copyWith(locationUrl: locationUrl)));
  }
  bool validateContactInfo() {
    if(state.contactInfoFormKey.currentState!.validate()) {
      state.contactInfoFormKey.currentState!.save();
      return true;
    }
    return false;
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
  void saveCompanyLocationUrl(String locationUrl) {
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
  void addApartment() {
    for (var element in state.apartmentInfoFormKeys) {element.currentState!.save();}
    const apartmentLimit = 3;
    final apartments = state.projectEntry.apartments ?? [];
    if(apartments.length < apartmentLimit) {
      final newApartments = apartments..add(ApartmentEntry(id: apartments.length));
      final newFormKeys = (state.apartmentInfoFormKeys)..add(GlobalKey<FormState>());
      emit(
        state.copyWith(
          projectEntry: state.projectEntry.copyWith(apartments: newApartments),
          apartmentInfoFormKeys: newFormKeys
        ),
      );
    }
  }
  void removeApartment(int index) {
    for (var element in state.apartmentInfoFormKeys) {element.currentState!.save();}
    final apartments = state.projectEntry.apartments;
    if(apartments != null) {
      final newApartments = apartments..removeAt(index);
      final newFormKeys = (state.apartmentInfoFormKeys)..removeAt(index);
      emit(
        state.copyWith(
          projectEntry: state.projectEntry.copyWith(apartments: newApartments),
          apartmentInfoFormKeys: newFormKeys
        )
      );
    }
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
  void saveApartmentPrice(String price, int index) {
    if(state.projectEntry.apartments != null) {
      final apartment = state.projectEntry.apartments![index];
      final newApartment = apartment.copyWith(price: price);
      final newApartments = state.projectEntry.apartments;
      newApartments![index] = newApartment;
      emit(
        state.copyWith(
          projectEntry: state.projectEntry.copyWith(apartments: newApartments),
        )
      );
    }
  }
  bool validateProjectFeature() {
    if(state.projectEntry.features == null) {
      return false;
    }
    if(state.projectEntry.features!.isEmpty) {
      return false;
    }

    if(state.projectFeaturesFormKey.currentState!.validate()) {
      state.projectFeaturesFormKey.currentState!.save();
      return true;
    }
    return false;
  }
  void addProjectFeature() {
    final projectFeaturesFormKeyState = state.projectFeaturesFormKey.currentState;
    if(projectFeaturesFormKeyState != null) {
      state.projectFeaturesFormKey.currentState!.save();
    }
    final features = state.projectEntry.features ?? [];
    final newFeatures = features..add("");
    emit(
      state.copyWith(projectEntry: state.projectEntry.copyWith(features: newFeatures))
    );
  }
  void saveProjectFeature(String feature, int index) {
    if(state.projectEntry.features != null) {
      final features = state.projectEntry.features;
      features![index] = feature;
      emit(
        state.copyWith(projectEntry: state.projectEntry.copyWith(features: features))
      );
    }
  }
  void removeProjectFeature(int index) {
    state.projectFeaturesFormKey.currentState!.save();
    if(state.projectEntry.features != null) {
      final features = state.projectEntry.features!..removeAt(index);
      emit(
        state.copyWith(projectEntry: state.projectEntry.copyWith(features: features))
      );
    }
  }

  void jumpToStepPage(int index) {
    emit(state.copyWith(stepPageIndex: index));
  }

  final ProjectRepository _projectRepository = ProjectRepository();

  Future<void> insertProject() async {

    emit(state.copyWith(uiState: UiLoading()));

    final companyLogoUrl = await uploadCompanyLogo(state.projectEntry.companyLogo!);
    if(companyLogoUrl == null) {
      emit(state.copyWith(uiState: UiError()));
      return;
    }

    final projectImageUrls = await uploadProjectImages(state.projectEntry.projectImages!);
    if(projectImageUrls == null) {
      emit(state.copyWith(uiState: UiError()));
      return;
    }

    List<Apartment> apartments = [];
    await Future.forEach(
      state.projectEntry.apartments!,
      (apartmentEntry) async {
        await uploadApartmentImages(apartmentEntry.id, apartmentEntry.images!).then(
          (value) {
            if(value != null) {
              apartments.add(
                Apartment(
                  imageUrls: value[apartmentEntry.id]!,
                  title: apartmentEntry.title!,
                  type: apartmentEntry.type!,
                  netArea: apartmentEntry.netArea!,
                  price: apartmentEntry.price ?? ""
                )
              );
            } else {
              emit(state.copyWith(uiState: UiError()));
              return null;
            }
          }
        );
      }
    );

    final projectId = await _projectRepository.insertProject(
      Project(
        id: const Uuid().v4(),
        name: state.projectEntry.name!,
        startDate: state.projectEntry.startDate!,
        estimatedFinishDate: state.projectEntry.estimatedFinishDate!,
        locationUrl: state.projectEntry.locationUrl!,
        companyPhone: state.projectEntry.companyPhone!,
        companyMail: state.projectEntry.companyMail!,
        companyAddress: state.projectEntry.companyAddress!,
        companyLocationUrl: state.projectEntry.companyLocationUrl!,
        companyLogoUrl: companyLogoUrl,
        projectImageUrls: projectImageUrls,
        apartments: apartments,
        features: state.projectEntry.features!,
        trialExpirationDate: DateTime.now().add(const Duration(days: 1)),
        expirationDate: DateTime.now().add(const Duration(days: 548))
      )
    );

    if(projectId == null) {
      emit(state.copyWith(uiState: UiError()));
      return;
    }

    emit(state.copyWith(projectEntry: state.projectEntry.copyWith(id: projectId), uiState: UiSuccess()));
  }

  final StorageRepository storageRepository = StorageRepository();

  Future<String?> uploadCompanyLogo(Uint8List companyLogo) async {
    return storageRepository.uploadImage(companyLogo);
  }

  Future<List<String>?> uploadProjectImages(List<Uint8List> projectImages) async {
    List<String> projectImageUrls = [];
    for (var projectImage in projectImages){
      await storageRepository.uploadImage(projectImage).then(
        (value) {
          if(value != null) {
            projectImageUrls.add(value);
          } else {
            return null;
          }
        }
      );
    }
    return projectImageUrls;
  }

  Future<Map<int, List<String>>?> uploadApartmentImages(int index, List<Uint8List> apartmentImages) async {
    List<String> apartmentImageUrls = [];
    for(var apartmentImage in apartmentImages) {
      await storageRepository.uploadImage(apartmentImage).then(
        (value) {
          if(value != null) {
            apartmentImageUrls.add(value);
          } else {
            return null;
          }
        }
      );
    }
    return {index : apartmentImageUrls};
  }
}
