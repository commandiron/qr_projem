import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/create_new_project/presentation/create_new_project_screen.dart';
import 'package:qr_projem/generate_qr/presentation/generate_qr_screen.dart';
import 'package:qr_projem/profile/domain/cubit/profile_cubit.dart';
import 'package:qr_projem/profile/presentation/widgets/add_project_button.dart';
import 'package:qr_projem/profile/presentation/widgets/project_card.dart';
import 'package:qr_projem/select_plan/presentation/select_plan_screen.dart';

import '../../core/domain/model/project.dart';
import '../../core/presentation/config/app_padding.dart';
import '../../core/presentation/config/app_space.dart';
import '../../core/presentation/config/app_text_style.dart';

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
                                  child: ProjectCard(
                                    imageUrl: projects[index].projectImageUrls.first,
                                    title: projects[index].name,
                                    onQrCodeIconPressed: () {
                                      if(projects[index].paymentStatus == PaymentStatus.selectPlan) {
                                        Navigator.of(context).pushNamed(SelectPlanScreen.route, arguments: projects[index].id);
                                      } else {
                                        Navigator.of(context).pushNamed(GenerateQrScreen.route, arguments: projects[index].id);
                                      }
                                    },
                                    onDeleteConfirm: () {
                                      BlocProvider.of<ProfileCubit>(context,listen: false).deleteUserProject(index);
                                    },
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
