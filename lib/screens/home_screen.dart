import 'package:flutter/material.dart';

import '../models/pokemon_card.dart';
import '../utils.dart';
import '../widgets/card_collection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<PokemonCard>> pokemonCards;

  @override
  void initState() {
    super.initState();
    pokemonCards = fetchPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Collections'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.search),
          ),
        ],
        elevation: 4,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: FutureBuilder<List<PokemonCard>>(
            future: pokemonCards,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                print('❌ Error saat fetch data: ${snapshot.error}');
                print('Stack trace: ${snapshot.stackTrace}');

                return Center(
                  child: Text(
                    'An error has occurred!\n\n${snapshot.error}',
                    textAlign: TextAlign.center,
                  ),
                );
              }

              if (snapshot.hasData) {
                return CardCollection(pokemonCards: snapshot.data!);
              }

              return const Center(
                child: Text('No data found.'),
              );
            },
          ),
        ),
      ),
    );
  }
}
