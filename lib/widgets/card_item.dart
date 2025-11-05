import 'package:flutter/material.dart';
import '../models/pokemon_card.dart';
import 'card_detail.dart';

class CardItem extends StatelessWidget {
  final PokemonCard card;

  const CardItem({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => CardDetail(card: card),
        );
      },
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                card.imageHigh,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                card.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
