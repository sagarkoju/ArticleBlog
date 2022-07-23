import 'package:flutter/material.dart';
import 'package:alphabet_scroll_view/alphabet_scroll_view.dart';

class AlphabeticalScrollerWidegt extends StatefulWidget {
  const AlphabeticalScrollerWidegt({Key? key}) : super(key: key);

  @override
  State<AlphabeticalScrollerWidegt> createState() =>
      _AlphabeticalScrollerWidegtState();
}

class _AlphabeticalScrollerWidegtState
    extends State<AlphabeticalScrollerWidegt> {
  List<String> list = [
    'angel',
    'bubbles',
    'shimmer',
    'angelic',
    'bubbly',
    'glimmer',
    'baby',
    'pink',
    'little',
    'butterfly',
    'sparkly',
    'doll',
    'sweet',
    'sparkles',
    'dolly',
    'sweetie',
    'sprinkles',
    'lolly',
    'princess',
    'fairy',
    'honey',
    'snowflake',
    'pretty',
    'sugar',
    'cherub',
    'lovely',
    'blossom',
    'Ecophobia',
    'Hippophobia',
    'Scolionophobia',
    'Ergophobia',
    'Musophobia',
    'Zemmiphobia',
    'Geliophobia',
    'Tachophobia',
    'Hadephobia',
    'Radiophobia',
    'Turbo Slayer',
    'Cryptic Hatter',
    'Crash TV',
    'Blue Defender',
    'Toxic Headshot',
    'Iron Merc',
    'Steel Titan',
    'Stealthed Defender',
    'Blaze Assault',
    'Venom Fate',
    'Dark Carnage',
    'Fatal Destiny',
    'Ultimate Beast',
    'Masked Titan',
    'Frozen Gunner',
    'Bandalls',
    'Wattlexp',
    'Sweetiele',
    'HyperYauFarer',
    'Editussion',
    'Experthead',
    'Flamesbria',
    'HeroAnhart',
    'Liveltekah',
    'Linguss',
    'Interestec',
    'FuzzySpuffy',
    'Monsterup',
    'MilkA1Baby',
    'LovesBoost',
    'Edgymnerch',
    'Ortspoon',
    'Oranolio',
    'OneMama',
    'Dravenfact',
    'Reallychel',
    'Reakefit',
    'Popularkiya',
    'Breacche',
    'Blikimore',
    'StoneWellForever',
    'Simmson',
    'BrightHulk',
    'Bootecia',
    'Spuffyffet',
    'Rozalthiric',
    'Bookman'
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alphabetical Scroller '),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: AlphabetScrollView(
              list: list.map((e) => AlphaModel(e)).toList(),
              // isAlphabetsFiltered: false,
              alignment: LetterAlignment.right,
              itemExtent: 50,
              unselectedTextStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
              selectedTextStyle: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
              overlayWidget: (value) => Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    size: 50,
                    color: Colors.red,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      // color: Theme.of(context).primaryColor,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '$value'.toUpperCase(),
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
              itemBuilder: (_, k, id) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: ListTile(
                    title: Text('$id'),
                    subtitle: const Text('Secondary text'),
                    leading: const Icon(Icons.person),
                    trailing: Radio<bool>(
                      value: false,
                      groupValue: selectedIndex != k,
                      onChanged: (value) {
                        setState(() {
                          selectedIndex = k;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
