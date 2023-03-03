import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_cubit.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_state.dart';
import 'package:qr_projem/create_new_project/presentation/steps_navigator/step_pages_navigator.dart';
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
                          Padding(
                            padding: AppPadding.horizontalL!,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if(state.stepPageIndex != 0)
                                  SizedBox(
                                    width: 64,
                                    child: BackButton(
                                      onPressed: () {
                                        BlocProvider.of<CreateNewProjectCubit>(context, listen: false).back();
                                      },
                                    ),
                                  ),
                                AppSpace.horizontalExpanded!,
                                Text("Yeni Proje Oluştur", style: AppTextStyle.h2,),
                                AppSpace.horizontalExpanded!,
                                if(state.stepPageIndex != 0)
                                  const SizedBox(width: 64,)
                              ],
                            ),
                          ),
                          AppSpace.verticalM!,
                          Text("${state.stepPageIndex + 1} / ${state.stepPages.length}"),
                          Expanded(
                            child: state.stepPages[state.stepPageIndex].view
                          ),
                          ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<CreateNewProjectCubit>(context, listen: false).next();
                            },
                            child: Text("Devam")
                          ),
                          AppSpace.verticalXXL!,
                          StepPagesNavigator(
                            items: state.stepPages,
                          )
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
