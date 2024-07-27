import 'package:flutter/material.dart';
import 'package:sailing_loc/features/home/HomePage.dart';
import 'package:sailing_loc/features/user_auth/presentation/pages/login_page.dart';
import 'package:sailing_loc/features/user_auth/presentation/pages/sign_up.dart';
import 'package:sailing_loc/navigation.dart';
import 'package:sailing_loc/pages/page1.dart';
import 'package:sailing_loc/pages/page2.dart';

class MyMainPage extends StatefulWidget {
  const MyMainPage({super.key});

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  double? screenHeight;
  double? screenWidth;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    final isSmallScreen = screenWidth! < 715;

    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: isSmallScreen
          ? GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    ListTile(
                      title: Text("Accueil"),
                      onTap: () {
                        Navigation.mainNavigation.currentState!
                            .pushReplacementNamed("/");
                      },
                    ),
                    ListTile(
                      title: Text("Louer un bateau"),
                      onTap: () {
                        Navigation.mainNavigation.currentState!
                            .pushReplacementNamed("/");
                      },
                    ),
                    ListTile(
                      title: Text("Louer mon bateau"),
                      onTap: () {
                        Navigation.mainNavigation.currentState!
                            .pushReplacementNamed("/");
                      },
                    ),
                    ListTile(
                      title: Text("Permis & formation"),
                      onTap: () {
                        Navigation.mainNavigation.currentState!
                            .pushReplacementNamed("/");
                      },
                    ),
                    ListTile(
                      title: Text("S'inscrire"),
                      onTap: () {
                        Navigation.mainNavigation.currentState!
                            .pushReplacementNamed("/signup");
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text("Login"),
                      onTap: () {
                        Navigation.mainNavigation.currentState!
                            .pushReplacementNamed("/login");
                      },
                    ),
                  ],
                ),
              ),
            )
          : null,
      appBar: isSmallScreen
          ? AppBar()
          : AppBar(
              actions: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: TextButton(
                          onPressed: () {
                            Navigation.mainNavigation.currentState!
                                .pushReplacementNamed("/");
                          },
                          child: Image.asset(
                            "assets/icons/name_logo.png",
                          ),
                        ),
                      ),
                      Flexible(
                        child: TextButton(
                          onPressed: () {
                            Navigation.mainNavigation.currentState!
                                .pushReplacementNamed("/");
                          },
                          child: Text("Louer un bateau"),
                        ),
                      ),
                      Flexible(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/main');
                          },
                          child: Text("Louer mon bateau"),
                        ),
                      ),
                      Flexible(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/main');
                          },
                          child: Text("Permis & formation"),
                        ),
                      ),
                      Flexible(
                        child: TextButton(
                          onPressed: () {
                            Navigation.mainNavigation.currentState!
                                .pushReplacementNamed("/signup");
                          },
                          child: Text("S'inscrire"),
                        ),
                      ),
                      Flexible(
                        child: TextButton(
                          onPressed: () {
                            Navigation.mainNavigation.currentState!
                                .pushReplacementNamed("/login");
                          },
                          child: Text(
                            "Login",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
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
                        page = HomePage();
                        break;
                      }
                    case "/login":
                      {
                        page = LoginPage();
                        break;
                      }
                    case "/signup":
                      {
                        page = SignUpPage();
                        break;
                      }
                    default:
                      {
                        page = HomePage();
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
