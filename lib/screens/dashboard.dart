import 'package:flutter/material.dart';
import 'package:inter_iit_dream11/generated/assets.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late double screenHeight;
  late double screenWidth;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: screenHeight * 0.07,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xFF3E0307),
                    Color(0xFF000000),
                  ])),
              child: Row(
                children: [
                  Container(
                    width: screenWidth * 0.15,
                    child: BackButton(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.30,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "SA v IND    ",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "7h 00m left",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w200),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.1,
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Image.asset(
                                    Assets.assetsAddReminder,
                                    color: Colors.white,
                                  ))),
                          SizedBox(width: 10,),
                          Expanded(
                              flex: 6,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 12),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(7)
                                  ),

                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Padding(
                                              padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                                              child: Image.asset(
                                                Assets.assetsWallet,
                                                color: Colors.white,
                                              ))),
                                      const Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                                          child: Text(
                                            "₹76",
                                            style:
                                            TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                            child: Image.asset(
                                              Assets.assetsPlus,
                                            )),

                                      )
                                    ],
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: screenWidth * 0.05,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            Container(
              height: screenHeight * 0.04,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
              ),
              child: Center(
                child: Text(
                  "Teams",
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.w800),
                ),
              ),
            ),

            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: [
                  Text(
                    "You haven't created a team yet!",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "The first step to winning starts here.",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Here's our new AI generated team",
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 4,
                    child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(Assets.assetsLogo), // Placeholder avatar
                          ),
                          title: Text("Rajput Royals999"),
                          subtitle: Text("1.7L"),
                          trailing: Icon(Icons.favorite_border),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text("SA", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                  Text("3", style: TextStyle(fontSize: 18)),
                                ],
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.green,
                                child: Text("C", style: TextStyle(color: Colors.white)),
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.blue,
                                child: Text("VC", style: TextStyle(color: Colors.white)),
                              ),
                              Column(
                                children: [
                                  Text("IND", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                  Text("8", style: TextStyle(fontSize: 18)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Implement pick team logic
                                },
                                child: Text("PICK TEAM"),
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  // Implement analyse logic
                                },
                                child: Text("ANALYSE"),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "43.9K times picked",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
