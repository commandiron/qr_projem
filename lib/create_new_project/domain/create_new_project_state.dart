import 'package:flutter/material.dart';

import '../presentation/steps/contact_info.dart';
import '../presentation/steps/project_info.dart';


class CreateNewProjectState {
  ScrollController scrollController;
  List<StepPage> stepPages;
  int stepPageIndex;
  TextEditingController nameTextEditingController;
  String? nameTextFieldErrorMessage;
  TextEditingController startTimeTextEditingController;
  String? startTimeTextFieldErrorMessage;
  DateTime? startTime;
  TextEditingController finishTimeTextEditingController;
  String? finishTimeTextFieldErrorMessage;
  DateTime? finishTime;

  GlobalKey<FormState> contactInfoFormKey;


  CreateNewProjectState(
    {
      required this.scrollController,
      required this.stepPages,
      required this.stepPageIndex,
      required this.nameTextEditingController,
      this.nameTextFieldErrorMessage,
      required this.startTimeTextEditingController,
      this.startTimeTextFieldErrorMessage,
      this.startTime,
      required this.finishTimeTextEditingController,
      this.finishTimeTextFieldErrorMessage,
      this.finishTime,
      required this.contactInfoFormKey,
    }
  );

  CreateNewProjectState copyWith(
      {
        ScrollController? scrollController,
        List<StepPage>? stepPages,
        int? stepPageIndex,
        TextEditingController? nameTextEditingController,
        String? nameTextFieldErrorMessage,
        TextEditingController? startTimeTextEditingController,
        String? startTimeTextFieldErrorMessage,
        DateTime? startTime,
        TextEditingController? finishTimeTextEditingController,
        String? finishTimeTextFieldErrorMessage,
        DateTime? finishTime,
        GlobalKey<FormState>? contactInfoFormKey
      }
      ) {
    return CreateNewProjectState(
      scrollController: scrollController ?? this.scrollController,
      stepPages: stepPages ?? this.stepPages,
      stepPageIndex: stepPageIndex ?? this.stepPageIndex,
      nameTextEditingController: nameTextEditingController ?? this.nameTextEditingController,
      nameTextFieldErrorMessage: nameTextFieldErrorMessage,
      startTimeTextEditingController: startTimeTextEditingController ?? this.startTimeTextEditingController,
      startTimeTextFieldErrorMessage: startTimeTextFieldErrorMessage,
      startTime: startTime ?? this.startTime,
      finishTimeTextEditingController: finishTimeTextEditingController ?? this.finishTimeTextEditingController,
      finishTimeTextFieldErrorMessage: finishTimeTextFieldErrorMessage,
      finishTime: finishTime ?? this.finishTime,
      contactInfoFormKey: contactInfoFormKey ?? this.contactInfoFormKey
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