import 'package:flutter/material.dart';

class NotesTile extends StatelessWidget {
  final String noteText;
  final void Function()? editNote;
  final void Function()? deleteNote;

  const NotesTile(
      {super.key,
      required this.noteText,
      required this.editNote,
      required this.deleteNote});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(noteText,
            style:
                TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: editNote,
                icon: Icon(Icons.settings,
                    color: Theme.of(context).colorScheme.inversePrimary)),
            IconButton(
                onPressed: deleteNote,
                icon: Icon(Icons.delete,
                    color: Theme.of(context).colorScheme.inversePrimary)),
          ],
        ),
      ),
    );
  }
}
