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
        appBar: AppBar(title: Text.rich(TextSpan(text: 'ABC', style: TextStyle(
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic
        ),
          children: <TextSpan>[
            TextSpan(
              text: ' Bank'
            )
          ]
        )
        ),
            backgroundColor: Color(0xFF14142d), foregroundColor: Colors.white
        ),

        drawer: Drawer(backgroundColor: Color(0xFF110c2d),
        child : ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,

        child: ListView(
          children: [
            Padding(padding: EdgeInsets.all(15.0)),
            ListTile(leading: Image.asset('assets/images/bank.png', height: 75, width: 85,color: Colors.white,)
            , title: Text("ABC Bank")),


            ExpansionTile(leading: Icon(Icons.person_2, color: Colors.white),title: Text("Personal" , style: TextStyle(color: Colors.white),),
              children: [
                  ListTile(leading: Icon(Icons.payment), title: Text("Current Account"),),
                  ListTile(leading: Icon(Icons.savings), title: Text("Savings Account"),)
          ],
            ),

            ExpansionTile(leading: Icon(Icons.account_balance, color: Colors.white),title: Text("Deposit" , style: TextStyle(color: Colors.white),),
              children: [
                ListTile(leading: Icon(Icons.wallet), title: Text("Fixed Deposit"),),
                ListTile(leading: Icon(Icons.wallet_giftcard), title: Text("Recurring Deposit"),)
              ],
            ),

            // Expansion Tile

            ExpansionTile(leading: Icon(Icons.work, color: Colors.white),title: Text("Business" , style: TextStyle(color: Colors.white),),
            children: [
              ListTile(leading: Icon(Icons.store),title: Text("Retail")),
              ListTile(leading: Icon(Icons.business_center),title: Text("Cooperate"),)
            ],),

            ListTile(leading: Icon(Icons.storefront), title: Text("iShop"),),
            ListTile(leading: Icon(Icons.diversity_3), title: Text("Resources"),),
            ListTile(leading: Icon(Icons.info), title: Text("About"),),
            ListTile(leading: Icon(Icons.help), title: Text("Help"),),
            ListTile(leading: Icon(Icons.import_contacts), title: Text("Complaints"),),
            ListTile(leading: Icon(Icons.call), title: Text("1800 10800"),),

            ListTile(tileColor: Colors.red, leading: Icon(Icons.key, color: Colors.white), title: Text("Login", style: TextStyle(color: Colors.white))),
          ],
        ),),),

        body: ListView(
          children: [
            Container(
              height: 610,
              color: Color(0xFFF4F6F7),
              child: Row(
                children: [
                  Expanded(flex: 1,
                    child: Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(20.0),
                            margin: EdgeInsets.all(30.0),
                            child: Text("MORE THAN 230 POINTS OF PRESENCE IN 29 NATIONS FULFILLING ASPIRATIONS",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF4e3eca),
                              fontSize: 30,
                            ),
                            ),
                          ),
                        ),

                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            margin: EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text("480+ Million customers across the globe" ,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 30,
                                        color: Colors.white,
                                        backgroundColor: Color(0xFF4e3eca),
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text("Only Indian bank in Fortune 500 companies" ,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 30,
                                      color: Colors.white,
                                      backgroundColor: Color(0xFF4e3eca),
                                    ),
                                  ),
                                )

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ),

                  Expanded(flex: 1, child:
                  Container(
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Image.asset('assets/images/home_1.png'),
                        )
                      ],
                    ),
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
