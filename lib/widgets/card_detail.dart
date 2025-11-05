import 'package:flutter/material.dart';
import '../models/pokemon_card.dart';

class CardDetail extends StatelessWidget {
  final PokemonCard card;

  const CardDetail({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(card.imageHigh, height: 200),
            ),
            const SizedBox(height: 16),
            Text(
              card.name,
              style:
                  const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text("Rarity: ${card.rarity}"),
            Text("Illustrator: ${card.illustrator}"),
            Text("Category: ${card.category}"),
            Text("Set Name: ${card.setName}"),
            Text("Local ID: ${card.localId}"),
          ],
        ),
      ),
    );
  }
}
