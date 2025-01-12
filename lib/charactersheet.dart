import 'dart:convert';
import 'package:dndsheetfillin/parts/edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/helpers/show_number_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';


class CharacterSheet extends StatefulWidget {
  const CharacterSheet({super.key, required this.title});

  final String title;

  @override
  State<CharacterSheet> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CharacterSheet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  void saveItems() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedData = json.encode(characterItems);
    await prefs.setString('Characters', encodedData);
  }

  void loadItems() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? encodedData = prefs.getString('Characters');
    if (encodedData != null) {
      setState(() {
        characterItems =
        List<Map<String, dynamic>>.from(json.decode(encodedData));
      });
    }
  }

  List<Map<String, dynamic>> characterItems = [];
  Map<String, dynamic> details = {};
  Map<String, dynamic> detailsEdit = {};
  String characterClass = "Fighter";
  String race = "Aarakocra";
  String characterName = "";
  int characterLevel = 1;
  List<String> names = [];
  List<String> raceList = [
    'Aarakocra',
    'Aasimar',
    'Aasimar-Fallen',
    'Aasimar-Protector',
    'Aasimar-Scourge',
    'Autognome',
    'Bugbear',
    'Cat-Folk',
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
  int strength = 1;
  int dexterity=1;
  int constitution=1;
  int intelligence = 1;
  int wisdom = 1;
  int charisma = 1;

  ///todo add the notes section for job notes and labor hours
  List<String> classes = [
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
    editCharacterBasicsDialog(
        context, item, characterItems, raceList, classes, (index, newDetails) {
      setState(() {
        characterItems[index] = newDetails;
        saveItems();
      });
    });
  }

  void character(int item) {
    showCharacterDialog(
        context, item, characterItems, raceList, classes, (index, newDetails) {
      setState(() {
        characterItems[index] = newDetails;
        saveItems();
      });
    });
  }


  void deleteItem(int index) {
    setState(() {
      characterItems.removeAt(index);
      saveItems();
    });
  }

  List<Widget> buildItemList(bool portrait) {
    List<Widget> list = [];
    if (portrait) {
      for (int i = 0; i < characterItems.length; i++) {
        list.add(
          Column(
            children: [
              TextButton(
                onPressed: () => character(i),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Character Name: ${characterItems[i]["name"]}"),
                    Text("|"),
                    Flexible(
                        flex: 3,
                        child: Text("Race: ${characterItems[i]["race"]}")),
                    Text("|"),
                    Flexible(
                        flex: 5,
                        child: Text("class: ${characterItems[i]["class"]}")),
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
              ),
              const Divider(), // Adds a horizontal line between items
            ],
          ),
        );
      }
    }
    else {
      for (int i = 0; i < characterItems.length; i++) {
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
                              child: Text(
                                  "Character Name: ${characterItems[i]["name"]}",
                                  overflow: TextOverflow.ellipsis),
                            ),
                            Flexible(
                              child: Text(
                                  "Class: ${characterItems[i]["class"]}",
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(child: Text(
                                "Race: ${characterItems[i]["race"]}",
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
    characterItems.sort((a, b) => (a['name'] ?? "").compareTo(b['name'] ?? ""));
  }


  @override
  Widget build(BuildContext context) {
    loadItems();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          title: Text(widget.title),
          actions: [
            IconButton(
              onPressed: () async {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp2(itemsList: characterItems),
                  ),
                );
              },
              icon: const Icon(Icons.picture_as_pdf),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 400,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              readOnly: false,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText:
                                'Name', // Label for the new field
                              ),
                              onChanged: (value) =>
                              characterName =
                                  value, // Update title state on change
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: DropdownButtonFormField<String>(
                              value: race,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Race',
                              ),
                              onChanged: (newValue) => race = newValue!,
                              items: raceList.map<DropdownMenuItem<String>>((
                                  value) {
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
                              value: characterClass,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Class',
                              ),
                              onChanged: (newValue) => race = newValue!,
                              items: classes.map<DropdownMenuItem<String>>((
                                  value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          Padding(padding: const EdgeInsets.all(10),
                            child: TextButton(onPressed: () {
                              showMaterialNumberPicker(
                                context: context,
                                title: 'Character Level',
                                maxNumber: 20,
                                minNumber: 1,
                                selectedNumber: characterLevel,
                                onChanged: (value) => setState(() => characterLevel = value),
                              );
                            }, child: Text("Level:$characterLevel"))
                          ),
                          Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: [
                            Padding(padding: const EdgeInsets.all(10),
                              child: TextButton(onPressed: () {
                                showMaterialNumberPicker(
                                  context: context,
                                  title: 'Strength',
                                  maxNumber: 20,
                                  minNumber: 1,
                                  selectedNumber: strength,
                                  onChanged: (value) => setState(() => strength = value),
                                );
                              }, child: Text("Strength\n$strength",textAlign: TextAlign.center,))
                          ),
                            Padding(padding: const EdgeInsets.all(10),
                                child: TextButton(onPressed: () {
                                  showMaterialNumberPicker(
                                    context: context,
                                    title: 'Dexterity',
                                    maxNumber: 20,
                                    minNumber: 1,
                                    selectedNumber: dexterity,
                                    onChanged: (value) => setState(() => dexterity = value),
                                  );
                                }, child: Text("Dexterity\n$dexterity",textAlign: TextAlign.center,))
                            ),],),
                          Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: [
                           Padding(padding: const EdgeInsets.all(10),
                             child: TextButton(onPressed: () {
                               showMaterialNumberPicker(
                                 context: context,
                                 title: 'Constitution',
                                 maxNumber: 20,
                                 minNumber: 1,
                                 selectedNumber: constitution,
                                 onChanged: (value) => setState(() => constitution = value),
                               );
                             }, child: Text("Constitution\n$constitution",textAlign: TextAlign.center,))
                         ),
                           Padding(padding: const EdgeInsets.all(10),
                               child: TextButton(onPressed: () {
                                 showMaterialNumberPicker(
                                   context: context,
                                   title: 'Intelligence',
                                   maxNumber: 20,
                                   minNumber: 1,
                                   selectedNumber: intelligence,
                                   onChanged: (value) => setState(() => intelligence = value),
                                 );
                               }, child: Text("Intelligence\n$intelligence",textAlign: TextAlign.center,))
                           ),],),
                          Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: [
                            Padding(padding: const EdgeInsets.all(10),
                              child: TextButton(onPressed: () {
                                showMaterialNumberPicker(
                                  context: context,
                                  title: 'Wisdom',
                                  maxNumber: 20,
                                  minNumber: 1,
                                  selectedNumber: wisdom,
                                  onChanged: (value) => setState(() => wisdom = value),
                                );
                              }, child: Text("Wisdom\n$wisdom",textAlign: TextAlign.center,))
                          ),
                            Padding(padding: const EdgeInsets.all(10),
                                child: TextButton(onPressed: () {
                                  showMaterialNumberPicker(
                                    context: context,
                                    title: 'Charisma',
                                    maxNumber: 20,
                                    minNumber: 1,
                                    selectedNumber: charisma,
                                    onChanged: (value) => setState(() => charisma = value),
                                  );
                                }, child: Text("Charisma\n$charisma",textAlign: TextAlign.center,))
                            ),],),

                        ],
                      )),
                  TextButton(
                      onPressed: () {
                        if (characterClass == "" || characterClass.isEmpty) {
                          errorCode(0);
                        } else {
                          if (race == "" ||
                              race.isEmpty) {
                            errorCode(0);
                          }
                          if (!names.contains(characterName)) {
                            names.add(characterName);
                            names
                                .sort(); // Optional: Sort the list alphabetically
                          }
                          details = {
                            "class": characterClass,
                            "race": race,
                            "name": characterName,
                            "level":characterLevel,
                            "strength":strength,
                            "dexterity":dexterity,
                            "constitution":constitution,
                            "intelligence":intelligence,
                            "wisdom":wisdom,
                            "charisma":charisma
                          };
                          characterItems.add(details);
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
    );
  }
}