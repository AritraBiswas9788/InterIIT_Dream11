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
              height: screenHeight*0.04,
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

            Container(
              height: screenHeight*0.5,

            )
          ],
        ),
      ),
    );
  }
}
