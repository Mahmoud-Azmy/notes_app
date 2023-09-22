import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit.dart';
import 'package:note_app/cubits/notes_states.dart';

import 'package:note_app/widgets/custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesStates>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: ListView.separated(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              itemBuilder: ((context, index) {
                return CustomNoteItem(
                  noteModel: NotesCubit.get(context).notes[index],
                );
              }),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
              itemCount: NotesCubit.get(context).notes.length),
        );
      },
    );
  }
}
