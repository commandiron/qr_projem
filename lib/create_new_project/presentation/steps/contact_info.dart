import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_cubit.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_state.dart';
import '../../../core/presentation/config/app_padding.dart';
import '../../../core/presentation/config/app_space.dart';
import '../../../core/presentation/config/app_text_style.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({Key? key}) : super(key: key);

  static const stepPageIndex = 0;

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateNewProjectCubit, CreateNewProjectState>(
      builder: (context, state) {
        return Padding(
          padding: AppPadding.horizontalXL!.add(AppPadding.verticalL!),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: FractionallySizedBox(
                  widthFactor: 0.75,
                  child: Form(
                    key: state.contactInfoFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("İletişim Bilgileri", style: AppTextStyle.h3),
                        AppSpace.verticalM!,
                        TextFormField(
                          controller: TextEditingController(),
                          decoration: const InputDecoration(
                            hintText: "Telefon:",
                          ),
                          onSaved: (newValue) {
                          },
                          validator: (value) {
                            if(value == "") {
                              return "Lütfen ilgili alanı doldurunuz.";
                            }
                          },
                        ),
                        AppSpace.verticalL!,
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: "E-posta:",
                          ),
                          validator: (value) {
                            if(value == "") {
                              return "Lütfen ilgili alanı doldurunuz.";
                            }
                          },
                        ),
                        AppSpace.verticalL!,
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Adres:",
                          ),
                          validator: (value) {
                            if(value == "") {
                              return "Lütfen ilgili alanı doldurunuz.";
                            }
                          },
                        ),
                        AppSpace.verticalL!,
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Konum: (Lütfen google haritalardan projenizin adress kordinat linkini yapıştırın)",
                          ),
                          validator: (value) {
                            if(value == "") {
                              return "Lütfen ilgili alanı doldurunuz.";
                            }
                          },
                        ),
                        AppSpace.verticalL!,
                      ]
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
