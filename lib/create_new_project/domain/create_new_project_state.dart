import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:qr_projem/create_new_project/presentation/steps/project_images/project_images.dart';
import 'package:qr_projem/create_new_project/presentation/steps/sale_area_info/sale_area_info.dart';

import '../presentation/steps/company_logo/company_logo.dart';
import '../presentation/steps/contact_info/contact_info.dart';
import '../presentation/steps/project_info/project_info.dart';
import 'entiries/apartment_entry.dart';

class CreateNewProjectState {
  ScrollController scrollController;
  List<StepPage> stepPages;
  int stepPageIndex;
  GlobalKey<FormState> projectInfoFormKey;
  GlobalKey<FormState> contactInfoFormKey;
  List<GlobalKey<FormState>> saleAreaInfoFormKeys;
  bool pickedImageValidationResult;

  String? name;
  DateTime? startTime;
  DateTime? estimatedFinishTime;

  String? companyPhone;
  String? companyMail;
  String? companyAddress;
  String? companyLocationUrl;

  Uint8List? companyLogo;

  List<Uint8List>? projectImages;

  List<ApartmentEntry>? apartments;

  CreateNewProjectState(
    {
      required this.scrollController,
      required this.stepPages,
      required this.stepPageIndex,
      required this.projectInfoFormKey,
      required this.contactInfoFormKey,
      required this.saleAreaInfoFormKeys,
      required this.pickedImageValidationResult,

      this.name,
      this.startTime,
      this.estimatedFinishTime,

      this.companyPhone,
      this.companyMail,
      this.companyAddress,
      this.companyLocationUrl,

      this.companyLogo,

      this.projectImages,

      this.apartments
    }
  );

  CreateNewProjectState copyWith(
      {
        ScrollController? scrollController,
        List<StepPage>? stepPages,
        int? stepPageIndex,
        GlobalKey<FormState>? projectInfoFormKey,
        GlobalKey<FormState>? contactInfoFormKey,
        List<GlobalKey<FormState>>? saleAreaInfoFormKeys,
        bool? pickedImageValidationResult,
        String? name,
        DateTime? startTime,
        DateTime? estimatedFinishTime,
        String? companyPhone,
        String? companyMail,
        String? companyAddress,
        String? companyLocationUrl,
        Uint8List? companyLogo,
        List<Uint8List>? projectImages,
        List<ApartmentEntry>? apartments,
      }
    ) {
    return CreateNewProjectState(
      scrollController: scrollController ?? this.scrollController,
      stepPages: stepPages ?? this.stepPages,
      stepPageIndex: stepPageIndex ?? this.stepPageIndex,
      projectInfoFormKey: projectInfoFormKey ?? this.projectInfoFormKey,
      contactInfoFormKey: contactInfoFormKey ?? this.contactInfoFormKey,
      saleAreaInfoFormKeys: saleAreaInfoFormKeys ?? this.saleAreaInfoFormKeys,
      pickedImageValidationResult: pickedImageValidationResult ?? this.pickedImageValidationResult,
      name: name ?? this.name,
      startTime: startTime ?? this.startTime,
      estimatedFinishTime: estimatedFinishTime ?? this.estimatedFinishTime,
      companyPhone: companyPhone ?? this.companyPhone,
      companyMail: companyMail ?? this.companyMail,
      companyAddress: companyAddress ?? this.companyAddress,
      companyLocationUrl: companyLocationUrl ?? this.companyLocationUrl,
      companyLogo: companyLogo ?? this.companyLogo,
      projectImages: projectImages ?? this.projectImages,
      apartments: apartments ?? this.apartments
    );
  }
}

class StepPage {
  int index;
  String title;
  Widget view;

  StepPage(
      {
        required this.index,
        required this.title,
        required this.view,
      }
      );

  StepPage copyWith(
      {
        int? index,
        String? title,
        Widget? view,
      }
      ) {
    return StepPage(
      index: index ?? this.index,
      title: title ?? this.title,
      view: view ?? this.view,
    );
  }

  static final items = [
    StepPage(
        index: SaleAreaInfo.stepPageIndex,
        title: "Satılık Alan Bilgileri",
        view: const SaleAreaInfo()
    ),
    StepPage(
      index: ProjectInfo.stepPageIndex,
      title: "Proje Bilgileri",
      view: const ProjectInfo(),
    ),
    StepPage(
      index: ContactInfo.stepPageIndex,
      title: "İletişim Bilgileri",
      view: const ContactInfo(),
    ),
    StepPage(
      index: CompanyLogo.stepPageIndex,
      title: "Şirket Logosu",
      view: const CompanyLogo(),
    ),
    StepPage(
      index: ProjectImages.stepPageIndex,
      title: "Proje Görselleri",
      view: const ProjectImages(),
    ),
  ];
}