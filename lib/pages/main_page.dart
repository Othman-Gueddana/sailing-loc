import 'package:flutter/material.dart';
import 'package:sailing_loc/navigation.dart';
import 'package:sailing_loc/pages/page1.dart';
import 'package:sailing_loc/pages/page2.dart';

class MyMainPage extends StatefulWidget {
  const MyMainPage({super.key});

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("My main Page"),
        actions: [
          Expanded(
            child: TextButton(
              onPressed: () {},
              child: Text("Home"),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {},
              child: Text("S'inscrire"),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {},
              child: Text("Login"),
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Navigator(
                key: Navigation.mainNavigation,
                initialRoute: "/",
                onGenerateRoute: (RouteSettings settings) {
                  Widget page;

                  switch (settings.name) {
                    case "/":
                      {
                        page = Page1();
                        break;
                      }
                    case "/main/2":
                      {
                        page = Page2();
                        break;
                      }
                    default:
                      {
                        page = Page1();
                      }
                  }
                  return PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          page,
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(1.0, 0.0);
                        const end = Offset.zero;
                        final tween = Tween(begin: begin, end: end);
                        final offsetAnimation = animation.drive(tween);
                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      });
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
