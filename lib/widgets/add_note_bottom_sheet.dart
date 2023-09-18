import 'package:flutter/material.dart';

import 'package:note_app/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 38, right: 24, left: 24),
      child: Column(
        children: [CustomTextField()],
      ),
    );
  }
}
