import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon, this.onPressed});
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(.03),
            borderRadius: BorderRadius.circular(16)),
        child: IconButton(onPressed: onPressed, icon: Icon(icon, size: 26)));
  }
}
