import 'package:flutter/material.dart';
import 'package:note_app/const.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 55,
          decoration: BoxDecoration(
              color: kPrimaryColor, borderRadius: BorderRadius.circular(16)),
          child: const Center(
            child: Text(
              'Add',
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
          )),
    );
  }
}
