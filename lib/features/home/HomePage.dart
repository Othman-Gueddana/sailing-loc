import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? screenHeight;
  double? screenWidth;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    final isSmallScreen = screenWidth! < 715;

    return SafeArea(
      top: true,
      right: true,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        drawer: isSmallScreen
            ? Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    ListTile(
                      title: Text("Louer un bateau"),
                      onTap: () {
                        Navigator.pushNamed(context, '/main');
                      },
                    ),
                    ListTile(
                      title: Text("Louer mon bateau"),
                      onTap: () {
                        Navigator.pushNamed(context, '/main');
                      },
                    ),
                    ListTile(
                      title: Text("Permis & formation"),
                      onTap: () {
                        Navigator.pushNamed(context, '/main');
                      },
                    ),
                    ListTile(
                      title: Text("S'inscrire"),
                      onTap: () {
                        Navigator.pushNamed(context, '/main');
                      },
                    ),
                    ListTile(
                      title: Text("Login"),
                      onTap: () {
                        Navigator.pushNamed(context, '/main');
                      },
                    ),
                  ],
                ),
              )
            : null,
        appBar: isSmallScreen
            ? AppBar(
                title: Text('Menu'),
                actions: [
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ],
              )
            : AppBar(
                actions: [
                  Flexible(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/main');
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
                        Navigator.pushNamed(context, '/main');
                      },
                      child: Text("S'inscrire"),
                    ),
                  ),
                  Flexible(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/main');
                      },
                      child: Text(
                        "Login",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: desktopView(),
        ),
      ),
    );
  }

  Widget desktopView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(color: Colors.amber),
                      child: Center(
                        child: Text(
                          'text $i',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 20),
          Text('Chercher un bateau'),
          SizedBox(height: 10),
          Text('Type des bateaux'),
        ],
      ),
    );
  }
}
