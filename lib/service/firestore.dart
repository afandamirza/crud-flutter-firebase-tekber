
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  final CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  // CREATE
  Future<void> createNote(String title, String content) async {
    await notes.add({
      'title': title,
      'content': content,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  // READ
  Stream<QuerySnapshot> getNotes() {
    return notes.orderBy('createdAt', descending: true).snapshots();
  }

  // UPDATE
  Future<void> updateNote(String id, String title, String content) async {
    await notes.doc(id).update({
      'title': title,
      'content': content,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  // DELETE
  Future<void> deleteNote(String id) async {
    await notes.doc(id).delete();
  }

}