import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UpcomingMatchesScreen(),
    );
  }
}

class UpcomingMatchesScreen extends StatelessWidget {
  final List<MatchCard> matches = [
    MatchCard(
      league: "ICC CWC ODI Challenge League B",
      team1: "TAN",
      team2: "HK",
      team1Name: "Tanzania",
      team2Name: "Hong Kong",
      team1LogoAsset: 'assets/images/tanzania.png',
      team2LogoAsset: 'assets/images/hong_kong.png',
      initialTimeRemaining: Duration(minutes: 3, seconds: 14),
      matchTime: "03:35 PM",
      prizePool: "₹1.5 Lakhs",
    ),
    MatchCard(
      league: "ECS T10 Malta",
      team1: "BBL",
      team2: "MMA",
      team1Name: "Bugibba Blasters",
      team2Name: "MMA Titans",
      team1LogoAsset: 'assets/images/bugibba_blasters.png',
      team2LogoAsset: 'assets/images/mma_titans.png',
      initialTimeRemaining: Duration(minutes: 8, seconds: 14),
      matchTime: "03:40 PM",
      prizePool: "₹1.5 Lakhs",
    ),
    MatchCard(
      league: "Indian Domestic Women's T20 Trophy",
      team1: "MUM-W",
      team2: "BEN-W",
      team1Name: "Mumbai Women",
      team2Name: "Bengal Women",
      team1LogoAsset: 'assets/images/mumbai_women.png',
      team2LogoAsset: 'assets/images/bengal_women.png',
      initialTimeRemaining: Duration(minutes: 58, seconds: 15),
      matchTime: "04:30 PM",
      prizePool: "₹1.5 Lakhs",
      playerHighlight: "R Ghosh, S Ishaque",
    ),
    MatchCard(
      league: "ECS T10 Malta",
      team1: "MSW",
      team2: "MAR",
      team1Name: "Msida Warriors CC",
      team2Name: "Marsa",
      team1LogoAsset: 'assets/images/msida_warriors.png',
      team2LogoAsset: 'assets/images/marsa.png',
      initialTimeRemaining: Duration(hours: 1, minutes: 28),
      matchTime: "05:00 PM",
      prizePool: "₹38 Lakhs",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF3E0307), Color(0xFF000000)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        title: Text(
          "All Upcoming Matches",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: matches.length,
        itemBuilder: (context, index) {
          return matches[index];
        },
      ),
    );
  }
}

class MatchCard extends StatefulWidget {
  final String league;
  final String team1;
  final String team2;
  final String team1Name;
  final String team2Name;
  final String team1LogoAsset;
  final String team2LogoAsset;
  final Duration initialTimeRemaining;
  final String matchTime;
  final String prizePool;
  final String? playerHighlight;

  MatchCard({
    required this.league,
    required this.team1,
    required this.team2,
    required this.team1Name,
    required this.team2Name,
    required this.team1LogoAsset,
    required this.team2LogoAsset,
    required this.initialTimeRemaining,
    required this.matchTime,
    required this.prizePool,
    this.playerHighlight,
  });

  @override
  _MatchCardState createState() => _MatchCardState();
}

class _MatchCardState extends State<MatchCard> {
  late Duration timeRemaining;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timeRemaining = widget.initialTimeRemaining;
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeRemaining.inSeconds > 0) {
        setState(() {
          timeRemaining = timeRemaining - Duration(seconds: 1);
        });
      } else {
        timer.cancel();
      }
    });
  }

  String formatDuration(Duration duration) {
    String minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    String seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 4.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            color: Colors.grey[300],
            child: Text(
              widget.league,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(widget.team1LogoAsset),
                        radius: 24.0,
                      ),
                      SizedBox(width: 8.0),
                      Text(widget.team1, style: TextStyle(fontSize: 20.0)),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text(widget.team1Name, style: TextStyle(color: Colors.grey[600])),
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      formatDuration(timeRemaining),
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(widget.matchTime, style: TextStyle(color: Colors.grey[600])),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(widget.team2, style: TextStyle(fontSize: 20.0)),
                      SizedBox(width: 8.0),
                      CircleAvatar(
                        backgroundImage: AssetImage(widget.team2LogoAsset),
                        radius: 24.0,
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text(widget.team2Name, style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Divider(color: Colors.grey[300], thickness: 1),
          SizedBox(height: 8.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text(
              "Mega ${widget.prizePool}",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
            ),
          ),
          if (widget.playerHighlight != null)
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow),
                SizedBox(width: 4.0),
                Text(widget.playerHighlight!, style: TextStyle(color: Colors.blue)),
              ],
            ),
        ],
      ),
    );
  }
}
