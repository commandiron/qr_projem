import 'package:flutter/material.dart';
import 'package:qr_projem/core/presentation/helper/ui_state.dart';
import 'package:qr_projem/create_new_project/domain/entiries/project_entry.dart';
import 'package:qr_projem/create_new_project/presentation/steps/project_images/project_images.dart';

import '../presentation/steps/apartments_info/apartments_info.dart';
import '../presentation/steps/company_logo/company_logo.dart';
import '../presentation/steps/contact_info/contact_info.dart';
import '../presentation/steps/project_features/project_features.dart';
import '../presentation/steps/project_info/project_info.dart';

class CreateNewProjectState {
  UiState uiState;
  ScrollController scrollController;
  List<StepPage> stepPages;
  int stepPageIndex;
  GlobalKey<FormState> projectInfoFormKey;
  GlobalKey<FormState> contactInfoFormKey;
  List<GlobalKey<FormState>> apartmentInfoFormKeys;
  GlobalKey<FormState> projectFeaturesFormKey;
  ProjectEntry projectEntry;

  CreateNewProjectState(
    {
      required this.uiState,
      required this.scrollController,
      required this.stepPages,
      required this.stepPageIndex,
      required this.projectInfoFormKey,
      required this.contactInfoFormKey,
      required this.apartmentInfoFormKeys,
      required this.projectFeaturesFormKey,
      required this.projectEntry,
    }
  );

  CreateNewProjectState copyWith(
      {
        UiState? uiState,
        ScrollController? scrollController,
        List<StepPage>? stepPages,
        int? stepPageIndex,
        GlobalKey<FormState>? projectInfoFormKey,
        GlobalKey<FormState>? contactInfoFormKey,
        List<GlobalKey<FormState>>? apartmentInfoFormKeys,
        GlobalKey<FormState>? projectFeaturesFormKey,
        ProjectEntry? projectEntry,
      }
    ) {
    return CreateNewProjectState(
      uiState: uiState ?? this.uiState,
      scrollController: scrollController ?? this.scrollController,
      stepPages: stepPages ?? this.stepPages,
      stepPageIndex: stepPageIndex ?? this.stepPageIndex,
      projectInfoFormKey: projectInfoFormKey ?? this.projectInfoFormKey,
      contactInfoFormKey: contactInfoFormKey ?? this.contactInfoFormKey,
      apartmentInfoFormKeys: apartmentInfoFormKeys ?? this.apartmentInfoFormKeys,
      projectFeaturesFormKey: projectFeaturesFormKey ?? this.projectFeaturesFormKey,
      projectEntry: projectEntry ?? this.projectEntry,
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
        index: ApartmentsInfo.stepPageIndex,
        title: "Sat??l??k Alan",
        view: const ApartmentsInfo()
    ),
    StepPage(
      index: ProjectInfo.stepPageIndex,
      title: "Proje Bilgileri",
      view: const ProjectInfo(),
    ),
    StepPage(
      index: ContactInfo.stepPageIndex,
      title: "??leti??im Bilgileri",
      view: const ContactInfo(),
    ),
    StepPage(
      index: CompanyLogo.stepPageIndex,
      title: "??irket Logosu",
      view: const CompanyLogo(),
    ),
    StepPage(
      index: ProjectImages.stepPageIndex,
      title: "Proje G??rselleri",
      view: const ProjectImages(),
    ),
    StepPage(
      index: ProjectFeatures.stepPageIndex,
      title: "Proje ??zellikleri",
      view: const ProjectFeatures(),
    ),
  ];
}