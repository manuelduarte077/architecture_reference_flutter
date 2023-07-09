import 'package:flutter/material.dart';
import 'package:poke_api/config/provider/pokemon_provider.dart';
import 'package:poke_api/domain/models/pokemon/pokemon.dart';
import 'package:provider/provider.dart';

class HomePokemon extends StatelessWidget {
  const HomePokemon({super.key});

  @override
  Widget build(BuildContext context) {
    final providerPokemons = Provider.of<PokemonProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon APP'),
      ),
      body: FutureBuilder<List<PokeDetail>>(
        future: providerPokemons.pokemonUseCase.getPokemons(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: ((context, index) {
                PokeDetail pokeDetail = snapshot.data![index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  color: Colors.green[100],
                  shadowColor: Colors.blueGrey,
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      pokeDetail.name,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                );
              }),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.hasError}');
          }
          return const Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        },
      ),
    );
  }
}
