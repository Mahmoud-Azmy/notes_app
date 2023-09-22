abstract class AddNotesStates {}

class AddNotesInitialState extends AddNotesStates {}

class AddNotesLoadingState extends AddNotesStates {}

class AddNotesSuccessState extends AddNotesStates {}

class AddNotesActiveColorStateState extends AddNotesStates {}

class AddNotesfailureState extends AddNotesStates {
  final String error;
  AddNotesfailureState(this.error);
}
