import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_cubit.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_state.dart';
import 'package:regexed_validator/regexed_validator.dart';
import '../../../../core/presentation/config/app_padding.dart';
import '../../../../core/presentation/config/app_space.dart';
import '../../../../core/presentation/config/app_text_style.dart';
import '../../../../core/presentation/helper/phone_input_mask.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({Key? key}) : super(key: key);

  static const stepPageIndex = 1;

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateNewProjectCubit, CreateNewProjectState>(
      builder: (context, state) {
        return Padding(
          padding: AppPadding.horizontalXL!,
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
                            controller: TextEditingController(
                                text: state.projectEntry.companyPhone)
                              ..value = InputMask.phone.formatEditUpdate(
                                  const TextEditingValue(text: ""),
                                  TextEditingValue(
                                      text: state.projectEntry.companyPhone ??
                                          "")),
                            decoration: const InputDecoration(
                              hintText: "Telefon:",
                            ),
                            inputFormatters: [InputMask.phone],
                            validator: (value) {
                              if (value != null) {
                                if ((!validator.phone(InputMask.phone
                                        .unmaskText(value)) ||
                                    value.length < 19)) {
                                  return "Lütfen ilgili alanı doldurunuz.";
                                }
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              if (newValue != null) {
                                BlocProvider.of<CreateNewProjectCubit>(context,
                                        listen: false)
                                    .savePhoneNumber(
                                        "+90${InputMask.phone.unmaskText(newValue)}");
                              }
                            },
                          ),
                          AppSpace.verticalL!,
                          TextFormField(
                            controller: TextEditingController(
                                text: state.projectEntry.companyMail),
                            decoration: const InputDecoration(
                              hintText: "E-posta:",
                            ),
                            validator: (value) {
                              if (value != null) {
                                if (!validator.email(value)) {
                                  return "Lütfen geçerli bir e-posta giriniz.";
                                }
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              if (newValue != null) {
                                BlocProvider.of<CreateNewProjectCubit>(context,
                                        listen: false)
                                    .saveEmail(newValue);
                              }
                            },
                          ),
                          AppSpace.verticalL!,
                          TextFormField(
                            controller: TextEditingController(
                                text: state.projectEntry.companyAddress),
                            decoration: const InputDecoration(
                              hintText: "Adres:",
                            ),
                            validator: (value) {
                              if (value == "") {
                                return "Lütfen ilgili alanı doldurunuz.";
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              if (newValue != null) {
                                BlocProvider.of<CreateNewProjectCubit>(context,
                                        listen: false)
                                    .saveAddress(newValue);
                              }
                            },
                          ),
                          AppSpace.verticalL!,
                          TextFormField(
                            controller: TextEditingController(
                                text: state.projectEntry.companyLocationUrl),
                            decoration: const InputDecoration(
                              hintText:
                                  "Konum: (Lütfen google haritalardan şirketinizin adress kordinat linkini yapıştırın)",
                            ),
                            validator: (value) {
                              if (value == "") {
                                return "Lütfen ilgili alanı doldurunuz.";
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              if (newValue != null) {
                                BlocProvider.of<CreateNewProjectCubit>(context,
                                        listen: false)
                                    .saveCompanyLocationUrl(newValue);
                              }
                            },
                          ),
                          AppSpace.verticalL!,
                        ]),
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
