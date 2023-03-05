import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:qr_projem/core/presentation/config/app_space.dart';
import 'package:qr_projem/core/presentation/config/app_text_style.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_cubit.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_state.dart';
import 'package:qr_projem/create_new_project/presentation/widgets/add_image_box_button.dart';
import '../../../../core/presentation/config/app_padding.dart';

class CompanyLogo extends StatelessWidget {
  const CompanyLogo({Key? key}) : super(key: key);

  static const stepPageIndex = 1;

  Future<Uint8List?> pickImage() async {
    return await ImagePickerWeb.getImageAsBytes();
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
                "Lütfen şirketinizin logosunu seçiniz",
                style: AppTextStyle.h3,
                textAlign: TextAlign.center,
              ),
              AppSpace.verticalXL!,
              Expanded(
                child: AddImageBoxButton(
                  onTap: () => pickImage().then((value) {
                      if(value != null) {
                        return BlocProvider.of<CreateNewProjectCubit>(context, listen: false)
                          .saveCompanyImage(value);
                      }
                    }
                  ),
                  padding: AppPadding.allM,
                  child: state.companyImage == null
                    ? null
                    : Image.memory(state.companyImage!,),
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
