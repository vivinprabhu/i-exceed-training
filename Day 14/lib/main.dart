import 'package:flutter/material.dart';

void main() {
  runApp(MyList());
}

class MyList extends StatelessWidget {
  const MyList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( debugShowCheckedModeBanner: false ,
        home: Scaffold(appBar: AppBar(backgroundColor: Colors.yellowAccent, foregroundColor: Colors.black87, title: Text("List View"),),
    drawer: Drawer(
      backgroundColor: Colors.redAccent,
      child: ListView(
        children: [
          ListTile(leading: Icon(Icons.home),
          title: Text("Home"),)
        ],
      ),
    ),
    body: ListView(children: [
      ListTile(leading: Icon(Icons.person),
        title: Text("Name : Vivinprabhu"),
        subtitle: Text("Role : Dev"),
        trailing: Icon(Icons.verified_rounded),

        onTap: (){
          print("Tapped...................................");
        },
        onLongPress: (){
          print("Long press...................................................");
        },
      ),
      ListTile(leading: Icon(Icons.person),
        title: Text("Name : Sanjay"),
        subtitle: Text("Role : Dev"),
        trailing: Icon(Icons.verified_rounded),

        onTap: (){
          print("Tapped...................................");
        },
        onLongPress: (){
          print("Long press...................................................");
        },
        iconColor: Colors.redAccent,
        textColor: Colors.greenAccent,
        contentPadding: EdgeInsets.all(20.0),
      ),
    ],),

            floatingActionButton: FloatingActionButton(onPressed: (){
              print("Floating Button pressed");
        },
              child: Icon(Icons.add),
        ),
        ),
    );
  }
}