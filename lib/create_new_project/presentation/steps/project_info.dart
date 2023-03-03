import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_cubit.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_state.dart';
import 'package:qr_projem/create_new_project/presentation/widgets/project_date_picker.dart';
import '../../../core/presentation/config/app_padding.dart';
import '../../../core/presentation/config/app_space.dart';
import '../../../core/presentation/config/app_text_style.dart';

class ProjectInfo extends StatelessWidget {
  const ProjectInfo({Key? key}) : super(key: key);

  static const stepPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateNewProjectCubit, CreateNewProjectState>(
      builder: (context, state) {
        return Padding(
          padding: AppPadding.horizontalXL!.add(AppPadding.verticalL!),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: FractionallySizedBox(
                  widthFactor: 0.75,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Proje Bilgileri", style: AppTextStyle.h3),
                      AppSpace.verticalM!,
                      TextField(
                        controller: state.nameTextEditingController,
                        decoration: InputDecoration(
                          hintText: "Proje adını giriniz.",
                          errorText: state.nameTextFieldErrorMessage
                        ),
                      ),
                      AppSpace.verticalL!,
                      ProjectDatePicker(
                        title: "Proje Başlangıç tarihi:",
                        startTime: state.startTime,
                        onSubmit: (dateTime) {
                          BlocProvider.of<CreateNewProjectCubit>(context, listen: false).setStartTime(dateTime);
                        },
                      ),
                      AppSpace.verticalL!,
                      ProjectDatePicker(
                        title: "Proje Bitiş tarihi:",
                        startTime: state.finishTime,
                        onSubmit: (dateTime) {
                          BlocProvider.of<CreateNewProjectCubit>(context, listen: false).setFinishTime(dateTime);
                        },
                      ),
                    ]
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
