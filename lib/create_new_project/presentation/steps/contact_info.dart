import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_cubit.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_state.dart';
import '../../../core/presentation/config/app_padding.dart';
import '../../../core/presentation/config/app_space.dart';
import '../../../core/presentation/config/app_text_style.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({Key? key}) : super(key: key);

  static const stepPageIndex = 1;

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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("İletişim Bilgileri", style: AppTextStyle.h3),
                      AppSpace.verticalM!,
                      TextField(
                        controller: state.nameTextEditingController,
                        decoration: const InputDecoration(
                          hintText: "Telefon:",
                        ),
                      ),
                      AppSpace.verticalL!,
                      TextField(
                        controller: state.nameTextEditingController,
                        decoration: const InputDecoration(
                          hintText: "E-posta:",
                        ),
                      ),
                      AppSpace.verticalL!,
                      TextField(
                        controller: state.nameTextEditingController,
                        decoration: const InputDecoration(
                          hintText: "Adres:",
                        ),
                      ),
                      AppSpace.verticalL!,
                      TextField(
                        controller: state.nameTextEditingController,
                        decoration: const InputDecoration(
                          hintText: "Konum: (Lütfen google haritalardan projenizin adress kordinat linkini yapıştırın.",
                        ),
                      ),
                      AppSpace.verticalL!,
                    ]
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
