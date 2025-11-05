import 'package:flutter/material.dart';

class CardDetail extends StatelessWidget {
  final Map<String, dynamic> card;

  const CardDetail({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                card['images']['large'],
                height: 200,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              card['name'] ?? 'Unknown',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            Text("Supertype: ${card['supertype'] ?? '-'}"),
            Text("Subtype: ${(card['subtypes'] != null) ? (card['subtypes'] as List).join(', ') : '-'}"),
            Text("Rarity: ${card['rarity'] ?? '-'}"),
            Text("Artist: ${card['artist'] ?? '-'}"),
            Text("Set: ${card['set']?['name'] ?? '-'}"),

            const SizedBox(height: 12),
            if (card['flavorText'] != null)
              Text("Flavor Text:\n${card['flavorText']}",
                  style: const TextStyle(fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }
}
