import 'package:poke_api/domain/models/pokemon/gateway/pokemon_gateway.dart';
import 'package:poke_api/domain/models/pokemon/pokemon.dart';

class PokemonUseCase {
  final PokemonGateway pokemonGateway;
  PokemonUseCase(this.pokemonGateway);

  Future<List<PokeDetail>> getPokemons() {
    return pokemonGateway.getPokemons();
  }
}
