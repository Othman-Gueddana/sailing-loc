import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sailing_loc/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:sailing_loc/navigation.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
              placeholder: "Email",
              isPasswordField: false,
            ),
            SizedBox(
              height: 10,
            ),
            FormContainerWidget(
              placeholder: "Mot de passe",
              isPasswordField: true,
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigation.mainNavigation.currentState!
                    .pushReplacementNamed("/");
              },
              child: Container(
                width: width * 0.2,
                height: height * 0.06,
                child: Center(
                    child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
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
                child: Text("S'inscrire ?"))
          ],
        ),
      ),
    );
  }
}
