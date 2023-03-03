import 'package:flutter/material.dart';


class CreateNewProjectState {
  ScrollController scrollController;
  List<StepPage> stepPages;
  int stepPageIndex;
  TextEditingController nameTextEditingController;
  String? nameTextFieldErrorMessage;
  DateTime? startTime;
  DateTime? finishTime;


  CreateNewProjectState(
    {
      required this.scrollController,
      required this.stepPages,
      required this.stepPageIndex,
      required this.nameTextEditingController,
      this.nameTextFieldErrorMessage,
      this.startTime,
      this.finishTime
    }
  );

  CreateNewProjectState copyWith(
      {
        ScrollController? scrollController,
        List<StepPage>? stepPages,
        int? stepPageIndex,
        TextEditingController? nameTextEditingController,
        String? nameTextFieldErrorMessage,
        DateTime? startTime,
        DateTime? finishTime
      }
      ) {
    return CreateNewProjectState(
      scrollController: scrollController ?? this.scrollController,
      stepPages: stepPages ?? this.stepPages,
      stepPageIndex: stepPageIndex ?? this.stepPageIndex,
      nameTextEditingController: nameTextEditingController ?? this.nameTextEditingController,
      nameTextFieldErrorMessage: nameTextFieldErrorMessage ?? this.nameTextFieldErrorMessage,
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
}