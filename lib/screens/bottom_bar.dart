import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:world_of_words/screens/about.dart';
import 'package:world_of_words/screens/main_page.dart';
import 'package:world_of_words/screens/setting.dart';


import 'home.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  late List<Map<String, Widget>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': const Home()},
      {'page': const Setting()},
      {'page': const About()},
      {'page': const MainPage()},
    ];
    super.initState();
  }

  void _selectPage(int page) {
    setState(() {
      _selectedPageIndex = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                  top: BorderSide(
                color: Colors.grey,
                width: 0.6,
              ))),
          child: BottomNavigationBar(
            onTap: _selectPage,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.blueGrey,
            selectedItemColor: Colors.purple,
            currentIndex: _selectedPageIndex,
            items: const [
              BottomNavigationBarItem(
                label:"home",
                icon: Icon(Feather.home),

              ),
              BottomNavigationBarItem(
                label:"settings",
                icon: Icon(Feather.settings),
              ),
              BottomNavigationBarItem(
                label:"info",
                icon: Icon(Feather.info),
              ),
              BottomNavigationBarItem(
                label:"star",
                icon: Icon(Feather.star),
              )
            ],
          ),
        ),
      ),
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.miniCenterDocked,
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.all(
      //       6.0),
      //   child: FloatingActionButton(
      //     hoverElevation: 15,
      //     splashColor: Colors.green,
      //     tooltip: 'Main',
      //     elevation: 5,
      //     child: const Icon(Feather.star),
      //     onPressed: () => setState(() {
      //       _selectedPageIndex = 3;
      //     }),
      //   ),
      // ),
    );
  }
}
