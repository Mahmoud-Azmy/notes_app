import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: ((context, index) {
          return const CustomNoteItem();
        }),
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemCount: 20);
  }
}
