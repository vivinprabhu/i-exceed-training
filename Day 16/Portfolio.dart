import 'package:flutter/material.dart';

import 'package:prabhu/skills.dart';

void main() {
  runApp(MyListView());
}

class MyListView extends StatelessWidget {
const MyListView({super.key});

  @override
  Widget build (BuildContext buildContext) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(backgroundColor: Color(0xffef2242), title: Text("Portfolio"), centerTitle: true,
        ),
        drawer: Drawer(backgroundColor: Color(0xffef2242),
        child: ListView(
          children: [
            Padding(padding: EdgeInsets.all(20.0)),
            ListTile(leading: Icon(Icons.home), title: Text("Home")),
            ListTile(leading: Icon(Icons.psychology), title: Text("Skills")),
            ListTile(leading: Icon(Icons.school), title: Text("Education")),
            ListTile(leading: Icon(Icons.science), title: Text("Projects")),
            ListTile(leading: Icon(Icons.perm_contact_cal_rounded), title: Text("Contact")),
          ],
        ),
        ),

        body:
            Column(
              children: [
                Expanded(child:
                ListView(
                  children: [

                    // ===== Home =====

                    Container(
                      child: Column(
                        children: [
                          Image.asset('assets/images/profile_photo.png'),
                          Padding(padding: EdgeInsets.all(20.0),
                            child: Text("Hey there, I'm a Vivinprabhu a full-stack developer, currently working as an Software Developer intern in i-Exceed pvt limited. I possess the capability to learn new technologies and have the skills to develop responsive frontend and secure backend, and integrate them seamlessly. Currently I am learning Flutter and dart"),
                          ),
                        ],
                      ),
                    ),


                    // ===== Skills =====

                    Container(
                      child: Column(
                        children: [
                          Text("Skills"),
                          SizedBox(
                            height: 200,
                            child: ListView.builder(
                                itemCount: obj.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(obj[index].skillName ?? ""),
                                  );
                                },
                              )
                          )

                        ],
                      ),
                    )

                  ],
                ),
                ),
              ],
            )

      ),
    );
  }
}