import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sailing_loc/features/home/widgets/class_cards.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> classData = [
    {
      'title': 'Math 101',
      'description': 'Basic Algebra and Calculus',
      'icon': Icons.calculate
    },
    {
      'title': 'Science 101',
      'description': 'Introduction to Physics',
      'icon': Icons.science
    },
    {
      'title': 'History 101',
      'description': 'World History Overview',
      'icon': Icons.history_edu
    },
    {
      'title': 'Art 101',
      'description': 'Fundamentals of Art',
      'icon': Icons.palette
    },
    {
      'title': 'Computer Science 101',
      'description': 'Introduction to Programming',
      'icon': Icons.computer
    },
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(child: desktopView()),
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
                autoPlayInterval: const Duration(seconds: 3),
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: const BoxDecoration(color: Colors.amber),
                      child: Center(
                        child: Text(
                          'text $i',
                          style: const TextStyle(fontSize: 16.0),
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
          Container(
            height: 200, // Specify the height for the ListView
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: classData.length,
              itemBuilder: (context, index) {
                final classItem = classData[index];
                return ClassCard(
                  title: classItem['title'],
                  description: classItem['description'],
                  icon: classItem['icon'],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
