import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sailing_loc/features/user_auth/presentation/pages/login_page.dart';
import 'package:sailing_loc/features/user_auth/presentation/pages/sign_up.dart';
import 'package:sailing_loc/view/main_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC8b57hrJ8bGU1JhbpehYH2cSPJWP0aCUQ",
            projectId: "sailing-loc-365bd",
            messagingSenderId: "11653458982",
            appId: "1:11653458982:web:4fdc6c64b50a42454d4ae7"));
  }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: "",
      routes: {
        "": (context) => MyMainPage(),
        "/signup": (context) => SignUpPage(),
        "/login": (context) => LoginPage(),
      },
      home: MyMainPage(),
    );
  }
}

/**class MyAppPage extends StatelessWidget {
    const MyAppPage({super.key});

    @override
    Widget build(BuildContext context) {
    return CupertinoTabScaffold(
    tabBar: CupertinoTabBar(
    items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
    icon: Icon(
    Icons.home,
    semanticLabel: "Accueil",
    )),
    BottomNavigationBarItem(
    icon: Icon(
    Icons.search,
    semanticLabel: "Réserver un bateau",
    )),
    BottomNavigationBarItem(
    icon: Icon(
    Icons.directions_boat,
    semanticLabel: "Louer mon bateau",
    )),
    BottomNavigationBarItem(
    icon: Icon(
    Icons.directions_boat,
    semanticLabel: "Permis Cotier & Formation",
    )),
    BottomNavigationBarItem(
    icon: Icon(
    Icons.directions_boat,
    semanticLabel: "S'inscrire",
    )),
    BottomNavigationBarItem(
    icon: Icon(
    Icons.directions_boat,
    semanticLabel: "Login",
    ))
    ],
    ),
    tabBuilder: (context, index) {
    switch (index) {
    case 0:
    return CupertinoTabView(
    builder: (context) {
    return CupertinoPageScaffold(child: HomePage());
    },
    );
    case 1:
    return CupertinoTabView(
    builder: (context) {
    return CupertinoPageScaffold(child: HomePage());
    },
    );
    case 2:
    return CupertinoTabView(
    builder: (context) {
    return CupertinoPageScaffold(child: HomePage());
    },
    );
    case 3:
    return CupertinoTabView(
    builder: (context) {
    return CupertinoPageScaffold(child: HomePage());
    },
    );
    case 4:
    return CupertinoTabView(
    builder: (context) {
    return CupertinoPageScaffold(
    backgroundColor: Colors.white, child: SignUpPage());
    },
    );
    case 5:
    return CupertinoTabView(
    builder: (context) {
    return CupertinoPageScaffold(
    backgroundColor: Colors.white, child: LoginPage());
    },
    );
    default:
    return CupertinoTabView(
    builder: (context) {
    return CupertinoPageScaffold(
    backgroundColor: Colors.white, child: HomePage());
    },
    );
    }
    });
    }
    }
 **/
