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
  int strength = notesItems[item]["strength"];
  int dexterity= notesItems[item]["dexterity"];
  int constitution=notesItems[item]["constitution"];
  int intelligence = notesItems[item]["intelligence"];
  int wisdom = notesItems[item]["wisdom"];
  int charisma = notesItems[item]["charisma"];
  int level = notesItems[item]["level"];


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
            child: HtmlWidget("""<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>D&D Character Sheet</title>
</head>
<body style="font-family: Georgia, serif; background-color: #f4f1de; color: #333; margin: 0; padding: 0; display: flex; justify-content: center; align-items: center; height: 100vh;">
    <div style="width: 800px; background: #fff; border: 2px solid #444; border-radius: 8px; padding: 20px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);">
        <div style="text-align: center; border-bottom: 2px solid #444; padding-bottom: 10px; margin-bottom: 20px;">
            <h1 style="margin: 0; font-size: 2rem; letter-spacing: 2px;">"""+ name + """</h1>
            <p>Class: """+classView+""" | Level: """+"$level"+""" | Race: """+race+"""</p>
        </div>

        <div style="margin-bottom: 20px;">
            <h2 style="font-size: 1.5rem; margin-bottom: 10px; border-bottom: 1px solid #444; padding-bottom: 5px;">Attributes</h2>
            <div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 10px;">
                <div style="text-align: center; border: 2px solid #444; border-radius: 4px; padding: 10px;">
                    <h3 style="margin: 0 0 10px; font-size: 1.2rem;">Strength</h3>
                    <div style="font-size: 1.5rem; font-weight: bold;">"""+"$strength"+"""</div>
                </div>
                <div style="text-align: center; border: 2px solid #444; border-radius: 4px; padding: 10px;">
                    <h3 style="margin: 0 0 10px; font-size: 1.2rem;">Dexterity</h3>
                    <div style="font-size: 1.5rem; font-weight: bold;">"""+"$dexterity"+"""</div>
                </div>
                <div style="text-align: center; border: 2px solid #444; border-radius: 4px; padding: 10px;">
                    <h3 style="margin: 0 0 10px; font-size: 1.2rem;">Constitution</h3>
                    <div style="font-size: 1.5rem; font-weight: bold;">"""+"$constitution"+"""</div>
                </div>
                <div style="text-align: center; border: 2px solid #444; border-radius: 4px; padding: 10px;">
                    <h3 style="margin: 0 0 10px; font-size: 1.2rem;">Intelligence</h3>
                    <div style="font-size: 1.5rem; font-weight: bold;">"""+"$intelligence"+"""</div>
                </div>
                <div style="text-align: center; border: 2px solid #444; border-radius: 4px; padding: 10px;">
                    <h3 style="margin: 0 0 10px; font-size: 1.2rem;">Wisdom</h3>
                    <div style="font-size: 1.5rem; font-weight: bold;">"""+"$wisdom"+"""</div>
                </div>
                <div style="text-align: center; border: 2px solid #444; border-radius: 4px; padding: 10px;">
                    <h3 style="margin: 0 0 10px; font-size: 1.2rem;">Charisma</h3>
                    <div style="font-size: 1.5rem; font-weight: bold;">"""+"$charisma"+"""</div>
                </div>
            </div>
        </div>

        <div style="margin-bottom: 20px;">
            <h2 style="font-size: 1.5rem; margin-bottom: 10px; border-bottom: 1px solid #444; padding-bottom: 5px;">Equipment</h2>
            <ul style="list-style: none; padding: 0;">
                <li style="margin-bottom: 5px;">Longsword</li>
                <li style="margin-bottom: 5px;">Shield</li>
                <li style="margin-bottom: 5px;">Chainmail</li>
                <li style="margin-bottom: 5px;">Health Potion</li>
            </ul>
        </div>

        <div style="margin-bottom: 20px;">
            <h2 style="font-size: 1.5rem; margin-bottom: 10px; border-bottom: 1px solid #444; padding-bottom: 5px;">Notes</h2>
            <div style="border: 2px dashed #444; padding: 10px; min-height: 100px;">
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
