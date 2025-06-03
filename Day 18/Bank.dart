import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(
  DevicePreview(
    enabled: true,
    builder: (context) => MyBankApp(), // Wrap your app
  ),
);

class MyBankApp extends StatelessWidget {
  const MyBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFFFA17E),
        appBar: AppBar(title: Text("ABC Bank"), backgroundColor: Color(0xFFFF7F50),centerTitle: true
        ),
        drawer: Drawer(backgroundColor: Color(0xFFFF7F50),
        child: ListView(
          children: [
            Padding(padding: EdgeInsets.all(20.0)),
            ListTile(leading: Image.asset('assets/images/bank.png', height: 75, width: 85,color: Colors.white,)
            , title: Text("ABC Bank")),

            // Divider(color: Colors.red,),

            ListTile(leading: Icon(Icons.person_2), title: Text("Personal"),),
            ListTile(leading: Icon(Icons.flight_land), title: Text("NRI"),),

            // Expansion Tile

            ExpansionTile(leading: Icon(Icons.work),title: Text("Business"),
            children: [
              ListTile(leading: Icon(Icons.store),title: Text("Retail")),
              ListTile(leading: Icon(Icons.business_center),title: Text("Cooperate"),)
            ],),
            // Divider(color: Colors.red,),
            ListTile(leading: Icon(Icons.storefront), title: Text("iShop"),),
            ListTile(leading: Icon(Icons.diversity_3), title: Text("Resources"),),
            ListTile(leading: Icon(Icons.info), title: Text("About"),),
            ListTile(leading: Icon(Icons.help), title: Text("Help"),),
            ListTile(leading: Icon(Icons.import_contacts), title: Text("Complaints"),),
            ListTile(leading: Icon(Icons.call), title: Text("1800 10800"),),

            ListTile(tileColor: Colors.red, leading: Icon(Icons.key, color: Colors.white), title: Text("Login", style: TextStyle(color: Colors.white))),
          ],
        ),),
        
        body: Column(

            children: [

              Expanded(
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.red,
                  child: Text("I am going to implement the Text widget properties one by one. This is container 1. The properties include maxLines for displaying only that much of lines. then textAlign. It includes left, right, start, end, center, justify. Now text diretion. It includes ltr and rtl (left to right and right ot left). Text overflow includes ellipsis, fade",
                    // maxLines: 5,
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.ltr,
                    overflow: TextOverflow.fade,
                  ),
                ),
              )   ,
              Expanded(
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.green,

                  child: Text("Here we will continue with style properties. This includes fontFamily, fontSize, color, background color, letterSpacing, wordSpacing, fontWeight, decoration (line through, underline, overline)",
                    style: TextStyle(color: Colors.yellowAccent,
                      fontFamily: "Monospace",
                      fontSize: 14,
                      backgroundColor: Colors.pinkAccent,
                      // letterSpacing: 33.0,
                      // wordSpacing: 33.0,
                      fontWeight: FontWeight.w800,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.blue,
                      decorationThickness: 3,
                      decorationStyle: TextDecorationStyle.wavy, // dashed, dotted, wavy
                    ),

                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                  child: Text("this is for shadows",
                  style: TextStyle(
                    fontSize: 15,
                    backgroundColor: Colors.yellowAccent,
                    shadows: [
                      Shadow(
                        color: Colors.purple,
                        offset: Offset(10,25),
                        blurRadius: 10.0,
                      )
                    ],
                  ),
                  ),
                ),
                ),
              ),
            ],
        )


      ),
    );
  }
}
