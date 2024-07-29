import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddClientPage extends StatefulWidget {
  const AddClientPage({super.key});

  @override
  State<AddClientPage> createState() => _AddClientPageState();
}

class _AddClientPageState extends State<AddClientPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  List<String> businessNames = [];
  String? selectedBusiness;

  @override
  void initState() {
    super.initState();
    fetchBusinessNames();
  }

  Future<void> fetchBusinessNames() async {
    final response = await http.get(Uri.parse(
        "https://darshan7842.000webhostapp.com/business/businessname.php"));

    if (response.statusCode == 200) {
      final List<dynamic> businessList = json.decode(response.body);
      setState(() {
        businessNames = businessList.cast<String>();
      });
    } else {
      print("Failed to load business names");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Client", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                    hintText: "Name", border: OutlineInputBorder()),
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                    hintText: "Email", border: OutlineInputBorder()),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: mobile,
                decoration: InputDecoration(
                    hintText: "Number", border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: selectedBusiness,
                hint: Text("Select Business"),
                items: businessNames.map((String business) {
                  return DropdownMenuItem<String>(
                    value: business,
                    child: Text(business),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedBusiness = newValue;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  insertData();
                },
                child: Text("Add Client"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void insertData() async {
    final response = await http.post(
      Uri.parse("https://darshan7842.000webhostapp.com/practical/insert.php"),
      body: {
        "name": name.text.trim(),
        "email": email.text.trim(),
        "mobile": mobile.text.trim(),
        "business": selectedBusiness ?? '',
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
