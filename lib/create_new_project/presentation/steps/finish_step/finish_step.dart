
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/presentation/config/app_space.dart';
import 'package:qr_projem/core/presentation/config/app_text_style.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_cubit.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_state.dart';
import '../../../../core/presentation/config/app_padding.dart';

class FinishStep extends StatelessWidget {
  const FinishStep({Key? key}) : super(key: key);

  static const stepPageIndex = 0;

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
                "Bitir butonuna tıklayarak, girdiğiniz bilgileri qr koduna dönüştürebilirsiniz.",
                style: AppTextStyle.h3,
                textAlign: TextAlign.center,
              ),
              AppSpace.verticalL!,
              Text(
                "Bundan sonra tasarım ve ödeme seçimi yapmalısınız, daha sonra qr kodunuz etkinleşitirilecektir.",
                style: AppTextStyle.h3,
                textAlign: TextAlign.center,
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
                child: const Text("Bitir")
              ),
              AppSpace.verticalXL!,
            ],
          ),
        );
      },
    );
  }
}
