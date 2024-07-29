import 'package:flutter/material.dart';
import 'package:flutter_practical/viewclinetscreen.dart';
import 'gridviewscreen.dart';
import 'viewbusiness.dart';

class homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GridViewScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('View Clinet'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewClientScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.business_sharp),
              title: Text('View Businesses'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewBusinessScreen()),
                );
              },
            ),

          ],
        ),
      ),
      body: GridViewScreen(),

    );
  }
}




