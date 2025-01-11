import 'package:dndsheetfillin/parts/timeLineItem.dart';
import 'package:dndsheetfillin/timeLine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
import 'dart:convert';

class TimeLineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timeline App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: TimelineScreen(),
    );
  }
}

class TimelineScreen extends StatefulWidget {
  @override
  _TimelineScreenState createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  List<Map<String, dynamic>> notesItems = [];
  List<String> _timeline = [];

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  void loadItems() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? encodedData = prefs.getString('Notes');
    if (encodedData != null) {
      var loadedNotes = List<Map<String, dynamic>>.from(json.decode(encodedData));
      List<String> loadedTimeline = loadedNotes.map((note) => note["title"] as String).toList();
      setState(() {
        notesItems = loadedNotes;
        _timeline = loadedTimeline;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Timeline'),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ),
                );
              },
              icon: Icon(Icons.arrow_back)
          )
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              // Ensure you have implemented or correctly referenced TimelinePainter
              painter: TimelinePainter(_timeline.length),
            ),
          ),
          Center(
            child: Container(
              height: 250,
              child: ReorderableListView(
                scrollDirection: Axis.horizontal,
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (newIndex > oldIndex) {
                      newIndex -= 1;
                    }
                    final String item = _timeline.removeAt(oldIndex);
                    _timeline.insert(newIndex, item);
                  });
                },
                children: List.generate(_timeline.length, (index) {
                  return Container(
                    key: ValueKey(_timeline[index]),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (index % 2 == 1) SizedBox(height: 100),
                        Column(
                          children: [
                            if (index % 2 == 1) Container(
                              height: 40,
                              width: 2,
                              color: Colors.blue,
                            ),
                            Text(_timeline[index]),
                            if (index % 2 == 0) Container(
                              height: 40,
                              width: 2,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                        if (index % 2 == 0) SizedBox(height: 100),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class TimelinePainter extends CustomPainter {
  final int itemCount;

  TimelinePainter(this.itemCount);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    final linePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1;

    double lineY = size.height / 2;

    // Draw the main timeline line
    canvas.drawLine(
      Offset(0, lineY),
      Offset(size.width, lineY),
      paint,
    );


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class TimeLinePage extends StatelessWidget {
  const TimeLinePage({Key? key, required this.title, required this.notesItems}) : super(key: key);

  final List<Map<String, dynamic>> notesItems;
  final String title;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TimelineWidget(items: notesItems.map((item) => TimelineItem.fromJson(item)).toList()),
          ],
        ),
      ),
    );
  }
}
