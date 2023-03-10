import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/create_new_project_cubit.dart';

class ApartmentForm extends StatelessWidget {
  const ApartmentForm({required this.apartmentIndex, required this.title, required this.type, required this.netArea, Key? key}) : super(key: key);

  final int apartmentIndex;
  final String? title;
  final String? type;
  final String? netArea;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: TextEditingController(text: title),
          decoration: const InputDecoration(
            hintText:
            "Başlık: Ör: 8.Kat Normal Daire",
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
        TextFormField(
          controller: TextEditingController(text: type),
          decoration: const InputDecoration(
            hintText: "Tip: Ör: 3+1",
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
        TextFormField(
          controller: TextEditingController(text: netArea),
          decoration: const InputDecoration(
            hintText: "Net Alan(m2): Ör: 90",
          ),
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
      ],
    );
  }
}
