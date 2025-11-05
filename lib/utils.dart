import 'dart:convert';
import 'models/pokemon_card.dart';

const String dummyData = '''
[
  {
    "id": "xy1-1",
    "localId": "1",
    "name": "Venusaur EX",
    "rarity": "Rare Holo EX",
    "illustrator": "Eske Yoshinob",
    "category": "Pokemon",
    "set": { "name": "XY" },
    "images": {
      "small": "https://images.pokemontcg.io/xy1/1.png",
      "large": "https://images.pokemontcg.io/xy1/1_hires.png"
    }
  },
  {
    "id": "xy1-2",
    "localId": "2",
    "name": "Weedle",
    "rarity": "Common",
    "illustrator": "Mitsuhiro Arita",
    "category": "Pokemon",
    "set": { "name": "XY" },
    "images": {
      "small": "https://images.pokemontcg.io/xy1/2.png",
      "large": "https://images.pokemontcg.io/xy1/2_hires.png"
    }
  },
  {
    "id": "xy1-3",
    "localId": "3",
    "name": "Kakuna",
    "rarity": "Uncommon",
    "illustrator": "Kouki Saitou",
    "category": "Pokemon",
    "set": { "name": "XY" },
    "images": {
      "small": "https://images.pokemontcg.io/xy1/3.png",
      "large": "https://images.pokemontcg.io/xy1/3_hires.png"
    }
  }
]
''';

Future<List<PokemonCard>> fetchPokemonData() async {
  await Future.delayed(const Duration(seconds: 1));
  final List<dynamic> jsonData = json.decode(dummyData);
  return jsonData.map((e) => PokemonCard.fromJson(e)).toList();
}
