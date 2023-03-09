import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:qr_projem/core/presentation/config/app_space.dart';
import 'package:qr_projem/core/presentation/config/app_text_style.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_cubit.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_state.dart';
import 'package:qr_projem/create_new_project/presentation/steps/apartments_info/widget/delete_frame.dart';
import 'package:qr_projem/create_new_project/presentation/steps/project_images/widgets/image_frame.dart';
import 'package:qr_projem/create_new_project/presentation/widgets/add_image_box_button.dart';
import '../../../../core/presentation/config/app_padding.dart';
import '../../widgets/add_apartemet_box_button.dart';

class ApartmentsInfo extends StatelessWidget {
  const ApartmentsInfo({Key? key}) : super(key: key);

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
                "Lütfen satılık daire bilgilerinizi ve planları ekleyiniz (En fazla 3 adet)",
                style: AppTextStyle.h3,
                textAlign: TextAlign.center,
              ),
              AppSpace.verticalXL!,
              if (state.projectEntry.apartments == null)
                Expanded(
                    child: AddApartmentBoxButton(
                        onTap: () => BlocProvider.of<CreateNewProjectCubit>(
                                context,
                                listen: false)
                            .addApartment())),
              if (state.projectEntry.apartments != null)
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: state.projectEntry.apartments!.length,
                        child: Row(children: [
                          ...?state.projectEntry.apartments
                              ?.asMap()
                              .entries
                              .map((apartment) {
                            return Expanded(
                              child: DeleteFrame(
                                onDeleteIconPressed: () =>
                                    BlocProvider.of<CreateNewProjectCubit>(
                                            context,
                                            listen: false)
                                        .removeApartment(apartment.key),
                                child: Form(
                                  key: state
                                      .apartmentInfoFormKeys[apartment.key],
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        apartment.key == 0
                                            ? "Tip A"
                                            : apartment.key == 1
                                                ? "Tip B"
                                                : apartment.key == 2
                                                    ? "Tip C"
                                                    : "Tip A",
                                        style: AppTextStyle.b1,
                                      ),
                                      Expanded(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ...?apartment.value.images
                                              ?.asMap()
                                              .entries
                                              .map((image) {
                                            return Expanded(
                                              child: ImageFrame(
                                                child:
                                                    Image.memory(image.value),
                                                onDeleteIconPressed: () {
                                                  BlocProvider.of<
                                                              CreateNewProjectCubit>(
                                                          context,
                                                          listen: false)
                                                      .removeApartmentImage(
                                                          apartment.key,
                                                          image.key);
                                                },
                                              ),
                                            );
                                          }),
                                          apartment.value.images == null
                                              ? AddImageBoxButton(
                                                  onTap: () {
                                                    pickImages().then((value) {
                                                      if (value != null) {
                                                        BlocProvider.of<
                                                                    CreateNewProjectCubit>(
                                                                context,
                                                                listen: false)
                                                            .saveApartmentImages(
                                                                value,
                                                                apartment.key);
                                                      }
                                                    });
                                                  },
                                                )
                                              : apartment.value.images!.isEmpty
                                                  ? AddImageBoxButton(
                                                      onTap: () {
                                                        pickImages()
                                                            .then((value) {
                                                          if (value != null) {
                                                            BlocProvider.of<
                                                                        CreateNewProjectCubit>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .saveApartmentImages(
                                                                    value,
                                                                    apartment
                                                                        .key);
                                                          }
                                                        });
                                                      },
                                                    )
                                                  : const SizedBox.shrink()
                                        ],
                                      )),
                                      TextFormField(
                                        controller: TextEditingController(
                                            text: apartment.value.title),
                                        decoration: const InputDecoration(
                                          hintText:
                                              "Başlık: Ör: 8.Kat Normal Daire",
                                        ),
                                        validator: (value) {
                                          if (value == "") {
                                            return "Lütfen ilgili alanı doldurunuz.";
                                          }
                                          return null;
                                        },
                                        onSaved: (newValue) {
                                          if (newValue != null) {
                                            BlocProvider.of<
                                                        CreateNewProjectCubit>(
                                                    context,
                                                    listen: false)
                                                .saveApartmentTitle(
                                                    newValue, apartment.key);
                                          }
                                        },
                                      ),
                                      TextFormField(
                                        controller: TextEditingController(
                                            text: apartment.value.type),
                                        decoration: const InputDecoration(
                                          hintText: "Tip: Ör: 3+1",
                                        ),
                                        validator: (value) {
                                          if (value == "") {
                                            return "Lütfen ilgili alanı doldurunuz.";
                                          }
                                          return null;
                                        },
                                        onSaved: (newValue) {
                                          if (newValue != null) {
                                            BlocProvider.of<
                                                        CreateNewProjectCubit>(
                                                    context,
                                                    listen: false)
                                                .saveApartmentType(
                                                    newValue, apartment.key);
                                          }
                                        },
                                      ),
                                      TextFormField(
                                        controller: TextEditingController(
                                            text: apartment.value.netArea),
                                        decoration: const InputDecoration(
                                          hintText: "Net Alan: Ör: 90 m2",
                                        ),
                                        validator: (value) {
                                          if (value == "") {
                                            return "Lütfen ilgili alanı doldurunuz.";
                                          }
                                          return null;
                                        },
                                        onSaved: (newValue) {
                                          if (newValue != null) {
                                            BlocProvider.of<
                                                        CreateNewProjectCubit>(
                                                    context,
                                                    listen: false)
                                                .saveApartmentNetArea(
                                                    newValue, apartment.key);
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })
                        ])),
                    if (state.projectEntry.apartments!.length < 3)
                      Expanded(
                        child: AddApartmentBoxButton(
                            onTap: () => BlocProvider.of<CreateNewProjectCubit>(
                                    context,
                                    listen: false)
                                .addApartment()),
                      )
                  ],
                )),
              AppSpace.verticalXL!,
            ],
          ),
        );
      },
    );
  }
}
