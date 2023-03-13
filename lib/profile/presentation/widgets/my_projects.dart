import 'package:flutter/material.dart';
import 'package:qr_projem/create_new_project/presentation/create_new_project_screen.dart';
import 'package:qr_projem/generate_qr/presentation/generate_qr_screen.dart';
import 'package:qr_projem/profile/presentation/widgets/add_project_button.dart';

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
                        AppSpace.verticalL!,
                        Expanded(
                          flex: 6,
                          child: GridView.builder(
                            itemCount: projects.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                            ),
                            itemBuilder: (context, index) {
                              return InkWell(
                                child: Card(
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Image.network(
                                          projects[index].projectImageUrls.first
                                      ),
                                      Container(
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
                                                      Navigator.of(context).pushNamed(GenerateQrScreen.route, arguments: projects[index].id);
                                                    },
                                                    child: Icon(Icons.qr_code_sharp, color: Colors.white,)
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
                                      )
                                    ],
                                  )
                                ),
                              );
                            },
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: AddProjectButton(
                            onTap: () {
                              Navigator.of(context).pushNamed(CreateNewProjectScreen.route);
                            },
                          )
                        ),
                        AppSpace.verticalExpanded!
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
