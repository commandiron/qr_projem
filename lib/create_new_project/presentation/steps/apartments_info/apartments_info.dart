import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/presentation/config/app_space.dart';
import 'package:qr_projem/core/presentation/config/app_text_style.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_cubit.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_state.dart';
import 'package:qr_projem/create_new_project/presentation/steps/apartments_info/widget/apartment_item.dart';
import '../../../../core/presentation/config/app_padding.dart';
import '../../widgets/add_apartemet_box_button.dart';

class ApartmentsInfo extends StatelessWidget {
  const ApartmentsInfo({Key? key}) : super(key: key);

  static const stepPageIndex = 0;

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
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (state.projectEntry.apartments != null)
                      Expanded(
                        flex: state.projectEntry.apartments!.length,
                        child: Row(
                          children: [
                            ...?state.projectEntry.apartments?.asMap().entries.map(
                              (apartment) {
                                return Expanded(
                                  child: ApartmentItem(
                                      apartmentEntry: apartment.value,
                                      formKey: state.apartmentInfoFormKeys[apartment.key],
                                      apartmentIndex: apartment.key
                                  )
                                );
                              }
                            )
                          ]
                        )
                      ),
                    if ((state.projectEntry.apartments?.length ?? 0) < 3)
                       Expanded(
                         child: AddApartmentBoxButton(
                            onTap: () => BlocProvider.of<CreateNewProjectCubit>(context, listen: false).addApartment()
                         ),
                       ),
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
