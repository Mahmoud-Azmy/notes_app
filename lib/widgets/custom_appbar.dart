import 'package:flutter/material.dart';

import 'package:note_app/widgets/custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.text, required this.icon, this.onPressed});
  final String text;
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 30),
        ),
        const Spacer(),
        CustomIcon(
          onPressed: onPressed,
          icon: icon,
        )
      ],
    );
  }
}
