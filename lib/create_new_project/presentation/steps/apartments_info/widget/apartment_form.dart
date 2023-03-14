import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/presentation/config/app_space.dart';

import '../../../../domain/create_new_project_cubit.dart';

class ApartmentForm extends StatelessWidget {
  const ApartmentForm({required this.apartmentIndex, required this.title, required this.type, required this.netArea, required this.price, Key? key}) : super(key: key);

  final int apartmentIndex;
  final String? title;
  final String? type;
  final String? netArea;
  final String? price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppSpace.horizontalExpanded!,
        Expanded(
          flex: 6,
          child: Column(
            children: [
              Expanded(
                child: TextFormField(
                  controller: TextEditingController(text: title),
                  decoration: const InputDecoration(
                      hintText: "Ör: 8.Kat Normal Daire",
                      labelText: "Başlık"
                  ),
                  validator: (value) {
                    if (value == "") {
                      return "Lütfen ilgili alanı doldurunuz.";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      BlocProvider.of<CreateNewProjectCubit>(context, listen: false).saveApartmentTitle(newValue, apartmentIndex);
                    }
                  },
                ),
              ),
              Expanded(
                  child: TextFormField(
                    controller: TextEditingController(text: type),
                    decoration: const InputDecoration(
                        hintText: "Ör: 3+1",
                        labelText: "Tip"
                    ),
                    validator: (value) {
                      if (value == "") {
                        return "Lütfen ilgili alanı doldurunuz.";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      if (newValue != null) {
                        BlocProvider.of<CreateNewProjectCubit>(context, listen: false).saveApartmentType(newValue, apartmentIndex);
                      }
                    },
                  ),
              ),
            ],
          )
        ),
        AppSpace.horizontalExpanded!,
        Expanded(
          flex: 6,
          child: Column(
            children: [
              Expanded(
                  child: TextFormField(
                    controller: TextEditingController(text: netArea),
                    decoration: const InputDecoration(
                      hintText: "Ör: 90 m²",
                      labelText: "Net Alan (m²)",
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    validator: (value) {
                      if (value == "") {
                        return "Lütfen ilgili alanı doldurunuz.";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      if (newValue != null) {
                        BlocProvider.of<CreateNewProjectCubit>(context, listen: false).saveApartmentNetArea(newValue, apartmentIndex);
                      }
                    },
                  ),
              ),
              Expanded(
                  child: TextFormField(
                    controller: TextEditingController(text: price),
                    decoration: const InputDecoration(
                      hintText: "Ör: 5.000.000 TL",
                      labelText: "Fiyat (TL)",
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    validator: (value) {
                      return null;
                    },
                    onSaved: (newValue) {
                      BlocProvider.of<CreateNewProjectCubit>(context, listen: false).saveApartmentPrice(newValue ?? "", apartmentIndex);
                    },
                  ),
              ),
            ],
          )
        ),
        AppSpace.horizontalExpanded!,
      ],
    );
  }
}
