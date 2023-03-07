import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:qr_projem/core/presentation/config/app_space.dart';
import 'package:qr_projem/core/presentation/config/app_text_style.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_cubit.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_state.dart';
import 'package:qr_projem/create_new_project/presentation/steps/project_images/widgets/image_frame.dart';
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
                "Lütfen daire bilgilerinizi ve planları ekleyiniz (En fazla 3 adet)",
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
                                        child: Form(
                                          key: state.saleAreaInfoFormKeys[apartment.key],
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                apartment.key == 0 ? "Tip A" : apartment.key == 1 ? "Tip B" : apartment.key == 2 ? "Tip C" : "Tip A",
                                                style: AppTextStyle.b1,
                                              ),
                                              Expanded(
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    ...?apartment.value.images?.asMap().entries.map(
                                                      (image) {
                                                        return Expanded(
                                                          child: ImageFrame(
                                                              child: Image.memory(image.value),
                                                              onDeleteIconPressed: () {
                                                                return BlocProvider.of<CreateNewProjectCubit>(context, listen: false).removeApartmentImage(apartment.key,image.key);
                                                              },
                                                          ),
                                                        );
                                                      }
                                                    ),
                                                    if(apartment.value.images == null)
                                                      AddImageBoxButton(
                                                      showError: !state.pickedImageValidationResult,
                                                      onTap: () {
                                                        pickImages().then(
                                                                (value) {
                                                              if(value != null) {
                                                                return BlocProvider.of<CreateNewProjectCubit>(context, listen: false).saveApartmentImages(value, apartment.key);
                                                              }
                                                            }
                                                        );
                                                      },
                                                    )
                                                  ],
                                                )
                                              ),
                                              TextFormField(
                                                controller: TextEditingController(text: apartment.value.title),
                                                decoration: const InputDecoration(
                                                  hintText: "Başlık: Ör: 8.Kat Normal Daire",
                                                ),
                                                validator: (value) {
                                                  if(value == "") {
                                                    return "Lütfen ilgili alanı doldurunuz.";
                                                  }
                                                },
                                                onSaved: (newValue) {
                                                  if(newValue != null) {
                                                    return BlocProvider.of<CreateNewProjectCubit>(context, listen: false).saveApartmentTitle(newValue, apartment.key);
                                                  }
                                                },
                                              ),
                                              TextFormField(
                                                controller: TextEditingController(text: apartment.value.type),
                                                decoration: const InputDecoration(
                                                  hintText: "Tip: Ör: 3+1",
                                                ),
                                                validator: (value) {
                                                  if(value == "") {
                                                    return "Lütfen ilgili alanı doldurunuz.";
                                                  }
                                                },
                                                onSaved: (newValue) {
                                                  if(newValue != null) {
                                                    return BlocProvider.of<CreateNewProjectCubit>(context, listen: false).saveApartmentType(newValue, apartment.key);
                                                  }
                                                },
                                              ),
                                              TextFormField(
                                                controller: TextEditingController(text: apartment.value.netArea),
                                                decoration: const InputDecoration(
                                                  hintText: "Net Alan: Ör: 90 m2",
                                                ),
                                                validator: (value) {
                                                  if(value == "") {
                                                    return "Lütfen ilgili alanı doldurunuz.";
                                                  }
                                                },
                                                onSaved: (newValue) {
                                                  if(newValue != null) {
                                                    return BlocProvider.of<CreateNewProjectCubit>(context, listen: false).saveApartmentNetArea(newValue, apartment.key);
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                )
                              ]
                          )
                        ),
                        if(state.apartments!.length < 3)
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
