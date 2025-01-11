import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'campaighNotes.dart';



const List<String> class5edition = <String>[
  "Fighter",
  "Barbarian",
  "Rogue",
  "Bard",
  "Wizard",
  "Sorcerer",
  "Monk",
  "Paladin",
  "Ranger",
  "Warlock",
  "Druid",
  "Cleric",
  "Blood Hunter",
  "Artificer",
  "Mystic"
];
const List<String> race = <String>[
  'Aarakocra',
  'Aasimar',
  'Aasimar-Fallen',
  'Aasimar-Protector',
  'Aasimar-Scourge',
  'Autognome',
  'Bugbear',
  'Centaur',
  'Changeling',
  'ChromaticDragonborn-Black',
  'ChromaticDragonborn-Blue',
  'ChromaticDragonborn-Green',
  'ChromaticDragonborn-Red',
  'ChromaticDragonborn-White',
  'Dhampir',
  'Dragonborn-Black',
  'Dragonborn-Blue',
  'Dragonborn-Brass',
  'Dragonborn-Bronze',
  'Dragonborn-Copper',
  'Dragonborn-Draconblood',
  'Dragonborn-Gold',
  'Dragonborn-Green',
  'Dragonborn-Ravenite',
  'Dragonborn-Red',
  'Dragonborn-Silver',
  'Dragonborn-White',
  'Dwarf-Gray(Duergar)',
  'Dwarf-Hill',
  'Dwarf-MarkofWarding',
  'Dwarf-Mountain',
  'Elf-Astral',
  'Elf-Avariel',
  'Elf-Dark(Drow)',
  'Elf-Eladrin',
  'Elf-Eladrin-Fall',
  'Elf-Eladrin-Spring',
  'Elf-Eladrin-Summer',
  'Elf-Eladrin-Winter',
  'Elf-Grugach',
  'Elf-High(Sun/Moon)',
  'Elf-High(Aereni)',
  'Elf-High(Valenar)',
  'Elf-MarkofShadows',
  'Elf-Pallid',
  'Elf-Sea',
  'Elf-Shadar-kai',
  'Elf-Wood',
  'Elf-Wood(Aereni)',
  'Elf-Wood(Valenar)',
  'Fairy',
  'Firbolg',
  'GemDragonborn-Amethyst',
  'GemDragonborn-Crystal',
  'GemDragonborn-Emerald',
  'GemDragonborn-Sapphire',
  'GemDragonborn-Topaz',
  'Genasi-Air',
  'Genasi-Earth',
  'Genasi-Fire',
  'Genasi-Water',
  'Giff',
  'Gith-Githyanki',
  'Gith-Githzerai',
  'Glitchling',
  'Gnome-Deep(Svirfneblin)',
  'Gnome-Forest',
  'Gnome-MarkofScribing',
  'Gnome-Rock',
  'Goblin',
  'Goliath',
  'Grung',
  'Hadozee',
  'Half-Elf',
  'Half-Elf-Aquatic(Variant)',
  'Half-Elf-Drow(Variant)',
  'Half-Elf-MarkofDetection',
  'Half-Elf-MarkofStorm',
  'Half-Elf-Sun/Moon(Variant)',
  'Half-Elf-Wood(Variant)',
  'Half-Orc',
  'Half-Orc-MarkofFinding',
  'Halfling-Ghostwise',
  'Halfling-Lightfoot',
  'Halfling-Lotusden',
  'Halfling-MarkofHealing',
  'Halfling-MarkofHospitality',
  'Halfling-Stout',
  'Harengon',
  'Hexblood',
  'Hobgoblin',
  'HobgoblinoftheFeywild',
  'HollowOne',
  'Human',
  'Human(Variant)',
  'Human-MarkofFinding',
  'Human-MarkofHandling',
  'Human-MarkofMaking',
  'Human-MarkofPassage',
  'Human-MarkofSentinel',
  'Kalashtar',
  'Kender',
  'Kenku',
  'Kobold',
  'Kobold(Variant)',
  'Leonin',
  'Lizardfolk',
  'Locathah',
  'Loxodon',
  'MetallicDragonborn-Brass',
  'MetallicDragonborn-Bronze',
  'MetallicDragonborn-Copper',
  'MetallicDragonborn-Gold',
  'MetallicDragonborn-Silver',
  'Minotaur',
  'Minotaur-Krynn',
  'Orc',
  'Orc-Eberron',
  'Orc-Exandria',
  'Owlfolk',
  'Owlin',
  'Plasmoid',
  'Rabitfolk',
  'Reborn',
  'Revenant-Dragonborn',
  'Revenant-Human',
  'Revenant-Racesw/Subraces',
  'Revenant-Tiefling',
  'Satyr',
  'Shifter',
  'Shifter-Beasthide',
  'Shifter-Cliffwalker',
  'Shifter-Longstride',
  'Shifter-Longtooth',
  'Shifter-Razorclaw',
  'Shifter-Swiftstride',
  'Shifter-Wildhunt',
  'SimicHybrid',
  'Tabaxi',
  'Thri-Kreen',
  'Tiefling-Abyssal',
  'Tiefling(Asmodeus)',
  'Tiefling-Baalzebul',
  'Tiefling-Devil\'sTongue',
  'Tiefling-Dispater',
  'Tiefling-Feral',
  'Tiefling-Fierna',
  'Tiefling-Glasya',
  'Tiefling-Hellfire',
  'Tiefling-Infernal',
  'Tiefling-Levistus',
  'Tiefling-Mammon',
  'Tiefling-Mephistopheles',
  'Tiefling-Winged',
  'Tiefling-Zariel',
  'Tortle',
  'Triton',
  'Vedalken',
  'Verdan',
  'Viashino',
  'Warforged',
  'Warforged-Envoy',
  'Warforged-Juggernaut',
  'Warforged-Skirmisher',
  'Yuan-TiPureblood'
];
bool multiclass = false;
List<String> page = ["Character Maker", "Notes"];
List<String> noteHeader =["Campaign Notes", "Character Notes", "Battle Notes", "Funny Quotes"];



void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String currentPage = "Campaign Notes";
  List<String> pages = ["Character sheet maker", "Campaign Notes"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DND App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("DND App"),
          actions: [
            SizedBox(
              height: 50,
              width: 200,
              child: DropdownButtonFormField<String>(
                value: currentPage,
                items: pages.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    currentPage = newValue!;
                  });
                },
              ),
            ),
          ],
        ),
        body: _buildPage(),
      ),
    );
  }

  Widget _buildPage() {
    switch (currentPage) {
      case "Character sheet maker":
        return MyHomePage(title: "Character sheet maker");
      case "Campaign Notes":
        return CampaigNote(title: "Campaign Notes");
      default:
        return Container(child: Text("Page Not Found"));
    }
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    String encodedData = json.encode(items);
    await prefs.setString('savedItems', encodedData);
  }

  void loadItems() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? encodedData = prefs.getString('savedItems');
    if (encodedData != null) {
      setState(() {
        items = List<Map<String, dynamic>>.from(json.decode(encodedData));
      });
    }
  }

  List<Map<String, dynamic>> items = [];
  Map<String, dynamic> details = {};
  String product = "";
  String productDetails = "";
  String company = "";
  int quantity = 0;
  List<String> companies = [];

  ///todo add the notes section for job notes and labor hours
  List<String> notes = [];
  int laborHours = 0;

  errorCode(int error) {
    List<String> errorCodes = [
      "There is missing Info that is required. Be sure to input the Name of the product and the quantity is above 0",
      "You tried to input an invalid quantity value. Be sure the value is above 0."
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

  edit(int item) {
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Company',
                          hintText: 'Select a company',
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            company = newValue!;
                          });
                        },
                        items: companies
                            .map<DropdownMenuItem<String>>((String value) {
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
                        controller: TextEditingController()
                          ..text = "${items[item]["product"]}",
                        readOnly: false,
                        textCapitalization: TextCapitalization.none,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Product',
                        ),
                        onChanged: (value) => product = value,
                        minLines: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: TextEditingController()
                          ..text = "${items[item]["description"]}",
                        readOnly: false,
                        textCapitalization: TextCapitalization.none,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Description',
                        ),
                        onChanged: (value) => productDetails = value,
                        maxLines: 2,
                        minLines: 1,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                          controller: TextEditingController()
                            ..text = quantity == 0
                                ? ""
                                : "${items[item]["quantity"]}",
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Quantity (required)',
                            hintText: 'Enter the Quantity of items',
                          ),
                          onChanged: (value) => quantity = int.parse(value)),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 120,
                          height: 60,
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              ///edit item submit here -------------------------------------------------
                              if (quantity > 0) {
                                if (product == "" ||
                                    product.isEmpty ||
                                    company == "" ||
                                    company.isEmpty ||
                                    productDetails == "" ||
                                    productDetails.isEmpty) {
                                  errorCode(0);
                                } else {
                                  details = {
                                    "product": product,
                                    "description": productDetails,
                                    "quantity": quantity,
                                    "company": company
                                  };
                                  items[item] = details;
                                }
                              }
                              details = {};
                              quantity = 0;
                              saveItems();
                              setState(() {});

                              ///-----------------------------------------------
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            child: const Text(
                              "Apply",
                            ),
                          ),
                        ),
                        Container(
                          width: 120,
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
                              "Cancel",
                            ),
                          ),
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

  void deleteItem(int index) {
    setState(() {
      items.removeAt(index);
      saveItems();
    });
  }

  List<Widget> buildItemList() {
    List<Widget> list = [];
    for (int i = 0; i < items.length; i++) {
      list.add(
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Company: ${items[i]["company"]} | "),
                Flexible(
                    flex: 5,
                    child: Text("Item: ${items[i]["product"]} | Quantity: ${items[i]["quantity"]}")),
                Flexible(
                    flex: 3,
                    child: Text(" | Description: ${items[i]["description"]}")),
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
    return list;
  }

  List<Widget> buildItemList2() {
    List<Widget> list = [];
    for (int i = 0; i < items.length; i++) {
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
                            child: Text("Company: ${items[i]["company"]}",
                                overflow: TextOverflow.ellipsis),
                          ),
                          Flexible(
                            child: Text("Product: ${items[i]["product"]}",
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(child: Text("Description: ${items[i]["description"]}",
                              overflow: TextOverflow.ellipsis)),
                          Flexible(child: Text("Quantity: ${items[i]["quantity"]}"
                              ,overflow: TextOverflow.ellipsis)),
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
    return list;
  }

  void sortItemsByCompany() {
    items.sort((a, b) => (a['company'] ?? "").compareTo(b['company'] ?? ""));
  }

  @override
  Widget build(BuildContext context) {
    loadItems();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyApp2(itemsList: items),
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
                              'Company', // Label for the new field
                            ),
                            onChanged: (value) => company =
                                value, // Update company state on change
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            readOnly: false,
                            textCapitalization: TextCapitalization.none,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Product',
                            ),
                            onChanged: (value) => product = value,
                            minLines: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            readOnly: false,
                            textCapitalization: TextCapitalization.none,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Description',
                            ),
                            onChanged: (value) => productDetails = value,
                            maxLines: 5,
                            minLines: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            readOnly: false,
                            textCapitalization: TextCapitalization.none,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Quantity',
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChanged: (value) =>
                            quantity = int.parse(value),
                            maxLines: 1,
                            minLines: 1,
                          ),
                        ),
                      ],
                    )),
                TextButton(
                    onPressed: () {
                      if (product == "" || product.isEmpty) {
                        errorCode(0);
                      } else {
                        if (productDetails == "" ||
                            productDetails.isEmpty) {
                          productDetails = "N/A";
                        }
                        if (!companies.contains(company)) {
                          companies.add(company);
                          companies
                              .sort(); // Optional: Sort the list alphabetically
                        }
                        details = {
                          "product": product,
                          "description": productDetails,
                          "company": company,
                          "quantity":quantity
                        };
                        items.add(details);
                        sortItemsByCompany();
                      }

                      details = {};
                      quantity = 0;
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
                  child: Column(children: buildItemList()),
                ),
              ),
            )
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
                              'Company', // Label for the new field
                            ),
                            onChanged: (value) => company =
                                value, // Update company state on change
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            readOnly: false,
                            textCapitalization: TextCapitalization.none,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Product',
                            ),
                            onChanged: (value) => product = value,
                            minLines: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            readOnly: false,
                            textCapitalization: TextCapitalization.none,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Description',
                            ),
                            onChanged: (value) => productDetails = value,
                            maxLines: 5,
                            minLines: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            readOnly: false,
                            textCapitalization: TextCapitalization.none,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Quantity',
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChanged: (value) =>
                            quantity = int.parse(value),
                            maxLines: 1,
                            minLines: 1,
                          ),
                        ),
                      ],
                    )),
                TextButton(
                    onPressed: () {
                      if (quantity > 0) {
                        if (product == "" || product.isEmpty) {
                          errorCode(0);
                        } else {
                          if (productDetails == "" ||
                              productDetails.isEmpty) {
                            productDetails = "N/A";
                          }
                          if (!companies.contains(company)) {
                            companies.add(company);
                            companies
                                .sort(); // Optional: Sort the list alphabetically
                          }
                          details = {
                            "product": product,
                            "quantity": quantity,
                            "description": productDetails,
                            "company": company
                            // Include company information
                          };
                          items.add(details);
                          sortItemsByCompany();
                        }
                      } else {
                        errorCode(1);
                      }
                      details = {};
                      quantity = 0;
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
                child: Column(children: buildItemList2()),
              ),
            )
          ],
        ),
      ),
    );
  }
}

