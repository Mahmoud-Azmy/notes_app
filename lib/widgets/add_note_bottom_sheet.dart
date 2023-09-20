import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_notes/add_notes_cubit.dart';
import 'package:note_app/cubits/add_notes/add_notes_states.dart';

import 'package:note_app/widgets/custom_bottom.dart';

import 'package:note_app/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 38, right: 24, left: 24),
      child: SingleChildScrollView(
        child: BlocConsumer<AddNotesCubit, AddNotesStates>(
          listener: (context, state) {
            if (state is AddNotesSuccessState) Navigator.pop(context);
            if (state is AddNotesfailureState) print('failed ${state.error}');
          },
          builder: (context, state) {
            return state is AddNotesLoadingState
                ? const Center(child: CircularProgressIndicator())
                : const FormBottomSheet();
          },
        ),
      ),
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
            height: 48,
          ),
          CustomBottom(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                //  AddNotesCubit.get(context).addNote(n)
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
