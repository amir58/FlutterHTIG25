import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditNoteScreen extends StatefulWidget {
  EditNoteScreen({Key? key, required this.note}) : super(key: key);

  Map<String, dynamic> note;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  final firestore = FirebaseFirestore.instance;

  final noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    noteController.text = widget.note['note'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Note"),
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
                child: const Text("Update"),
              ),
            )
          ],
        ),
      ),
    );
  }

  void addNewNote() {
    String note = noteController.text;

    if (note.isEmpty) {
      Fluttertoast.showToast(msg: "Note is required");
      return;
    }

    Map<String, dynamic> data = {
      'note': note,
    };

    firestore.collection("notes").doc(widget.note['id']).update(data);

    Navigator.pop(context, note);
  }
}
