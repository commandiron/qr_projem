
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/presentation/config/app_space.dart';
import 'package:qr_projem/core/presentation/config/app_text_style.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_cubit.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_state.dart';
import '../../../../core/presentation/config/app_padding.dart';

class ProjectFeatures extends StatelessWidget {
  const ProjectFeatures({Key? key}) : super(key: key);

  static const stepPageIndex = 5;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateNewProjectCubit, CreateNewProjectState>(
      builder: (context, state) {
        return Padding(
          padding: AppPadding.horizontalXL!,
          child: Column(
            children: [
              AppSpace.verticalXL!,
              Text(
                "Lütfen proje özelliklerini ekleyiniz",
                style: AppTextStyle.h3,
                textAlign: TextAlign.center,
              ),
              AppSpace.verticalXL!,
              if(state.projectEntry.features != null)
                Expanded(
                  child: Form(
                    key: state.projectFeaturesFormKey,
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 6,
                        crossAxisSpacing: 12,
                        childAspectRatio: 2
                      ),
                      itemCount: state.projectEntry.features!.length,
                      itemBuilder: (context, index) {
                        return TextFormField(
                          controller: TextEditingController(
                            text: state.projectEntry.features![index],
                          ),
                          decoration: InputDecoration(
                            hintText: "Ör: C40 Beton",
                            suffixIcon: IconButton(
                              icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.error,),
                              onPressed: () {
                                BlocProvider.of<CreateNewProjectCubit>(context, listen: false).removeProjectFeature(index);
                              },
                            )
                          ),
                          validator: (value) {
                            if(value == "") {
                              return "Lütfen ilgili alanı doldurunuz.";
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            if(newValue != null) {
                              BlocProvider.of<CreateNewProjectCubit>(context, listen: false).saveProjectFeature(newValue, index);
                            }
                          },
                        );
                      },
                    ),
                  )
                ),
              if((state.projectEntry.features?.length ?? 0)  < 18)
                InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {
                    BlocProvider.of<CreateNewProjectCubit>(context, listen: false).addProjectFeature();
                  },
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimary,)
                  )
                ),
              AppSpace.verticalXL!,
            ],
          ),
        );
      },
    );
  }
}
