import 'package:flutter/material.dart';


class CreateNewProjectState {
  ScrollController scrollController;
  TextEditingController nameTextEditingController;
  String? name;
  DateTime? startTime;
  DateTime? finishTime;


  CreateNewProjectState(
    {
      required this.scrollController,
      required this.nameTextEditingController,
      this.name,
      this.startTime,
      this.finishTime
    }
  );

  CreateNewProjectState copyWith(
      {
        ScrollController? scrollController,
        TextEditingController? nameTextEditingController,
        String? name,
        DateTime? startTime,
        DateTime? finishTime
      }
      ) {
    return CreateNewProjectState(
      scrollController: scrollController ?? this.scrollController,
      nameTextEditingController: nameTextEditingController ?? this.nameTextEditingController,
      name: name ?? this.name,
      startTime: startTime ?? this.startTime,
      finishTime: finishTime ?? this.finishTime
    );
  }
}