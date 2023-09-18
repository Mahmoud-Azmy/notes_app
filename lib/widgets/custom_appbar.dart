import 'package:flutter/material.dart';

import 'package:note_app/widgets/custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'Notes',
          style: TextStyle(fontSize: 32),
        ),
        Spacer(),
        CustomSearchIcon()
      ],
    );
  }
}
