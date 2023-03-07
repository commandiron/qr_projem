import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:qr_projem/core/presentation/config/app_space.dart';
import 'package:qr_projem/core/presentation/config/app_text_style.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_cubit.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_state.dart';
import 'package:qr_projem/create_new_project/presentation/steps/sale_area_info/widget/delete_frame.dart';
import 'package:qr_projem/create_new_project/presentation/widgets/add_image_box_button.dart';
import '../../../../core/presentation/config/app_padding.dart';
import '../../widgets/add_apartemet_box_button.dart';

class SaleAreaInfo extends StatelessWidget {
  const SaleAreaInfo({Key? key}) : super(key: key);

  static const stepPageIndex = 0;

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
                "Lütfen satılık alan bilgilerinizi ve görselleri ekleyiniz (En fazla 3 adet)",
                style: AppTextStyle.h3,
                textAlign: TextAlign.center,
              ),
              AppSpace.verticalXL!,
              if(state.apartments == null)
                Expanded(
                    child: AddApartmentBoxButton(
                      onTap: () => BlocProvider.of<CreateNewProjectCubit>(context, listen: false)
                          .addApartment()
                    )
                ),
              if(state.apartments != null)
                Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: state.apartments!.length,
                          child: Row(
                              children: [
                                ...?state.apartments?.asMap().entries.map(
                                  (apartment) {
                                    return Expanded(
                                      child: DeleteFrame(
                                        onDeleteIconPressed: () => BlocProvider.of<CreateNewProjectCubit>(context, listen: false)
                                            .removeApartment(apartment.key),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              apartment.key == 0 ? "Tip A" : apartment.key == 1 ? "Tip B" : apartment.key == 2 ? "Tip C" : "Tip A",
                                              style: AppTextStyle.b1,
                                            ),
                                            Expanded(
                                              child: AddImageBoxButton(
                                                onTap: () {

                                                },
                                              ),
                                            ),
                                            Text(
                                              "Bilgileri gir",
                                              style: AppTextStyle.b1,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                )
                              ]
                          )
                        ),
                        Expanded(
                          child: AddApartmentBoxButton(
                            onTap: () => BlocProvider.of<CreateNewProjectCubit>(context, listen: false).addApartment()
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
