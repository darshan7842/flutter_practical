import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ViewClientScreen extends StatefulWidget {
  const ViewClientScreen({Key? key}) : super(key: key);

  @override
  _ViewClientScreenState createState() => _ViewClientScreenState();
}

class _ViewClientScreenState extends State<ViewClientScreen> {
  List<Map<String, dynamic>> clients = [];

  @override
  void initState() {
    super.initState();
    fetchClients();
  }

  Future<void> fetchClients() async {
    final response = await http.get(Uri.parse("https://darshan7842.000webhostapp.com/practical/view.php"));

    if (response.statusCode == 200) {
      final List<dynamic> clientList = json.decode(response.body);
      setState(() {
        clients = clientList.cast<Map<String, dynamic>>();
      });
    } else {
      print("Failed to load client data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Clients', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.blue,
      ),
      body: clients.isEmpty
          ? Center(child: CircularProgressIndicator()) // Show loading indicator while fetching data
          : ListView.builder(
        itemCount: clients.length,
        itemBuilder: (context, index) {
          final client = clients[index];
          return ListTile(
            title: Text('Client Name: ${client['name']}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
            subtitle: Text(
              'Email: ${client['email']}\n'
                  'Mobile: ${client['mobile']}\n'
                  'Business: ${client['business']}',
              style: TextStyle(fontSize: 14),
            ),
            isThreeLine: true,
          );
        },
      ),
    );
  }
}
