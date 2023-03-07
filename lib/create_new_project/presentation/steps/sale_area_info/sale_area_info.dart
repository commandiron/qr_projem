import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:qr_projem/core/presentation/config/app_space.dart';
import 'package:qr_projem/core/presentation/config/app_text_style.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_cubit.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_state.dart';
import '../../../../core/presentation/config/app_padding.dart';
import '../../widgets/add_apartemet_box_button.dart';
import '../project_images/widgets/delete_alert_dialog.dart';
import '../project_images/widgets/image_frame.dart';

class SaleAreaInfo extends StatelessWidget {
  const SaleAreaInfo({Key? key}) : super(key: key);

  static const stepPageIndex = 4;

  Future<List<Uint8List>?> pickImages() async {
    return await ImagePickerWeb.getMultiImagesAsBytes();
  }

  @override
  build(BuildContext context) {
    return BlocBuilder<CreateNewProjectCubit, CreateNewProjectState>(
      builder: (context, state) {
        return Padding(
          padding: AppPadding.horizontalXL!,
          child: Column(
            children: [
              AppSpace.verticalXL!,
              Text(
                "Lütfen satılık alan bilgilerinizi ve görselleri ekleyiniz",
                style: AppTextStyle.h3,
                textAlign: TextAlign.center,
              ),
              AppSpace.verticalXL!,
              if(state.projectImages == null)
                Expanded(
                    child: AddApartmentBoxButton(
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
                        Expanded(
                            flex: state.projectImages!.length,
                            child: Row(
                                children: [
                                  ...?state.projectImages?.asMap().entries.map(
                                          (projectImageEntry) {
                                        return Expanded(
                                            child: ImageFrame(
                                              child: Image.memory(projectImageEntry.value),
                                              onDeleteIconPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return DeleteAlertDialog(
                                                      dialogContext: dialogContext,
                                                      onApproved: () {
                                                        BlocProvider.of<CreateNewProjectCubit>(context, listen: false)
                                                            .removeProjectImage(projectImageEntry.key);
                                                      },
                                                      onRejected: () {},
                                                    );
                                                  },
                                                );
                                              },
                                            )
                                        );
                                      }
                                  )
                                ]
                            )
                        ),
                        Expanded(
                          child: AddApartmentBoxButton(
                            onTap: () => pickImages().then((value) {
                              if(value != null) {
                                return BlocProvider.of<CreateNewProjectCubit>(context, listen: false)
                                    .saveProjectImages(value);
                              }
                            }
                            ),
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
