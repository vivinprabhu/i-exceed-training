import 'package:flutter/material.dart';

void main() {
  runApp(MyBankApp());
}

class MyBankApp extends StatelessWidget {
  const MyBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("ABC Bank"), backgroundColor: Color(0xFFFF7F50),centerTitle: true
        ),
        drawer: Drawer(backgroundColor: Color(0xFFFF7F50),
        child: ListView(
          children: [
            Padding(padding: EdgeInsets.all(20.0)),
            ListTile(leading: Image.asset('/assets/images/bank.png')),
            ListTile(leading: Icon(Icons.person_2), title: Text("Personal"),),
            ListTile(leading: Icon(Icons.flight_land), title: Text("NRI"),),
            ListTile(leading: Icon(Icons.work), title: Text("Business"),),
            ListTile(leading: Icon(Icons.storefront), title: Text("iShop"),),
            ListTile(leading: Icon(Icons.diversity_3), title: Text("Resources"),),
            ListTile(leading: Icon(Icons.info), title: Text("About"),),
            ListTile(leading: Icon(Icons.help), title: Text("Help"),),
            ListTile(leading: Icon(Icons.import_contacts), title: Text("Complaints"),),
            ListTile(leading: Icon(Icons.call), title: Text("1800 10800"),),
            ListTile(leading: Icon(Icons.key), title: Text("Login"),),
          ],
        ),),
      ),
    );
  }
}
