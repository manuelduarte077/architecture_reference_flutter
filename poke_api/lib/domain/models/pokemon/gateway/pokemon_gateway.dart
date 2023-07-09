import 'package:poke_api/domain/models/pokemon/pokemon.dart';

abstract class PokemonGateway {
  Future<List<PokeDetail>> getPokemons();
}
