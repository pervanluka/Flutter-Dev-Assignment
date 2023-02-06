import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_assignment/pages/data_page.dart';
import 'package:flutter_dev_assignment/pages/home_page.dart';
import 'package:flutter_dev_assignment/pages/sort_page.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> pages = [const HomePage(), const DataPage(), const SortPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Rolls"),
        ),
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavyBar(
          curve: Curves.decelerate,
          itemCornerRadius: 10,
          backgroundColor: Colors.indigo,
          selectedIndex: _currentIndex,
          showElevation: true,
          onItemSelected: (index) => setState(() {
            _currentIndex = index;
          }),
          items: [
            BottomNavyBarItem(
                icon:
                    Icon(_currentIndex == 0 ? Icons.home : Icons.home_outlined),
                title: const Text('Home'),
                activeColor: Colors.white70,
                inactiveColor: Colors.grey,
                textAlign: TextAlign.center),
            BottomNavyBarItem(
                icon: Icon(_currentIndex == 1
                    ? Icons.dataset_linked
                    : Icons.dataset_linked_outlined),
                title: const Text('Data'),
                activeColor: Colors.white70,
                inactiveColor: Colors.grey,
                textAlign: TextAlign.center),
            BottomNavyBarItem(
                icon: Icon(
                    _currentIndex == 2 ? Icons.people : Icons.people_outline),
                title: const Text('Sort'),
                activeColor: Colors.white70,
                inactiveColor: Colors.grey,
                textAlign: TextAlign.center),
          ],
        ));
  }
}
