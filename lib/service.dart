import 'package:hello_world/models/pokemon.dart';
import 'package:hello_world/repository.dart';

class PokemonService {
  PokemonRepository pokemonRepository;

  PokemonService({required this.pokemonRepository});

  Future<List<Pokemon>> fetchPokelist(int current) async {
    try {
      List<Pokemon> pokelist = [];
      for (int id = current + 1; id <= current + 15; id++) {
        pokelist.add(await PokemonRepository.fetchPokemon(id));
      }
      return pokelist;
    } catch (e) {
      throw (e);
    }
  }
}
