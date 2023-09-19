import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/widgets/custom_appbar.dart';
import 'package:note_app/widgets/custom_text_field.dart';

class EditNotesViewBody extends StatelessWidget {
  const EditNotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 55, left: 24, right: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              text: 'Edit Note',
              icon: FontAwesomeIcons.check,
            ),
            SizedBox(
              height: 28,
            ),
            CustomTextField(text: 'Title'),
            SizedBox(
              height: 16,
            ),
            CustomTextField(
              text: 'Content',
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
