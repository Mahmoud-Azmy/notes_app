import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/widgets/custom_appbar.dart';
import 'package:note_app/widgets/notes_listview.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 55, left: 24, right: 24),
      child: Column(
        children: [
          CustomAppBar(
            onPressed: () {},
            text: 'Notes',
            icon: FontAwesomeIcons.magnifyingGlass,
          ),
          const Expanded(
            child: NotesListView(),
          )
        ],
      ),
    );
  }
}
