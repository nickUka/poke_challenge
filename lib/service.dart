import 'package:hello_world/models/pokemon.dart';
import 'package:hello_world/repository.dart';
import 'package:http/http.dart';

class PokemonService {
  PokemonRepository pokemonRepository;

  PokemonService({required this.pokemonRepository});

  Future<List<Pokemon>> fetchPokelist() async {
    List<Pokemon> pokelist = [];
    Response response;
    for (int id = 1; id >= 150; id++) {
      pokelist.add(await PokemonRepository.fetchPokemon(id));
    }
    return pokelist;
  }
}
