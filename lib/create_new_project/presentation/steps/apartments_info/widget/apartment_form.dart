import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        Expanded(child: TextFormField(
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
        ),),
        Expanded(child: TextFormField(
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
        ),),
        Expanded(child: TextFormField(
          controller: TextEditingController(text: netArea),
          decoration: InputDecoration(
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
        ),),
      ],
    );
  }
}
