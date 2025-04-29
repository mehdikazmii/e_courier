import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled5/program/UserAdmin.dart';
import 'package:untitled5/app_screens/admin_home.dart';
import 'package:untitled5/program/admin_notification.dart';
import 'package:untitled5/theme/constant.dart';

class AdminNavBar extends StatefulWidget {
  const AdminNavBar({super.key});

  @override
  State<AdminNavBar> createState() => _AdminNavBarState();
}

class _AdminNavBarState extends State<AdminNavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    HomeAdmin(),
    AdminNotifications(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  getAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: primaryColor,
      title: Text(
        'E-Courier Admin',
        style: style1.copyWith(color: Colors.white),
      ),
      actions: [
        CircleAvatar(
          backgroundColor: secondaryColor,
          child: IconButton(
            onPressed: () {
              Get.offAll(const UserAdmin());
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
