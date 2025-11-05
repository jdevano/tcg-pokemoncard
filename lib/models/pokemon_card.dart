class PokemonCard {
  final String id;
  final String localId;
  final String name;
  final String rarity;
  final String illustrator;
  final String category;
  final String setName;
  final String image;

  bool isChecked = false;

  PokemonCard({
    required this.id,
    required this.localId,
    required this.name,
    required this.rarity,
    required this.illustrator,
    required this.category,
    required this.setName,
    required this.image,
  });

  String get imageLow => image;
  String get imageHigh => image;


  void toggleIsChecked() {
    isChecked = !isChecked;
  }

  factory PokemonCard.fromJson(Map<String, dynamic> json) {
  final images = json['images'] ?? {};

  return PokemonCard(
    id: json['id'] ?? '-',
    localId: json['localId'] ?? '-',
    name: json['name'] ?? 'Unknown',
    rarity: json['rarity'] ?? 'Unknown',
    illustrator: json['illustrator'] ?? 'Unknown',
    category: json['category'] ?? 'Unknown',
    setName: json['set']?['name'] ?? 'Unknown',
    image: images['large'] ??
        images['small'] ??
        'https://tcgdex.dev/images/misc/placeholder.png',
  );
}

}
