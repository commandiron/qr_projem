import 'package:flutter/material.dart';
import 'package:qr_projem/create_new_project/domain/entiries/project_entry.dart';
import 'package:qr_projem/create_new_project/presentation/steps/project_images/project_images.dart';

import '../presentation/steps/apartments_info/apartments_info.dart';
import '../presentation/steps/company_logo/company_logo.dart';
import '../presentation/steps/contact_info/contact_info.dart';
import '../presentation/steps/project_info/project_info.dart';

class CreateNewProjectState {
  ScrollController scrollController;
  List<StepPage> stepPages;
  int stepPageIndex;
  GlobalKey<FormState> projectInfoFormKey;
  GlobalKey<FormState> contactInfoFormKey;
  List<GlobalKey<FormState>> saleAreaInfoFormKeys;
  ProjectEntry projectEntry;

  CreateNewProjectState(
    {
      required this.scrollController,
      required this.stepPages,
      required this.stepPageIndex,
      required this.projectInfoFormKey,
      required this.contactInfoFormKey,
      required this.saleAreaInfoFormKeys,
      required this.projectEntry,
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
        ProjectEntry? projectEntry,
      }
    ) {
    return CreateNewProjectState(
      scrollController: scrollController ?? this.scrollController,
      stepPages: stepPages ?? this.stepPages,
      stepPageIndex: stepPageIndex ?? this.stepPageIndex,
      projectInfoFormKey: projectInfoFormKey ?? this.projectInfoFormKey,
      contactInfoFormKey: contactInfoFormKey ?? this.contactInfoFormKey,
      saleAreaInfoFormKeys: saleAreaInfoFormKeys ?? this.saleAreaInfoFormKeys,
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
        title: "Satılık Alan Bilgileri",
        view: const ApartmentsInfo()
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