import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:qr_projem/core/presentation/config/app_space.dart';
import 'package:qr_projem/core/presentation/config/app_text_style.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_cubit.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_state.dart';
import '../../../core/presentation/config/app_padding.dart';

class CompanyLogo extends StatefulWidget {
  const CompanyLogo({Key? key}) : super(key: key);

  static const stepPageIndex = 0;

  @override
  State<CompanyLogo> createState() => _CompanyLogoState();
}

class _CompanyLogoState extends State<CompanyLogo> {

  Uint8List? _pickedImage;
  Color? _pickedColor;

  Future<void> pickImage() async {
    _pickedImage = await ImagePickerWeb.getImageAsBytes();
    setState(() {});
  }

  void showColorPickerDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _pickedColor ?? Color(0xffffffff),
              portraitOnly: true,
              onColorChanged: (value) {
                setState(() {
                  _pickedColor = value;
                });
              },
            ),
          ),
        );
      },
    );
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
                child: InkWell(
                  onTap: () {
                    pickImage();
                  },
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          color: _pickedColor,
                          border: Border.all(
                              color: Colors.black
                          )
                      ),
                      alignment: Alignment.center,
                      padding: AppPadding.allL,
                      child: _pickedImage == null
                          ? const Icon(Icons.image_outlined, size: 100,)
                          : Image.memory(_pickedImage!,),
                    ),
                  ),
                ),
              ),
              AppSpace.verticalXL!,
              if(_pickedImage != null)
                Column(
                  children: [
                    Text(
                      "Lütfen logonun arkaplan rengini seçiniz. (Logonuzun net olarak görülebileceği bir arka plan seçiniz)",
                      style: AppTextStyle.b1,
                      textAlign: TextAlign.center,
                    ),
                    AppSpace.verticalL!,
                    InkWell(
                      onTap: () {
                        showColorPickerDialog();
                      },
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: _pickedColor ?? const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ],
                ),
              AppSpace.verticalXL!,
            ],
          ),
        );
      },
    );
  }
}
