import 'package:flutter/material.dart';
import 'package:poke_api/config/provider/pokemon_provider.dart';
import 'package:poke_api/config/theme/theme.dart';
import 'package:poke_api/domain/use_case/pokemon/pokemon_use_case.dart';
import 'package:poke_api/infraestructure/driven_adapter/api/pokemon_api/pokemon_api.dart';
import 'package:poke_api/infraestructure/ui/screens/home_pokemons.dart';
import 'package:provider/provider.dart';

class PokeApp extends StatelessWidget {
  const PokeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PokemonProvider(
            pokemonUseCase: PokemonUseCase(
              PokemonApi(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme().getTheme(),
        title: 'Poke App',
        home: const HomePokemon(),
      ),
    );
  }
}
