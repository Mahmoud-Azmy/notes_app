import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/cubits/notes_cubit/notes_states.dart';

class ColorListView extends StatelessWidget {
  const ColorListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesStates>(
      builder: (context, state) {
        return SizedBox(
          height: 74,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    NotesCubit.get(context).selectActiveColor(index);
                  },
                  child: ColorItem(
                    color: NotesCubit.get(context).colos[index],
                    isActive: NotesCubit.get(context).currentIndex == index,
                  ),
                ),
              );
            },
            itemCount: NotesCubit.get(context).colos.length,
          ),
        );
      },
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.isActive,
    required this.color,
  });
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            backgroundColor: color,
            radius: 37,
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 32,
          );
  }
}
