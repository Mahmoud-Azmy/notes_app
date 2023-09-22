import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/const.dart';

import 'package:note_app/cubits/notes_states.dart';
import 'package:note_app/models/note_model.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(AddNotesInitialState());
  static NotesCubit get(context) => BlocProvider.of(context);
  List<NoteModel> notes = [];

  void fetchAllNotes() {
    var notesbox = Hive.box<NoteModel>(kNotesBox);
    notes = notesbox.values.toList();
    emit(NotesSuccessState());
  }

  Color color = const Color(0xffA8F9FF);
  void addNote(NoteModel noteModel) async {
    emit(AddNotesLoadingState());
    noteModel.color = color.value;
    try {
      var notesbox = Hive.box<NoteModel>(kNotesBox);
      await notesbox.add(noteModel);

      emit(AddNotesSuccessState());
    } catch (e) {
      print(e.toString());
      emit(AddNotesfailureState(e.toString()));
    }
  }

  int currentIndex = 0;
  int editCurrentIndex = 0;
  void editActiveColor(int index) {
    editCurrentIndex = index;
    emit(EditNoteActiveColorStateState());
  }

  void selectActiveColor(int index) {
    currentIndex = index;
    emit(AddNotesActiveColorStateState());
  }

  List<Color> colosList = const [
    Color(0xff9AE5E6),
    Color(0xff87A9F4),
    Color(0xff9AC6E6),
    Color(0xff008080),
    Color(0xffE2A8FF),
    Color(0xff9AA5E6),
    Color(0xff8290A1),
    Color(0xff81A094),
    Color(0xffCEBA6F),
    Color(0xffDAAF92),
    // Colors.grey,
    Color(0xffCEA26F),
  ];
}
