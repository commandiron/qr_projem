import 'package:flutter/material.dart';
import 'package:qr_projem/create_new_project/presentation/create_new_project_screen.dart';
import 'package:qr_projem/profile/presentation/widgets/add_project_button.dart';

import '../../../core/presentation/config/app_padding.dart';
import '../../../core/presentation/config/app_space.dart';
import '../../../core/presentation/config/app_text_style.dart';

class MyProjects extends StatelessWidget {
  const MyProjects({Key? key}) : super(key: key);

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
                        AppSpace.verticalXL!,
                        Text("Projenize Qr kod oluşturmak için hemen projenizi ekleyin", style: AppTextStyle.h4,),
                        AppSpace.verticalXL!,
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
