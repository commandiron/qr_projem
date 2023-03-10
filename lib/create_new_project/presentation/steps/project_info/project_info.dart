import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_cubit.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_state.dart';
import 'package:qr_projem/create_new_project/presentation/widgets/project_date_picker.dart';
import '../../../../core/presentation/config/app_padding.dart';
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
          child: Align(
            alignment: Alignment.topLeft,
            child: FractionallySizedBox(
              widthFactor: 0.75,
              child: Form(
                key: state.projectInfoFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: Text("Proje Bilgileri", style: AppTextStyle.h3),),
                    Expanded(child: FittedBox(fit: BoxFit.scaleDown, child: Text("Proje adı:", style: AppTextStyle.b1,)),),
                    Expanded(flex: 3, child: TextFormField(
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
                    ),),
                    Expanded(child: FittedBox(fit: BoxFit.scaleDown, child: Text("Proje Başlangıç tarihi:", style: AppTextStyle.b1,)),),
                    Expanded(flex: 3, child: ProjectDatePicker(
                        dateTime: state.projectEntry.startDate,
                        onSaved: (dateTime) {
                          if(dateTime != null) {
                            BlocProvider.of<CreateNewProjectCubit>(context, listen: false).saveStartDate(dateTime);
                          }
                        }
                    ),),
                    Expanded(child: FittedBox(fit: BoxFit.scaleDown, child: Text("Proje Tahmini Bitiş tarihi:", style: AppTextStyle.b1,)),),
                    Expanded(flex: 3, child: ProjectDatePicker(
                        dateTime: state.projectEntry.estimatedFinishDate,
                        onSaved: (dateTime) => {
                          if(dateTime != null) {
                            BlocProvider.of<CreateNewProjectCubit>(context, listen: false).saveEstimatedFinishDate(dateTime),
                          }
                        }
                    ),),
                    Expanded(child: FittedBox(fit: BoxFit.scaleDown, child: Text("Konum:", style: AppTextStyle.b1,)),),
                    Expanded(flex: 3, child: TextFormField(
                      controller: TextEditingController(text: state.projectEntry.locationUrl),
                      decoration: const InputDecoration(
                        hintText: "Lütfen google haritalardan projenizin adress kordinat linkini yapıştırın",
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
                    ),),
                  ]
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
