import 'package:flutter/material.dart';

import 'entiries/project_entry.dart';

class CreateNewProjectState {
  ScrollController scrollController;
  TextEditingController nameTextEditingController;
  ProjectEntry projectEntry;

  CreateNewProjectState(
    {
      required this.scrollController,
      required this.nameTextEditingController,
      required this.projectEntry
    }
  );

  CreateNewProjectState copyWith(
      {
        ScrollController? scrollController,
        TextEditingController? nameTextEditingController,
        ProjectEntry? projectEntry,
      }
      ) {
    return CreateNewProjectState(
      scrollController: scrollController ?? this.scrollController,
      nameTextEditingController: nameTextEditingController ?? this.nameTextEditingController,
      projectEntry: projectEntry ?? this.projectEntry,
    );
  }
}