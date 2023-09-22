import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/const.dart';
import 'package:note_app/cubits/notes_cubit/notes_states.dart';
import 'package:note_app/models/note_model.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitialState());
  static NotesCubit get(context) => BlocProvider.of(context);
  List<NoteModel> notes = [];
  void fetchAllNotes() {
    var notesbox = Hive.box<NoteModel>(kNotesBox);
    notes = notesbox.values.toList();
    emit(NotesSuccessState());
  }

  int currentIndex = 0;
  void selectActiveColor(int index) {
    currentIndex = index;
    emit(NotesActiveColorState());
  }

  List<Color> colos = const [
    Color(0xffA8F9FF),
    Color(0xff9AE5E6),
    Color(0xff9AC6E6),
    Color(0xffE2A8FF),
    Color(0xff9AA5E6),
    Color(0xff8290A1),
    Color(0xff81A094),
    Color(0xff786E5A),
    Color(0xff775B59),
    Color(0xff32161F),
    Color(0xff163033),
  ];
}
