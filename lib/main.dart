import 'package:dndsheetfillin/charactersheet.dart';
import 'package:flutter/material.dart';
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
      title: 'D&D App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("D&D App"),
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
        return CharacterSheet(title: "Character sheet maker");
      case "Campaign Notes":
        return CampaigNote(title: "Campaign Notes");
      default:
        return Container(child: Text("Page Not Found"));
    }
  }
}

