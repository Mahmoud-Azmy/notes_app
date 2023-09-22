import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubits/notes_cubit.dart';
import 'package:note_app/cubits/notes_states.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/add_color_list_view.dart';

import 'package:note_app/widgets/custom_bottom.dart';

import 'package:note_app/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {
        if (state is AddNotesSuccessState) {
          Navigator.pop(context);
          NotesCubit.get(context).fetchAllNotes();
        }
        if (state is AddNotesfailureState) print('failed ${state.error}');
      },
      builder: (context, state) {
        return state is AddNotesLoadingState
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.only(
                    top: 38,
                    right: 24,
                    left: 24,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const SingleChildScrollView(child: FormBottomSheet()),
              );
      },
    );
  }
}

class FormBottomSheet extends StatefulWidget {
  const FormBottomSheet({
    super.key,
  });

  @override
  State<FormBottomSheet> createState() => _FormBottomSheetState();
}

class _FormBottomSheetState extends State<FormBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            text: 'Title',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              subTitle = value;
            },
            text: 'Content',
            maxLines: 5,
          ),
          const SizedBox(
            height: 24,
          ),
          const AddColorListView(),
          const SizedBox(
            height: 32,
          ),
          CustomBottom(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                var currentDate = DateTime.now();
                var formatedDate = DateFormat().add_yMMMd().format(currentDate);
                NoteModel noteModel = NoteModel(
                    title: title!,
                    subTitle: subTitle!,
                    date: formatedDate,
                    color: Colors.blue.value);
                NotesCubit.get(context).addNote(noteModel);
                NotesCubit.get(context).currentIndex = 0;
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
          const SizedBox(
            height: 24,
          )
        ],
      ),
    );
  }
}
