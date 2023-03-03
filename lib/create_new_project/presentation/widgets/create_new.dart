import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_cubit.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_state.dart';
import '../../../core/presentation/config/app_padding.dart';
import '../../../core/presentation/config/app_space.dart';
import '../../../core/presentation/config/app_text_style.dart';

class CreateNew extends StatelessWidget {
  const CreateNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 768,
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Row(
          children: [
            AppSpace.horizontalExpanded!,
            Expanded(
              flex: 6,
              child: Padding(
                padding: AppPadding.verticalL!,
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(32)
                    )
                  ),
                  child: Padding(
                    padding: AppPadding.allL!,
                    child: BlocBuilder<CreateNewProjectCubit, CreateNewProjectState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            Text("Yeni Proje Oluştur", style: AppTextStyle.h2,),
                            AppSpace.verticalL!,
                            Align(alignment: Alignment.centerLeft, child: Text("Proje Bilgileri", style: AppTextStyle.h3,)),
                            AppSpace.verticalM!,
                            TextField(
                              controller: state.nameTextEditingController,
                              decoration: InputDecoration(
                                hintText: "Proje adını giriniz.",
                              ),
                            ),
                            TextField(
                              controller: state.nameTextEditingController,
                              decoration: InputDecoration(
                                hintText: "Proje adını giriniz.",
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  )
                ),
              ),
            ),
            AppSpace.horizontalExpanded!,
          ],
        )
    );
  }
}
