import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes_online_db/components/notes_tile.dart';
import 'package:notes_online_db/services/firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //FireStoreService object
  final fireStoreService = FireStoreService();

  // text controller
  final TextEditingController textController = TextEditingController();
//open a dialog box to add note
  void addOrEditNoteBox({String? docId}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: docId == null
            ? Text(
                "Add note",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              )
            : Text(
                "Edit note",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
        content: TextField(
          controller: textController,
        ),
        actions: [
          ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Cancel",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              )),
          ElevatedButton(
              onPressed: () {
                if (docId == null) {
                  //add a new note
                  fireStoreService.addNote(textController.text);
                } else {
                  fireStoreService.updateNote(docId, textController.text);
                }

                // clear the text controller
                textController.clear();

                // pop the dialog box
                Navigator.pop(context);
              },
              child: Text(
                "Save",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Notes",
          style: TextStyle(
              fontSize: 30,
              color: Theme.of(context).colorScheme.inversePrimary),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: fireStoreService.getNotesStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List notesList = snapshot.data!.docs;
            return ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (context, index) {
                //get individual doc to display
                DocumentSnapshot document = notesList[index];
                String docId = document.id;
                //get data from each doc with map type casting
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;

                //get the note from the data
                String noteText = data["note"];

                //display as a tile
                return NotesTile(
                  noteText: noteText,
                  editNote: () => addOrEditNoteBox(docId: docId),
                  deleteNote: () => fireStoreService.deleteNote((docId)),
                );
              },
            );
          } else {
            return const Text("No notes");
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addOrEditNoteBox,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
    );
  }
}
