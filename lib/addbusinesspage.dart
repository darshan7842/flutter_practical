import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'gridviewscreen.dart';

class AddBusinessPage extends StatefulWidget
{
  const AddBusinessPage({super.key});

  @override
  State<AddBusinessPage> createState() => _AddBusinessPageState();
}

class _AddBusinessPageState extends State<AddBusinessPage> {
  TextEditingController businessName = TextEditingController();
  TextEditingController clientName = TextEditingController();
  TextEditingController businessContact = TextEditingController();
  TextEditingController businessEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Business", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: businessName,
                decoration: InputDecoration(
                  hintText: "Business Name",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: clientName,
                decoration: InputDecoration(
                  hintText: "Client Name",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: businessContact,
                decoration: InputDecoration(
                  hintText: "Business Contact",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: businessEmail,
                decoration: InputDecoration(
                  hintText: "Business Email",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  insertData();
                },
                child: Text("Add Business"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void insertData() async {
    final response = await http.post(
      Uri.parse("https://darshan7842.000webhostapp.com/business/insert.php"),
      body: {
        "businessName": businessName.text.trim(),
        "clientName": clientName.text.trim(),
        "businessContact": businessContact.text.trim(),
        "businessEmail": businessEmail.text.trim(),
      },
    );

    if (response.statusCode == 200) {
      if (response.body.trim() == '1') {
        print("Inserted");
       Navigator.pop(context);
      } else {
        print("Failed to insert data");
      }
    } else {
      print("Server error: ${response.statusCode}");
    }
  }
}
