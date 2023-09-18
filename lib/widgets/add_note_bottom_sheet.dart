import 'package:flutter/material.dart';

import 'package:note_app/widgets/custom_bottom.dart';

import 'package:note_app/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 38, right: 24, left: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(
              text: 'Title',
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextField(
              text: 'Content',
              maxLines: 5,
            ),
            SizedBox(
              height: 48,
            ),
            CustomBottom(),
            SizedBox(
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}
