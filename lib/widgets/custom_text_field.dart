import 'package:flutter/material.dart';
import 'package:note_app/const.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.text, this.maxLines = 1});
  final String text;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: text,
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
