import 'package:flutter/material.dart';
import '../models/pokemon_card.dart';
import 'card_item.dart';

class CardCollection extends StatelessWidget {
  final List<PokemonCard> pokemonCards;

  const CardCollection({super.key, required this.pokemonCards});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
      ),
      itemCount: pokemonCards.length,
      itemBuilder: (context, index) {
        return CardItem(card: pokemonCards[index]);
      },
    );
  }
}
