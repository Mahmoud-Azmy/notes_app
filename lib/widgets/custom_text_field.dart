import 'package:flutter/material.dart';
import 'package:note_app/const.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.text,
      this.maxLines = 1,
      this.onSaved,
      this.onChanged,
      this.controller});
  final String text;
  final int maxLines;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'field is required';
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: text,
        border: outlineBorder(),
        enabledBorder: outlineBorder(Colors.white),
        focusedBorder: outlineBorder(),
      ),
    );
  }

  OutlineInputBorder outlineBorder([color]) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: color ?? kPrimaryColor),
        borderRadius: BorderRadius.circular(12));
  }
}
