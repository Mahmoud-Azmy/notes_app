import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_notes/add_notes_states.dart';

class AddNotesCubit extends Cubit<AddNotesStates> {
  AddNotesCubit() : super(AddNotesInitialState());
  static AddNotesCubit get(context) => BlocProvider.of(context);
}
