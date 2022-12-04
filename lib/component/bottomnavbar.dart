import 'package:flutter/material.dart';
import 'package:sell_app/Screen/favorite_page/favorite_screen.dart';
import 'package:sell_app/Screen/message_page/message_screen.dart';
import 'package:sell_app/Screen/profile_page/profile_screen.dart';
import 'package:sell_app/Screen/sales_page/sales_screen.dart';
import '../Screen/home_page/home_page.dart';
import 'component.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const MessagePage(),
    const SalesPage(),
    const FavoritePage(),
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined, color: Colors.black26),
              label: "AnaSayfa",
              activeIcon: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.home),
              )),
          BottomNavigationBarItem(
              icon: const Icon(Icons.message_outlined, color: Colors.black26),
              label: "Sohbet",
              activeIcon: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.message),
              )),
          BottomNavigationBarItem(
              icon: const Icon(Icons.sell_outlined, color: Colors.black26),
              label: "Sat",
              activeIcon: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.sell),
              )),
          BottomNavigationBarItem(
              icon: const Icon(Icons.favorite_border_outlined,
                  color: Colors.black26),
              label: "ilanlar",
              activeIcon: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.favorite),
              )),
          BottomNavigationBarItem(
              icon: const Icon(Icons.person_outline, color: Colors.black26),
              label: "Profil",
              activeIcon: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.person),
              )),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kPrimaryRedColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
