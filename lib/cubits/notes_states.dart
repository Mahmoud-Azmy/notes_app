abstract class NotesStates {}

class AddNotesInitialState extends NotesStates {}

class AddNotesLoadingState extends NotesStates {}

class AddNotesSuccessState extends NotesStates {}

class NotesSuccessState extends NotesStates {}

class AddNotesActiveColorStateState extends NotesStates {}

class EditNoteActiveColorStateState extends NotesStates {}

class AddNotesfailureState extends NotesStates {
  final String error;
  AddNotesfailureState(this.error);
}
