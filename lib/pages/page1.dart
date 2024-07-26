import 'package:flutter/material.dart';
import 'package:sailing_loc/features/user_auth/presentation/pages/sign_up.dart';
import 'package:sailing_loc/navigation.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Wrap(
          children: [
            Column(
              children: [
                Text("Page1"),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigation.mainNavigation.currentState!
                              .pushNamed("/main/2");
                        },
                        child: Text("Next"))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
