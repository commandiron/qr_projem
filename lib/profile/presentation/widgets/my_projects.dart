import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/create_new_project/presentation/create_new_project_screen.dart';
import 'package:qr_projem/generate_qr/presentation/generate_qr_screen.dart';
import 'package:qr_projem/profile/domain/cubit/profile_cubit.dart';
import 'package:qr_projem/profile/presentation/widgets/add_project_button.dart';
import 'package:qr_projem/select_plan/presentation/select_plan_screen.dart';

import '../../../core/domain/model/project.dart';
import '../../../core/presentation/config/app_padding.dart';
import '../../../core/presentation/config/app_space.dart';
import '../../../core/presentation/config/app_text_style.dart';
import '../../../core/presentation/widgets/alert_dialog/under_development_alert_dialog.dart';

class MyProjects extends StatelessWidget {
  const MyProjects({required this.projects, Key? key}) : super(key: key);

  final List<Project> projects;

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
                    child: Column(
                      children: [
                        Text("Projelerim", style: AppTextStyle.h2,),
                        AppSpace.verticalExpanded!,
                        if(projects.isNotEmpty)
                          Expanded(
                            flex: 6,
                            child: GridView.builder(
                              itemCount: projects.length,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                              ),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  child: Card(
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Image.network(
                                          projects[index].projectImageUrls.first,
                                          loadingBuilder: (context, child, loadingProgress) {
                                            if(loadingProgress?.expectedTotalBytes == loadingProgress?.cumulativeBytesLoaded) {
                                              return child;
                                            } else {
                                              return const CircularProgressIndicator();
                                            }
                                          },
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            width: double.infinity,
                                            color: Colors.black.withOpacity(0.75),
                                            padding: AppPadding.horizontalM!.add(AppPadding.verticalS!),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(projects[index].name, style: AppTextStyle.b2!.copyWith(color: Colors.white),),
                                                Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        if(projects[index].paymentStatus == PaymentStatus.selectPlan) {
                                                          Navigator.of(context).pushNamed(SelectPlanScreen.route, arguments: projects[index].id);
                                                        } else {
                                                          Navigator.of(context).pushNamed(GenerateQrScreen.route, arguments: projects[index].id);
                                                        }
                                                      },
                                                      child: const Icon(Icons.qr_code_sharp, color: Colors.white,)
                                                    ),
                                                    AppSpace.horizontalM!,
                                                    InkWell(
                                                      onTap: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return const UnderDevelopmentAlertDialog();
                                                          },
                                                        );
                                                      },
                                                      child: Icon(Icons.edit, color: Colors.white,)
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: InkWell(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return AlertDialog(
                                                    content: Text("Silmek istediğinize emin misiniz? Bu işlem geri alınamaz!"),
                                                    actions: [
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(dialogContext).pop();
                                                        },
                                                        child: Text("Hayır")
                                                      ),
                                                      ElevatedButton(
                                                          onPressed:() {
                                                            Navigator.of(dialogContext).pop();
                                                            BlocProvider.of<ProfileCubit>(context,listen: false).deleteUserProject(index);
                                                          },
                                                          child: Text("Evet")
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: Icon(Icons.delete, color: Theme.of(context).colorScheme.error,),
                                          ),
                                        )
                                      ],
                                    )
                                  ),
                                );
                              },
                            ),
                          ),
                        if(projects.length < 5)
                          Expanded(
                            flex: 3,
                            child: AddProjectButton(
                              onTap: () {
                                Navigator.of(context).pushNamed(CreateNewProjectScreen.route);
                              },
                            )
                          ),
                        AppSpace.verticalExpanded!,
                      ],
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
