import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter25/notes/notes_register_screen.dart';
import 'package:flutter25/notes/notes_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
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
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.lock,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Forget your password? "),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                // 3
                // 2 / 3
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(shape: const StadiumBorder()),
                    onPressed: () => login(),
                    child: const Text(
                      "Login",
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // 1 / 3
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => navigateToRegitserScreen(),
                    style: OutlinedButton.styleFrom(shape: StadiumBorder()),
                    child: const Text("Regitser"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void login() async {
    String email = emailController.text;

    String password = passwordController.text;

    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    firebaseAuth
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then(
      (value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => NotesScreen(),
          ),
        );
      },
    ).catchError(
      (error) {
        print('LOGIN FAILURE => $error');
      },
    );
  }

  navigateToRegitserScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegisterScreen(),
        ));
  }
}
