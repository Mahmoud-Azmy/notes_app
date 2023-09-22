import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/cubits/add_note/add_note_cubit.dart';

import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/color_list_view.dart';
import 'package:note_app/widgets/custom_appbar.dart';
import 'package:note_app/widgets/custom_text_field.dart';

class EditNotesViewBody extends StatefulWidget {
  const EditNotesViewBody({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<EditNotesViewBody> createState() => _EditNotesViewBodyState();
}

class _EditNotesViewBodyState extends State<EditNotesViewBody> {
  String? title, subTitle;
  var titleController = TextEditingController();
  var subTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = widget.noteModel.title;
    subTitleController.text = widget.noteModel.subTitle;
    return Padding(
      padding: const EdgeInsets.only(top: 55, left: 24, right: 24),
      child: Column(
        children: [
          CustomAppBar(
            onPressed: () {
              widget.noteModel.title = title ?? widget.noteModel.title;
              widget.noteModel.subTitle = subTitle ?? widget.noteModel.subTitle;
              widget.noteModel.color = AddNotesCubit.get(context).color.value;
              widget.noteModel.save();
              NotesCubit.get(context).fetchAllNotes();
              Navigator.pop(context);
            },
            text: 'Edit Note',
            icon: FontAwesomeIcons.check,
          ),
          const SizedBox(
            height: 28,
          ),
          CustomTextField(
            controller: titleController,
            text: 'Title',
            onChanged: (p0) {
              title = p0;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            controller: subTitleController,
            onChanged: (p0) {
              subTitle = p0;
            },
            text: 'Content',
            maxLines: 5,
          ),
          const SizedBox(
            height: 24,
          ),
          const ColorListView()
        ],
      ),
    );
  }
}
