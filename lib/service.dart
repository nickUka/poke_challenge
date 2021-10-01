import 'dart:io';

import 'package:pokemon_test/models/pokemon.dart';
import 'package:pokemon_test/models/repo_exception.dart';
import 'package:pokemon_test/repository.dart';

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
    } on SocketException catch (e) {
      throw (PokeException(e));
    }
  }
}
