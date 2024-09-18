import 'package:cloud_firestore/cloud_firestore.dart';

/* databases are collections thas holds documents which store data in key value pairs, maps essentially
so you can only add new data by using key value pairs as done in addNote method

nothing technically gets created after initialising notes, the collection is only created when the first document is added into it i.e after addNote is called fior the first time


*/
class FireStoreService {
  //get notes collection from db
  final CollectionReference notes =
      FirebaseFirestore.instance.collection("notes");

  //CREATE: add a new note in db
  Future<void> addNote(String note) {
    return notes.add({
      "note": note,
      "timestamp": Timestamp.now(),
    });
  }

  //READ: get notes from db
  Stream<QuerySnapshot> getNotesStream() {
    final notesStream =
        notes.orderBy("timestamp", descending: true).snapshots();
    return notesStream;
  }

  //UPDATE: update note given a doc id
  Future<void> updateNote(String docId, String newNote) {
    return notes
        .doc(docId)
        .update({"note": newNote, "timestamp": Timestamp.now()});
  }

  //DELETE: delete note given a doc id
  Future<void> deleteNote(String docId) {
    return notes.doc(docId).delete();
  }
}
