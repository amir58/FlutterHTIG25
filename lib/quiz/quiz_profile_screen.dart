import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter25/notes/notes_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class QuizProfileScreen extends StatefulWidget {
  QuizProfileScreen({Key? key}) : super(key: key);

  @override
  State<QuizProfileScreen> createState() => _QuizProfileScreenState();
}

class _QuizProfileScreenState extends State<QuizProfileScreen> {
  // Firebase Auth => createAccountWithEmailAndPassword
  final emailController = TextEditingController();

  final nameController = TextEditingController();

  final phoneNumberController = TextEditingController();

  String imageUrl =
      "https://blog.logrocket.com/wp-content/uploads/2021/05/intro-dart-flutter-feature.png";

  File? imageFile;

  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            imageFile == null
                ? InkWell(
                    onTap: () => pickImage(),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(imageUrl),
                      radius: 40,
                    ),
                  )
                : InkWell(
                    onTap: () => pickImage(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.file(
                        imageFile!,
                        height: 100,
                        width: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
            const SizedBox(height: 25),
            TextFormField(
              controller: nameController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.person,
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: emailController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.email,
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: phoneNumberController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.phone,
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
                color: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                onPressed: () {},
                child: const Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void showToast(String errorMessage) {
    Fluttertoast.showToast(
        msg: errorMessage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image == null) {
      return;
    }

    imageFile = File(image.path);

    setState(() {});

    uploadFile();
  }

  // Pick file
  // Upload File => Storage
  // Get Url => getDownloadUrl
  // Save url in database => firestore

  void uploadFile() {
    String userId = auth.currentUser!.uid;

    storage.ref("images/$userId").putFile(imageFile!).then((p0) {
      getImageUrl();
    }).catchError((error) {
      showToast(error.toString());
    });
  }

  void getImageUrl() {
    String userId = auth.currentUser!.uid;

    storage.ref("images/$userId").getDownloadURL().then((imageUrl) {
      print(imageUrl);
      saveImageUrlInDatabase(imageUrl);
    }).catchError((error) {
      showToast(error.toString());
    });
  }

  void saveImageUrlInDatabase(String imageUrl) {
    String userId = auth.currentUser!.uid;

    Map<String, dynamic> data = {
      "imageUrl": imageUrl,
    };

    firestore.collection("quizUsers").doc(userId).update(data);
  }

  void getUserData() {
    String userId = auth.currentUser!.uid;

    firestore
        .collection("quizUsers")
        .doc(userId)
        .get()
        .then((value) => updateUi(value.data()!))
        .catchError((errorMessage) => showToast(errorMessage.toString()));
  }

  void updateUi(Map<String, dynamic> data) {
    nameController.text = data['name'];
    emailController.text = data['email'];
    phoneNumberController.text = data['phone'];

    if (data.containsKey("imageUrl")) {
      imageUrl = data['imageUrl'];
      setState(() {});
    }
  }
}
