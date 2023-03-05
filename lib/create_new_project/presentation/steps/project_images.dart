import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:qr_projem/core/presentation/config/app_space.dart';
import 'package:qr_projem/core/presentation/config/app_text_style.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_cubit.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_state.dart';
import 'package:qr_projem/create_new_project/presentation/widgets/add_image_box_button.dart';
import '../../../core/presentation/config/app_padding.dart';

class ProjectImages extends StatelessWidget {
  const ProjectImages({Key? key}) : super(key: key);

  static const stepPageIndex = 0;

  Future<List<Uint8List>?> pickImages() async {
    return await ImagePickerWeb.getMultiImagesAsBytes();
  }

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
                "Lütfen proje görsellerini seçiniz.",
                style: AppTextStyle.h3,
                textAlign: TextAlign.center,
              ),
              AppSpace.verticalXL!,
              if(state.projectImages == null)
                Expanded(
                  child: AddImageBoxButton(
                    onTap: () =>  pickImages().then((value) {
                        if(value != null) {
                          return BlocProvider.of<CreateNewProjectCubit>(context, listen: false)
                              .saveProjectImages(value);
                        }
                      }
                    ),
                  )
                ),
              if(state.projectImages != null)
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: state.projectImages!.map(
                          (projectImage) => AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black
                                )
                              ),
                              alignment: Alignment.center,
                              padding: AppPadding.allM,
                              child: Image.memory(projectImage)
                            ),
                          ),
                        ).toList(),
                      ),
                      AddImageBoxButton(
                        onTap: () => pickImages().then((value) {
                            if(value != null) {
                              return BlocProvider.of<CreateNewProjectCubit>(context, listen: false)
                                .saveProjectImages(value);
                            }
                          }
                        ),
                      )
                    ],
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
