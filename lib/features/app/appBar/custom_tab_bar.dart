import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final TabController controller;
  final List<Widget> tabs;

  CustomTabBar({required this.controller, required this.tabs});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double tabBarScaling = screenWidth > 1400
        ? 0.8
        : screenWidth > 1100
            ? 0.7
            : 0.6;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: screenWidth * tabBarScaling,
        child: Theme(
            data: ThemeData(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent),
            child: TabBar(
              controller: controller,
              tabs: tabs,
              indicatorColor: Colors.blue,
            )),
      ),
    );
  }
}
