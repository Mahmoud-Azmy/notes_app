import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xfff2b150),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(24),
            title: const Text(
              'Flutter tips',
              style: TextStyle(color: Colors.black, fontSize: 28),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Text(
                'ronaldo is the greatest of all time',
                style: TextStyle(
                    color: Colors.black.withOpacity(.4), fontSize: 15),
              ),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.black,
                  size: 28,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24, right: 24),
            child: Text(
              '18 Sep,2023',
              style:
                  TextStyle(color: Colors.black.withOpacity(.4), fontSize: 13),
            ),
          )
        ],
      ),
    );
  }
}
