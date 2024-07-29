import 'package:flutter/material.dart';
import 'Addclientpage.dart';
import 'addbusinesspage.dart';

class GridViewScreen extends StatelessWidget
{
@override
Widget build(BuildContext context) {
  return Scaffold(
    // appBar: AppBar(
    //   title: Text('Grid View Page'),
    // ),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddClientPage()),
              );
            },
            child: GridTile(
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.person_add, size: 50, color: Colors.blue),
                    SizedBox(height: 8),
                    Text('Add Client', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddBusinessPage()),
              );
            },
            child: GridTile(
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.business, size: 50, color: Colors.blue),
                    SizedBox(height: 8),
                    Text('Add Business', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}
