import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sailing_loc/features/app/footer/footer.dart';
import 'package:sailing_loc/global/widgets/type_cards.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> classData = [
    {'title': 'Voilier', 'img': "assets/icons/sailing_boat.png"},
    {'title': 'Moteur', 'img': "assets/icons/boat_engine.png"},
    {'title': 'Catamaran', 'img': "assets/icons/catamaran.png"},
    {'title': 'Semi-rigide', 'img': "assets/icons/semi_regide.png"},
    {'title': 'electrique', 'img': "assets/icons/electric_boat.png"},
  ];
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

    return SafeArea(
      top: true,
      right: true,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(child: desktopView()),
          ),
        ),
      ),
    );
  }

  Widget desktopView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
              ),
              items: [
                "assets/images/img6.jpg",
                "assets/images/img2.jpg",
                "assets/images/img3.webp",
                "assets/images/img4.jpg",
                "assets/images/img5.jpeg",
              ].map((imgPath) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        image: DecorationImage(
                            image: AssetImage(imgPath), fit: BoxFit.cover),
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
          LayoutBuilder(builder: (context, constraints) {
            // Determine the scroll direction based on the width
            bool isHorizontal = constraints.maxWidth >= 715;
            return SingleChildScrollView(
              scrollDirection: isHorizontal ? Axis.vertical : Axis.horizontal,
              child: Wrap(
                direction: isHorizontal ? Axis.horizontal : Axis.vertical,
                spacing: 8.0,
                runSpacing: 8.0,
                children: classData.map((classItem) {
                  return SizedBox(
                    width: isHorizontal ? 250 : double.infinity,
                    // Set a fixed width for horizontal scroll
                    child: ClassCard(
                      title: classItem['title'],
                      img: classItem['img'],
                    ),
                  );
                }).toList(),
              ),
            );
          }),
          SizedBox(height: 50),
          Footer(),
        ],
      ),
    );
  }
}
