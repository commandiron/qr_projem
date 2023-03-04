import 'package:flutter/material.dart';

import '../presentation/steps/contact_info.dart';
import '../presentation/steps/project_info.dart';


class CreateNewProjectState {
  ScrollController scrollController;
  List<StepPage> stepPages;
  int stepPageIndex;
  GlobalKey<FormState> projectInfoFormKey;
  GlobalKey<FormState> contactInfoFormKey;
  String? name;
  DateTime? startTime;
  DateTime? finishTime;

  CreateNewProjectState(
    {
      required this.scrollController,
      required this.stepPages,
      required this.stepPageIndex,
      required this.projectInfoFormKey,
      required this.contactInfoFormKey,
      this.name,
      this.startTime,
      this.finishTime
    }
  );

  CreateNewProjectState copyWith(
      {
        ScrollController? scrollController,
        List<StepPage>? stepPages,
        int? stepPageIndex,
        GlobalKey<FormState>? projectInfoFormKey,
        GlobalKey<FormState>? contactInfoFormKey,
        String? name,
        DateTime? startTime,
        DateTime? finishTime,
      }
      ) {
    return CreateNewProjectState(
      scrollController: scrollController ?? this.scrollController,
      stepPages: stepPages ?? this.stepPages,
      stepPageIndex: stepPageIndex ?? this.stepPageIndex,
      projectInfoFormKey: projectInfoFormKey ?? this.projectInfoFormKey,
      contactInfoFormKey: contactInfoFormKey ?? this.contactInfoFormKey,
      name: name ?? this.name,
      startTime: startTime ?? this.startTime,
      finishTime: finishTime ?? this.finishTime
    );
  }
}

class StepPage {
  int index;
  String title;
  Widget view;
  bool isDone;

  StepPage(
      {
        required this.index,
        required this.title,
        required this.view,
        required this.isDone
      }
      );

  StepPage copyWith(
      {
        int? index,
        String? title,
        Widget? view,
        bool? isDone,
      }
      ) {
    return StepPage(
      index: index ?? this.index,
      title: title ?? this.title,
      view: view ?? this.view,
      isDone: isDone ?? this.isDone
    );
  }

  static final items = [
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
      isDone: false
    ),
  ];
}