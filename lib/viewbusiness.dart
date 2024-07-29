import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ViewBusinessScreen extends StatefulWidget {
  const ViewBusinessScreen({Key? key}) : super(key: key);

  @override
  _ViewBusinessScreenState createState() => _ViewBusinessScreenState();
}

class _ViewBusinessScreenState extends State<ViewBusinessScreen> {
  List<Map<String, dynamic>> businesses = [];

  @override
  void initState() {
    super.initState();
    fetchBusinesses();
  }

  Future<void> fetchBusinesses() async {
    final response = await http.get(Uri.parse("https://darshan7842.000webhostapp.com/business/view.php"));

    if (response.statusCode == 200) {
      final List<dynamic> businessList = json.decode(response.body);
      setState(() {
        businesses = businessList.cast<Map<String, dynamic>>();
      });
    } else {
      print("Failed to load business data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Businesses', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.blue,
      ),
      body: businesses.isEmpty
          ? Center(child: CircularProgressIndicator()) // Show loading indicator while fetching data
          : ListView.builder(
        itemCount: businesses.length,
        itemBuilder: (context, index) {
          final business = businesses[index];
          return ListTile(
            title: Text('Business Name: ${business['businessName']}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
            subtitle: Text(
              'Client Name: ${business['clientName']}\n'
                  'Contact: ${business['businessContact']}\n'
                  'Email: ${business['businessEmail']}',
              style: TextStyle(fontSize: 14),
            ),
            isThreeLine: true,
          );
        },
      ),
    );
  }
}
