import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/const.dart';
import 'package:note_app/cubits/add_note/add_note_states.dart';
import 'package:note_app/models/note_model.dart';

class AddNotesCubit extends Cubit<AddNotesStates> {
  AddNotesCubit() : super(AddNotesInitialState());
  static AddNotesCubit get(context) => BlocProvider.of(context);
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
  void selectActiveColor(int index) {
    currentIndex = index;
    emit(AddNotesActiveColorStateState());
  }

  List<Color> colos = const [
    Color(0xff9AE5E6),
    Color(0xffA8E4FF),
    Color(0xff87A9F4),
    Color(0xff9AC6E6),
    Colors.teal,
    Color(0xffE2A8FF),
    Color(0xff9AA5E6),
    Color(0xff8290A1),
    Color(0xff81A094),
    Color(0xff786E5A),
    Color(0xffA27B61),
    Color(0xffCEBA6F),
  ];
}
