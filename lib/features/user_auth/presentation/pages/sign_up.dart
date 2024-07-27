import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sailing_loc/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:sailing_loc/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:sailing_loc/global/common/toast.dart';
import 'package:sailing_loc/navigation.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isSigningUp = false;

  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _fnameController = TextEditingController();
  TextEditingController _lnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _fnameController.dispose();
    _lnameController.dispose();
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("SignUp",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 30,
            ),
            FormContainerWidget(
              controller: _usernameController,
              hintText: "Username",
              isPasswordField: false,
            ),
            SizedBox(
              height: 10,
            ),
            FormContainerWidget(
              controller: _fnameController,
              hintText: "Prénom",
              isPasswordField: false,
            ),
            SizedBox(
              height: 10,
            ),
            FormContainerWidget(
              controller: _lnameController,
              hintText: "Nom",
              isPasswordField: false,
            ),
            SizedBox(
              height: 10,
            ),
            FormContainerWidget(
              controller: _emailController,
              hintText: "Email Adress",
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
              height: 10,
            ),
            FormContainerWidget(
              controller: _confirmPasswordController,
              hintText: "Confirmer le mot de passe",
              isPasswordField: true,
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: _signUp,
              child: Container(
                width: width * 0.2,
                height: height * 0.06,
                child: Center(
                    child: _isSigningUp
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10)),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _signUp() async {
    setState(() {
      _isSigningUp = true;
    });
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String fname = _fnameController.text;
    String lname = _lnameController.text;

    User? user = await _auth.signUpWithEmailAndPassword(
        username, email, password, fname, lname);

    setState(() {
      _isSigningUp = false;
    });
    if (user != null) {
      print("User is successfully created");
      showToast(message: "l'utilisateur est créé avec succès");
      Navigation.mainNavigation.currentState!.pushReplacementNamed("/");
    } else {
      showToast(message: "une erreur s'est produite ");
    }
  }
}
