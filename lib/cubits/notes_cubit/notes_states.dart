import 'package:note_app/models/note_model.dart';

abstract class NotesStates {}

class NotesInitialState extends NotesStates {}

class NotesSuccessState extends NotesStates {
  final List<NoteModel> notes;

  NotesSuccessState(this.notes);
}

class NotesFailureState extends NotesStates {
  final String error;

  NotesFailureState(this.error);
}
