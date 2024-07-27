import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sailing_loc/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:sailing_loc/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:sailing_loc/global/common/toast.dart';
import 'package:sailing_loc/navigation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isSignin = false;
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 30,
            ),
            FormContainerWidget(
              controller: _emailController,
              hintText: "Email",
              isPasswordField: false,
            ),
            SizedBox(
              height: 10,
            ),
            FormContainerWidget(
              controller: _passwordController,
              hintText: "Mot de passe",
              isPasswordField: true,
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: _signIn,
              child: Container(
                width: width * 0.2,
                height: height * 0.06,
                child: Center(
                    child: _isSignin
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            GestureDetector(
                onTap: () {
                  Navigation.mainNavigation.currentState!
                      .pushReplacementNamed("/signup");
                },
                child: Text("Vous n'avez pas de compte ? Inscrivez-vous"))
          ],
        ),
      ),
    );
  }

  void _signIn() async {
    setState(() {
      _isSignin = true;
    });
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(
      email,
      password,
    );

    setState(() {
      _isSignin = false;
    });
    if (user != null) {
      showToast(message: "l'utilisateur est connecté avec succès");
      print("User is Signed In");
      Navigation.mainNavigation.currentState!.pushReplacementNamed("/");
    } else {
      showToast(message: "une erreur s'est produite");
    }
  }
}
