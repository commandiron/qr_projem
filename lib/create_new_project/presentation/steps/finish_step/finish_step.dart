
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/presentation/config/app_space.dart';
import 'package:qr_projem/core/presentation/config/app_text_style.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_cubit.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_state.dart';
import '../../../../core/presentation/config/app_padding.dart';

class FinishStep extends StatelessWidget {
  const FinishStep({Key? key}) : super(key: key);

  static const stepPageIndex = 6;

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
                "Tebrikler! Tüm adımları tamamladınız.",
                style: AppTextStyle.h3,
                textAlign: TextAlign.center,
              ),
              AppSpace.verticalL!,
              Text(
                "Tasarım ve paket seçiniz;",
                style: AppTextStyle.h3,
                textAlign: TextAlign.center,
              ),
              Row(
                children: [
                  Expanded(
                    child: Card()
                  ),
                  Expanded(
                    child: Card()
                  ),
                ],
              ),
              AppSpace.verticalL!,
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CreateNewProjectCubit>(context, listen: false).insertProject().then(
                    (value) {
                      //Burada template and payment ekranına git.
                    }
                  );
                },
                child: const Text("Qr Kod Oluştur!")
              ),
              AppSpace.verticalXL!,
            ],
          ),
        );
      },
    );
  }
}
