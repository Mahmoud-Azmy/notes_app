import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/const.dart';
import 'package:note_app/cubits/add_notes/add_notes_states.dart';
import 'package:note_app/models/note_model.dart';

class AddNotesCubit extends Cubit<AddNotesStates> {
  AddNotesCubit() : super(AddNotesInitialState());
  static AddNotesCubit get(context) => BlocProvider.of(context);

  void addNote(NoteModel noteModel) async {
    emit(AddNotesLoadingState());
    try {
      var notesbox = Hive.box<NoteModel>(kNotesBox);
      await notesbox.add(noteModel);

      emit(AddNotesSuccessState());
    } catch (e) {
      print(e.toString());
      emit(AddNotesfailureState(e.toString()));
    }
  }
}
