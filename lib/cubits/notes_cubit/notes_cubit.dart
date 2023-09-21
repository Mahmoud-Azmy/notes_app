import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/const.dart';
import 'package:note_app/cubits/notes_cubit/notes_states.dart';
import 'package:note_app/models/note_model.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitialState());
  static NotesCubit get(context) => BlocProvider.of(context);

  fetchAllNotes() {
    try {
      var notesbox = Hive.box<NoteModel>(kNotesBox);

      emit(NotesSuccessState(notesbox.values.toList()));
    } catch (e) {
      print(e.toString());
      emit(NotesFailureState(e.toString()));
    }
  }
}
