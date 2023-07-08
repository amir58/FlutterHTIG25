import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddNoteScreen extends StatefulWidget {
  AddNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final noteController = TextEditingController();

  final firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              controller: noteController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Note",
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  addNewNote();
                },
                style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                child: const Text("Add Note"),
              ),
            )
          ],
        ),
      ),
    );
  }

  void addNewNote() {
    String note = noteController.text;

    if (note.isEmpty) return;

    final String id = DateTime.now().millisecondsSinceEpoch.toString();

    final String userId = FirebaseAuth.instance.currentUser!.uid;

    // Map<String, dynamic> data = {};
    Map<String, dynamic> data = {
      "id": id,
      "userId": userId,
      "note": note,
    };

    firestore.collection("notes").doc(id).set(data);

    Navigator.pop(context);
  }
}
