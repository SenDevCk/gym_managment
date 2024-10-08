
import 'package:flutter/material.dart';

class UserHomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<UserHomePage> {
  Widget _drawerContent = DrawerContent1(); // Initial Drawer Content

  void _updateDrawerContent(Widget content) {
    setState(() {
      _drawerContent = content;
    });
    Navigator.pop(context); // Close the drawer after selecting an item
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Drawer Example'),
      ),
      drawer: AppDrawer(
        onMenuItemTap: _updateDrawerContent,
        drawerContent: _drawerContent,
      ),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  final Function(Widget) onMenuItemTap;
  final Widget drawerContent;

  AppDrawer({required this.onMenuItemTap, required this.drawerContent});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => onMenuItemTap(DrawerContent1()),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => onMenuItemTap(DrawerContent2()),
          ),
          Divider(),
          Expanded(
            child: drawerContent,
          ),
        ],
      ),
    );
  }
}

class DrawerContent1 extends StatefulWidget {
  @override
  _DrawerContent1State createState() => _DrawerContent1State();
}

class _DrawerContent1State extends State<DrawerContent1> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Counter 1: $_counter',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _incrementCounter,
          child: Text('Increment Counter 1'),
        ),
      ],
    );
  }
}

class DrawerContent2 extends StatefulWidget {
  @override
  _DrawerContent2State createState() => _DrawerContent2State();
}

class _DrawerContent2State extends State<DrawerContent2> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Counter 2: $_counter',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _incrementCounter,
          child: Text('Increment Counter 2'),
        ),
      ],
    );
  }
}
