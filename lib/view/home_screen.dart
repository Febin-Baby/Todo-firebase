import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:stripe_flutter/data/auth_data.dart';
import 'package:stripe_flutter/model/note_model.dart';
import 'package:stripe_flutter/services/firebase.dart';
import 'package:stripe_flutter/utils/const.dart';
import 'package:stripe_flutter/view/add_screen.dart';
import 'package:stripe_flutter/view/edit_screen.dart';
import 'package:stripe_flutter/view/widget_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        title: const Text(
          'Your list',
          style: TextStyle(fontSize: 23, fontFamily: 'Lato'),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              show(context);
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(auth.currentUser?.email)
            .collection('notes')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No task'));
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error fetching data'));
          }
          final notesDocs = snapshot.data?.docs ?? [];
          return ListView.builder(
            itemCount: notesDocs.length,
            itemBuilder: (context, index) {
              final id = notesDocs[index].id;
              final noteData = notesDocs[index].data() as Map;
              final timestamp = noteData['time'] as Timestamp;
              final note = Note(
                id: id,
                tittle: noteData['title'],
                isDone: noteData['isDone'],
                subtittle: noteData['subtittle'],
                time: timestamp.toDate(),
              );
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  if (direction == DismissDirection.startToEnd) {
                    FirebaseServices().delete(id);
                  } else if (direction == DismissDirection.endToStart) {
                    Get.to(
                      EditScreen(
                        tittle: noteData['title'],
                        subtittle: noteData['subtittle'],
                        id: id,
                      ),
                    );
                  }
                },
                child: WiidgetScreen(note),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        highlightElevation: 40,
        foregroundColor: Colors.green[500],
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddScreesnNote(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Log Out'),
          content: const Text('Are you sure'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                NewAuth().logout();
              },
              child: const Text('Sure'),
            ),
          ],
        );
      },
    );
  }
}
