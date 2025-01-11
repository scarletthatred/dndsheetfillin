import 'package:flutter/material.dart';

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
