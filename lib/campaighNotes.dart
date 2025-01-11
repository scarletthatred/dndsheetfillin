import 'dart:convert';

import 'package:dndsheetfillin/parts/edit.dart';
import 'package:dndsheetfillin/parts/timeLineItem.dart';
import 'package:dndsheetfillin/timeLine.dart';
import 'package:dndsheetfillin/timeLinePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';

class CampaigNote extends StatefulWidget {
  const CampaigNote({super.key, required this.title});

  final String title;

  @override
  State<CampaigNote> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CampaigNote> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  void saveItems() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedData = json.encode(notesItems);
    await prefs.setString('Notes', encodedData);
  }

  void loadItems() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? encodedData = prefs.getString('Notes');
    if (encodedData != null) {
      setState(() {
        notesItems = List<Map<String, dynamic>>.from(json.decode(encodedData));
      });
    }
  }

  List<Map<String, dynamic>> notesItems = [];
  Map<String, dynamic> details = {};
  Map<String, dynamic> detailsEdit = {};
  String noteText = "";
  String noteCategory = "";
  String noteCategoryDefault = "Campaign Notes";
  String noteTitle = "";
  String noteTitleEdit ="";
  String noteCategoryEdit = "";
  String noteTextEdit = "";
  List<String> titles = [];
  List<String> categories =["Campaign Notes", "Character Notes", "Battle Notes", "Funny Quotes"];
  ///todo add the notes section for job notes and labor hours
  List<String> notes = [];

  errorCode(int error) {
    List<String> errorCodes = [
      "There is missing Info that is required.",
      "You tried to input an invalid  value."
    ];
    List<String> errorTitles = ["Missing info", "Invalid Info"];
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.0,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.only(
            top: 10.0,
          ),
          title: Text(
            errorTitles[error],
            style: const TextStyle(fontSize: 24.0),
          ),
          content: SizedBox(
            height: 400,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      errorCodes[error],
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 60,
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      child: const Text(
                        "OK!",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void edit(int item) {
    showEditDialog(context, item, notesItems, categories, (index, newDetails) {
      setState(() {
        notesItems[index] = newDetails;
        saveItems();
      });
    });
  }


  void deleteItem(int index) {
    setState(() {
      notesItems.removeAt(index);
      saveItems();
    });
  }

  List<Widget> buildItemList(bool portrait) {
    List<Widget> list = [];
    if(portrait) {
      for (int i = 0; i < notesItems.length; i++) {
        list.add(
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Title: ${notesItems[i]["title"]}"),
                  Text("|"),
                  Flexible(
                      flex: 3,
                      child: Text("Category: ${notesItems[i]["category"]}")),
                  Text("|"),
                  Flexible(
                      flex: 5,
                      child: Text("Note: ${notesItems[i]["noteText"]}")),
                  Text("|"),

                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => edit(i),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => deleteItem(i),
                  ),
                ],
              ),
              const Divider(), // Adds a horizontal line between items
            ],
          ),
        );
      }
    }
    else{
      for (int i = 0; i < notesItems.length; i++) {
        list.add(
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Main content column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text("Title: ${notesItems[i]["title"]}",
                                  overflow: TextOverflow.ellipsis),
                            ),
                            Flexible(
                              child: Text("Note: ${notesItems[i]["noteText"]}",
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(child: Text("Category: ${notesItems[i]["category"]}",
                                overflow: TextOverflow.ellipsis)),

                          ],
                        ),
                      ],
                    ),
                  ),
                  // Icons column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => edit(i),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => deleteItem(i),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(), // Adds a horizontal line between items
            ],
          ),
        );
      }
    }
    return list;
  }


  void sortItemsBytitle() {
    notesItems.sort((a, b) => (a['title'] ?? "").compareTo(b['title'] ?? ""));
  }



@override
  Widget build(BuildContext context) {
    loadItems();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          TextButton(onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TimeLineApp(),
              ),
            );
          }, child: Text("TimeLine")),
          IconButton(
            onPressed: () async {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyApp2(itemsList: notesItems),
                ),
              );
            },
            icon: const Icon(Icons.picture_as_pdf),
          ),
        ],
      ),
      body: (!(MediaQuery.of(context).orientation == Orientation.portrait))
          ? SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 200,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            readOnly: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText:
                              'title', // Label for the new field
                            ),
                            onChanged: (value) => noteTitle =
                                value, // Update title state on change
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: DropdownButtonFormField<String>(
                            value: noteCategoryDefault,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Category',
                            ),
                            onChanged: (newValue) => noteCategory = newValue!,
                            items: categories.map<DropdownMenuItem<String>>((value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            readOnly: false,
                            textCapitalization: TextCapitalization.none,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Text',
                              alignLabelWithHint: true
                            ),
                            onChanged: (value) => noteText = value,
                            maxLines: 5,
                            minLines: 5,
                          ),
                        ),

                      ],
                    )),
                TextButton(
                    onPressed: () {
                      if (noteText == "" || noteText.isEmpty) {
                        errorCode(0);
                      } else {
                        if (noteCategory == "" ||
                            noteCategory.isEmpty) {
                          noteCategory = "N/A";
                        }
                        if (!titles.contains(noteTitle)) {
                          titles.add(noteTitle);
                          titles
                              .sort(); // Optional: Sort the list alphabetically
                        }
                        details = {
                          "noteText": noteText,
                          "category": noteCategory,
                          "title": noteTitle,
                          "position": 0
                        };
                        notesItems.add(details);
                        sortItemsBytitle();
                      }

                      details = {};
                      saveItems();
                      setState(() {});
                    },
                    child: const Row(
                      children: [
                        Text("Add Item"),
                        Icon(Icons.add),
                      ],
                    )),
              ],
            ),
            Expanded(
              child: Container(
                color: Colors.grey,
                child: SingleChildScrollView(
                  child: Column(children: buildItemList(true)),
                ),
              ),
            ),

          ],
        ),
      )
          : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 200,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            readOnly: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText:
                              'title', // Label for the new field
                            ),
                            onChanged: (value) => noteTitle =
                                value, // Update title state on change
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: DropdownButtonFormField<String>(
                            value: noteCategoryDefault,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Category',
                            ),
                            onChanged: (newValue) => noteCategory = newValue!,
                            items: categories.map<DropdownMenuItem<String>>((value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            readOnly: false,
                            textCapitalization: TextCapitalization.none,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Text',
                                alignLabelWithHint: true
                            ),
                            onChanged: (value) => noteText = value,
                            maxLines: 5,
                            minLines: 5,
                          ),
                        ),
                      ],
                    )),
                TextButton(
                    onPressed: () {
                        if (noteText == "" || noteText.isEmpty) {
                          errorCode(0);
                        } else {
                          if (noteCategory == "" ||
                              noteCategory.isEmpty) {
                            noteCategory = "N/A";
                          }
                          if (!titles.contains(noteTitle)) {
                            titles.add(noteTitle);
                            titles
                                .sort(); // Optional: Sort the list alphabetically
                          }
                          details = {
                            "noteText": noteText,
                            "category": noteCategory,
                            "title": noteTitle,
                            "position": 0
                          };
                          notesItems.add(details);
                          sortItemsBytitle();
                        }

                      details = {};
                      saveItems();
                      setState(() {});
                    },
                    child: const Row(
                      children: [
                        Text("Add Item"),
                        Icon(Icons.add),
                      ],
                    )),
              ],
            ),
            Container(
              color: Colors.grey,
              child: SingleChildScrollView(
                child: Column(children: buildItemList(false)),
              ),
            )
          ],
        ),
      ),
    );
  }
}