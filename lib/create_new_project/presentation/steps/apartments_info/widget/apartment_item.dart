import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:qr_projem/create_new_project/domain/entiries/apartment_entry.dart';
import 'package:qr_projem/create_new_project/presentation/steps/apartments_info/widget/apartment_form.dart';

import '../../../../../core/presentation/config/app_text_style.dart';
import '../../../../domain/create_new_project_cubit.dart';
import '../../../widgets/add_image_box_button.dart';
import '../../project_images/widgets/image_frame.dart';
import 'delete_frame.dart';

class ApartmentItem extends StatelessWidget {
  const ApartmentItem({required this.apartmentEntry, required this.formKey, required this.apartmentIndex, Key? key}) : super(key: key);

  final ApartmentEntry apartmentEntry;
  final int apartmentIndex;
  final Key formKey;

  Future<List<Uint8List>?> pickImages() async {
    return await ImagePickerWeb.getMultiImagesAsBytes();
  }

  @override
  Widget build(BuildContext context) {
    return DeleteFrame(
      onDeleteIconPressed: () => BlocProvider.of<CreateNewProjectCubit>(context, listen: false).removeApartment(apartmentIndex),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              apartmentIndex == 0
                ? "Tip A"
                : apartmentIndex == 1
                  ? "Tip B"
                  : apartmentIndex == 2
                    ? "Tip C"
                    : "Tip A",
              style: AppTextStyle.b1,
            ),
            Expanded(
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    ...?apartmentEntry.images
                        ?.asMap()
                        .entries
                        .map((image) {
                      return Expanded(
                        child: ImageFrame(
                          child:
                          Image.memory(image.value),
                          onDeleteIconPressed: () {
                            BlocProvider.of<CreateNewProjectCubit>(context, listen: false).removeApartmentImage(apartmentIndex, image.key);
                          },
                        ),
                      );
                    }),
                    apartmentEntry.images == null
                        ? AddImageBoxButton(
                      onTap: () {
                        pickImages().then((value) {
                          if (value != null) {
                            BlocProvider.of<CreateNewProjectCubit>(context, listen: false).saveApartmentImages(value, apartmentIndex);
                          }
                        });
                      },
                    )
                        : apartmentEntry.images!.isEmpty
                        ? AddImageBoxButton(
                      onTap: () {
                        pickImages().then((value) {
                          if (value != null) {
                            BlocProvider.of<CreateNewProjectCubit>(context, listen: false).saveApartmentImages(value, apartmentIndex);
                          }
                        });
                      },
                    )
                        : const SizedBox.shrink()
                  ],
                )),
            ApartmentForm(
              apartmentIndex: apartmentIndex,
              title: apartmentEntry.title,
              type: apartmentEntry.type,
              netArea: apartmentEntry.netArea
            )
          ],
        ),
      ),
    );
  }
}
