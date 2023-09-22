import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:note_app/cubits/notes_cubit.dart';
import 'package:note_app/cubits/notes_states.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_color_item.dart';

class EditNoteColorListView extends StatelessWidget {
  const EditNoteColorListView({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesStates>(
      builder: (context, state) {
        return SizedBox(
          height: 86,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: GestureDetector(
                  onTap: () {
                    NotesCubit.get(context).color =
                        NotesCubit.get(context).colosList[index];
                    NotesCubit.get(context).editActiveColor(index);
                    noteModel.color = NotesCubit.get(context).color.value;
                  },
                  child: ColorItem(
                    color: NotesCubit.get(context).colosList[index],
                    isActive: NotesCubit.get(context).editCurrentIndex == index,
                  ),
                ),
              );
            },
            itemCount: NotesCubit.get(context).colosList.length,
          ),
        );
      },
    );
  }
}
