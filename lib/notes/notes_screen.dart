import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter25/notes/add_note_screen.dart';
import 'package:flutter25/notes/edit_note_screen.dart';
import 'package:flutter25/notes/notes_login_screen.dart';

class NotesScreen extends StatefulWidget {
  NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  // List<String> notes = ["Wake up at 7 am", "Call my dad"];
  // 0 => Wake up at 7 am
  // 1 => Call my dad

  List<Map<String, dynamic>> notes = [];
  // 0 => {note : value , id : 124724716}
  // 1 => {note : value , id : 32462187468}
  // notes[0]['note']

  @override
  void initState() {
    super.initState();
    getNotesFromFirestore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToAddNoteScreen();
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return noteItem(index);
          },
        ),
      ),
    );
  }

  Widget noteItem(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              notes[index]['note'],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            onPressed: () => navigateToEditNoteScreen(index),
            icon: const Icon(
              Icons.edit,
              color: Colors.green,
            ),
          ),
          IconButton(
            onPressed: () {
              firestore.collection("notes").doc(notes[index]['id']).delete();
              notes.removeAt(index);
              setState(() {});
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  void getNotesFromFirestore() {
    String userId = auth.currentUser!.uid;

    firestore.collection("notes")
        .where("userId" , isEqualTo: userId)
        .get().then((value) {
      notes.clear();
      for (var document in value.docs) {
        notes.add(document.data());
      }
      setState(() {});
    });
  }

  void navigateToAddNoteScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddNoteScreen(),
      ),
    ).then((value) {
      getNotesFromFirestore();
    });
  }

  void navigateToEditNoteScreen(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditNoteScreen(
          note: notes[index],
        ),
      ),
    ).then((value) {
      getNotesFromFirestore();
    });
  }
}
