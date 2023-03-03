import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_cubit.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_state.dart';
import 'package:qr_projem/create_new_project/presentation/steps_navigator/steps_navigator.dart';
import '../../../core/presentation/config/app_padding.dart';
import '../../../core/presentation/config/app_space.dart';
import '../../../core/presentation/config/app_text_style.dart';

class CreateNewSteps extends StatelessWidget {
  const  CreateNewSteps({Key? key}) : super(key: key);

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
                  child: BlocBuilder<CreateNewProjectCubit, CreateNewProjectState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          AppSpace.verticalL!,
                          Text("Yeni Proje Oluştur", style: AppTextStyle.h2,),
                          AppSpace.verticalExpanded!,
                          const StepsNavigator()
                        ],
                      );
                    },
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
