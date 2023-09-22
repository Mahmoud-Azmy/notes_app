import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:note_app/cubits/notes_cubit.dart';

import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/edit_notes_view.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({
    super.key,
    required this.noteModel,
  });
  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NotesCubit.get(context).editCurrentIndex =
            NotesCubit.get(context).colosList.indexOf(Color(noteModel.color));
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditNotesView(
            noteModel: noteModel,
          );
        }));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Color(noteModel.color),
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(24),
              title: Text(
                noteModel.title,
                style: const TextStyle(color: Colors.black, fontSize: 28),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Text(
                  noteModel.subTitle,
                  style: TextStyle(
                      color: Colors.black.withOpacity(.4), fontSize: 15),
                ),
              ),
              trailing: IconButton(
                  onPressed: () {
                    noteModel.delete();
                    NotesCubit.get(context).fetchAllNotes();
                  },
                  icon: const Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.black,
                    size: 28,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24, right: 24),
              child: Text(
                noteModel.date,
                style: TextStyle(
                    color: Colors.black.withOpacity(.4), fontSize: 13),
              ),
            )
          ],
        ),
      ),
    );
  }
}
