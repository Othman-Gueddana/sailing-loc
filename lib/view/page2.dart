import 'package:flutter/material.dart';
import 'package:sailing_loc/global/common/navigation.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Wrap(
          children: [
            Column(
              children: [
                Text("Page2"),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigation.mainNavigation.currentState!
                              .pushNamed("/main/3");
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
