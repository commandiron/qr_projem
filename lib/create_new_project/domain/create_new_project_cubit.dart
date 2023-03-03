import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/domain/model/project.dart';
import 'package:qr_projem/create_new_project/domain/entiries/project_entry.dart';

import '../../core/data/repositories/project_repository.dart';
import 'create_new_project_state.dart';

class CreateNewProjectCubit extends Cubit<CreateNewProjectState> {
  CreateNewProjectCubit() : super(
    CreateNewProjectState(
      scrollController: ScrollController(),
      nameTextEditingController: TextEditingController(),
      projectEntry: ProjectEntry()
    )
  );

  final ProjectRepository _projectRepository = ProjectRepository();

  void insertProject() {

    if(state.projectEntry.apartmentEntries != null) {
      final apartments = state.projectEntry.apartmentEntries!.map(
        (apartmentEntry) => Apartment(
          title: apartmentEntry.title ?? "",
          imageUrls: apartmentEntry.imageUrls ?? [],
          type: apartmentEntry.type ?? "",
          netArea: apartmentEntry.netArea ?? "",
          grossArea: apartmentEntry.grossArea ?? ""
        )
      ).toList();
      final project = Project(
        templateVersion: state.projectEntry.templateVersion ?? "v1",
        companyLogoUrl: state.projectEntry.companyLogoUrl ?? "",
        primaryColorValue: state.projectEntry.primaryColorValue ?? 0xffffffff,
        companyPhone: state.projectEntry.companyPhone ?? "",
        companyMail: state.projectEntry.companyMail ?? "",
        companyAddress: state.projectEntry.companyAddress ?? "",
        companyLocationUrl: state.projectEntry.companyLocationUrl ?? "",
        enabledPageRoutes: state.projectEntry.enabledPageRoutes ?? [
          "overview",
          "plans",
          "project_info",
          "ar"
        ],
        name: state.projectEntry.name ?? "",
        locationUrl: state.projectEntry.locationUrl ?? "",
        generalImageUrls: state.projectEntry.generalImageUrls ?? [],
        apartments: apartments,
        startDate: state.projectEntry.startDate ??  DateTime(2023),
        estimatedFinishDate: state.projectEntry.estimatedFinishDate ?? DateTime(2024),
        features: state.projectEntry.features ?? []
      );

      _projectRepository.insertProject(project);
    }
  }
}
