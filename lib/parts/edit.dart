import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
Future<void> showEditDialog(BuildContext context, int item, List<Map<String, dynamic>> notesItems, List<String> categories, Function onUpdate) async {
  String noteTitleEdit = notesItems[item]["title"];
  String noteCategoryEdit = notesItems[item]["category"];
  String noteTextEdit = notesItems[item]["noteText"];
  Map<String, dynamic> detailsEdit = {};

  return showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        contentPadding: const EdgeInsets.only(top: 10.0),
        title: const Text(
          "Editing Item",
          style: TextStyle(fontSize: 24.0),
        ),
        content: SizedBox(
          height: 400,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: TextEditingController()..text = noteTitleEdit,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Title',
                      ),
                      onChanged: (value) => noteTitleEdit = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: DropdownButtonFormField<String>(
                      value: noteCategoryEdit,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Category',
                      ),
                      onChanged: (newValue) => noteCategoryEdit = newValue!,
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
                      controller: TextEditingController()..text = noteTextEdit,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Text',
                      ),
                      onChanged: (value) => noteTextEdit = value,
                      maxLines: 5,
                      minLines: 5,
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (noteTextEdit.isEmpty || noteTitleEdit.isEmpty || noteCategoryEdit.isEmpty) {
                            // Handle error, e.g., show a message
                          } else {
                            detailsEdit = {
                              "noteText": noteTextEdit,
                              "category": noteCategoryEdit,
                              "title": noteTitleEdit,
                              "position": 0
                            };
                            onUpdate(item, detailsEdit);
                            Navigator.of(context).pop();
                          }
                        },
                        child: const Text("Apply"),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Cancel"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}


Future<void> showCharacterDialog(BuildContext context, int item, List<Map<String, dynamic>> notesItems,List<String> races,List<String> classes, Function onUpdate) async {
  String name = notesItems[item]["name"];
  String race = notesItems[item]["race"];
  String classView = notesItems[item]["class"];
  Map<String, dynamic> detailsEdit = {};

  return showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        contentPadding: const EdgeInsets.only(top: 10.0),
        title: const Text(
          "Character View",
          style: TextStyle(fontSize: 24.0),
        ),
        content: SizedBox(
          height: 800,
          width: 900,
          child:
          SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: HtmlWidget(""""<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>D&D Character Sheet</title>
</head>
<body>
    <div class="character-sheet">
        <div class="sheet-header">
            <h1>Character Name</h1>
            <p>Class: Fighter | Level: 13 | Race: Fairy</p>
        </div>

        <div class="section">
            <h2>Attributes</h2>
            <div class="attributes">
                <div class="attribute">
                    <h3>Strength</h3>
                    <div class="value">18</div>
                </div>
                <div class="attribute">
                    <h3>Dexterity</h3>
                    <div class="value">16</div>
                </div>
                <div class="attribute">
                    <h3>Constitution</h3>
                    <div class="value">14</div>
                </div>
                <div class="attribute">
                    <h3>Intelligence</h3>
                    <div class="value">12</div>
                </div>
                <div class="attribute">
                    <h3>Wisdom</h3>
                    <div class="value">10</div>
                </div>
                <div class="attribute">
                    <h3>Charisma</h3>
                    <div class="value">8</div>
                </div>
            </div>
        </div>

        <div class="section">
            <h2>Equipment</h2>
            <ul class="equipment">
                <li>Longsword</li>
                <li>Shield</li>
                <li>Chainmail</li>
                <li>Health Potion</li>
            </ul>
        </div>

        <div class="section">
            <h2>Notes</h2>
            <div class="notes">
                <p>Enter additional character details or story notes here...</p>
            </div>
        </div>
    </div>
</body>
</html>
""",)
          ),
        ),
      );
    },
  );
}

Future<void> editCharacterBasicsDialog(BuildContext context, int item, List<Map<String, dynamic>> notesItems,List<String> races,List<String> classes, Function onUpdate) async {
  String nameEdit = notesItems[item]["name"];
  String raceEdit = notesItems[item]["race"];
  String classEdit = notesItems[item]["class"];
  Map<String, dynamic> detailsEdit = {};

  return showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        contentPadding: const EdgeInsets.only(top: 10.0),
        title: const Text(
          "Editing Item",
          style: TextStyle(fontSize: 24.0),
        ),
        content: SizedBox(
          height: 400,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: TextEditingController()..text = nameEdit,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Character Name',
                      ),
                      onChanged: (value) => nameEdit = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: DropdownButtonFormField<String>(
                      value: raceEdit,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Race',
                      ),
                      onChanged: (newValue) => raceEdit = newValue!,
                      items: races.map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: DropdownButtonFormField<String>(
                      value: classEdit,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Class',
                      ),
                      onChanged: (newValue) => classEdit = newValue!,
                      items: classes.map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (classEdit.isEmpty || nameEdit.isEmpty || raceEdit.isEmpty) {
                            // Handle error, e.g., show a message
                          } else {
                            detailsEdit = {
                              "class": classEdit,
                              "race": raceEdit,
                              "name": nameEdit,
                            };
                            onUpdate(item, detailsEdit);
                            Navigator.of(context).pop();
                          }
                        },
                        child: const Text("Apply"),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Cancel"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
