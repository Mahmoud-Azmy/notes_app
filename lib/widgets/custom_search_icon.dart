import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(.03),
            borderRadius: BorderRadius.circular(16)),
        child: IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.magnifyingGlass, size: 28)));
  }
}
