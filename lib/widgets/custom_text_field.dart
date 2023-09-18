import 'package:flutter/material.dart';
import 'package:note_app/const.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Title',
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
