import 'package:flutter/material.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/edit_notes_view_body.dart';

class EditNotesView extends StatelessWidget {
  const EditNotesView({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNotesViewBody(
        noteModel: noteModel,
      ),
    );
  }
}
