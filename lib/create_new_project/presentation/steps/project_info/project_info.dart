import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_cubit.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_state.dart';
import 'package:qr_projem/create_new_project/presentation/widgets/project_date_picker.dart';
import '../../../../core/presentation/config/app_padding.dart';
import '../../../../core/presentation/config/app_space.dart';
import '../../../../core/presentation/config/app_text_style.dart';

class ProjectInfo extends StatelessWidget {
  const ProjectInfo({Key? key}) : super(key: key);

  static const stepPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateNewProjectCubit, CreateNewProjectState>(
      builder: (context, state) {
        return Padding(
          padding: AppPadding.horizontalXL!,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: FractionallySizedBox(
                  widthFactor: 0.75,
                  child: Form(
                    key: state.projectInfoFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Proje Bilgileri", style: AppTextStyle.h3),
                        AppSpace.verticalM!,
                        Text("Proje adı:", style: AppTextStyle.b1,),
                        TextFormField(
                          controller: TextEditingController(text: state.projectEntry.name),
                          decoration: const InputDecoration(
                            hintText: "Ör: Maltepe | Yüksel Apartmanı",
                          ),
                          validator: (value) {
                            if(value == "") {
                              return "Lütfen ilgili alanı doldurunuz.";
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            if(newValue != null) {
                              BlocProvider.of<CreateNewProjectCubit>(context, listen: false).saveName(newValue);
                            }
                          },
                        ),
                        AppSpace.verticalL!,
                        ProjectDatePicker(
                          title: "Proje Başlangıç tarihi:",
                          dateTime: state.projectEntry.startDate,
                          onSaved: (dateTime) {
                            if(dateTime != null) {
                              BlocProvider.of<CreateNewProjectCubit>(context, listen: false).saveStartDate(dateTime);
                            }
                          }
                        ),
                        AppSpace.verticalL!,
                        ProjectDatePicker(
                          title: "Proje Tahmini Bitiş tarihi:",
                          dateTime: state.projectEntry.estimatedFinishDate,
                          onSaved: (dateTime) => {
                            if(dateTime != null) {
                              BlocProvider.of<CreateNewProjectCubit>(context, listen: false).saveEstimatedFinishDate(dateTime),
                            }
                          }
                        ),
                        AppSpace.verticalL!,
                        TextFormField(
                          controller: TextEditingController(text: state.projectEntry.locationUrl),
                          decoration: const InputDecoration(
                            hintText: "Konum: (Lütfen google haritalardan projenizin adress kordinat linkini yapıştırın)",
                          ),
                          validator: (value) {
                            if(value == "") {
                              return "Lütfen ilgili alanı doldurunuz.";
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            if(newValue != null) {
                              BlocProvider.of<CreateNewProjectCubit>(context, listen: false).saveLocationUrl(newValue);
                            }
                          },
                        ),
                      ]
                    ),
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
