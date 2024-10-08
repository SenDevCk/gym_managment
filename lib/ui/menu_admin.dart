import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gym_managment/ui/dashboard.dart';
import 'create_members.dart';
import 'view_members.dart';

class MenuAdmin extends StatefulWidget {
  const MenuAdmin({super.key});

  @override
  State<MenuAdmin> createState() => _MenuAdminState();
}

class _MenuAdminState extends State<MenuAdmin> {
  Widget widgetForBody = DashboardPage();
  int _selectedIndex = 0;
  var name = 'Chandan Kumar Singh';
  var mobile = '9006388185';
  var designation = 'Senior Developer';
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      log('_selectedIndex $_selectedIndex');
      switch (_selectedIndex) {
        case 0:
          widgetForBody = DashboardPage();
          break;
        case 1:
          widgetForBody = CreateMember();
          break;
        case 2:
          widgetForBody = ViewMember();
          break;
        case 3:
          widgetForBody = ViewMember();
          break;
        default:
          widgetForBody = DashboardPage();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text('BSPHCL', style: TextStyle(color: Colors.white)),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: Center(
        child: widgetForBody,
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 0, top: 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        child: Image(
                            image: AssetImage('assets/images/icon.png'),
                            height: 70,
                            width: 70),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Text(name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: AutofillHints.countryName,
                                  fontWeight: FontWeight.bold)),
                          Padding(
                            padding: EdgeInsets.only(left: 0),
                            child: Text(designation,
                                style: TextStyle(
                                  color: Colors.white,
                                )
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 0),
                            child: Text(mobile,
                                style: TextStyle(
                                  color: Colors.white,
                                )
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                Navigator.pop(context);
                _onItemTapped(0);
                // Then close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Create Member'),
              selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                Navigator.pop(context);
                _onItemTapped(1);
                // Then close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('View Member'),
              selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                Navigator.pop(context);
                _onItemTapped(2);
                // Then close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.payment),
              title: const Text('Payment History'),
              selected: _selectedIndex == 3,
              onTap: () {
                // Update the state of the app
                Navigator.pop(context);
                _onItemTapped(3);
                // Then close the drawer
              },
            ),
          ],
        ),
      ),
    );
  }
}
