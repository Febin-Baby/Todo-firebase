import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stripe_flutter/model/note_model.dart';
import 'package:uuid/uuid.dart';

class FirebaseServices {
  final uuid = const Uuid().v4();
  final date = DateTime.now();
  final isDone = false;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> createNotes(String title, String subtittle) async {
    try {
      debugPrint('Colleection');
      await firestore
          .collection('users')
          .doc(auth.currentUser?.email)
          .collection('notes')
          .doc(uuid)
          .set({
        'id': uuid,
        'title': title,
        'isDone': false,
        'subtittle': subtittle,
        'time': date,
      });
    } on FirebaseException catch (e) {
      Get.snackbar('Collection failr', e.toString());
    }
  }

  Future<List<Note>> getNotesForUser(AsyncSnapshot snapshot) async {
    try {
      final notesSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser?.email)
          .collection('notes')
          .get();

      final notesList = notesSnapshot.docs.map((doc) {
        final data = doc.data();
        final timestamp = data['time'] as Timestamp;
        return Note(
          id: data['id'],
          tittle: data['title'],
          isDone: data['isDone'],
          subtittle: data['subtittle'],
          time: timestamp.toDate(),
        );
      }).toList();

      return notesList;
    } on FirebaseException catch (e) {
      // Handle any errors that may occur during the retrieval
      debugPrint('Failed to fetch notes: ${e.message}');
      return [];
    }
  }

  update(String title, String subtittle, String noteId) async {
    debugPrint('notttttt$noteId');
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser?.email)
          .collection('notes')
          .doc(noteId)
          .update({
        'id': uuid,
        'title': title,
        'subtittle': subtittle,
        'time': date,
      }).then((value) {
        Get.back();
      });
    } on FirebaseException catch (e) {
      Get.snackbar('Uddate error', e.toString());
    }
  }

  delete(String noteid) {
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser?.email)
          .collection('notes')
          .doc(noteid)
          .delete();
    } catch (e) {
      Get.snackbar('Delete error', e.toString());
    }
  }
}
