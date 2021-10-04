import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pokemon_test/models/pokemon.dart';

class PokemonRepository {
  static Future<Pokemon> fetchPokemon(int id) async {
    try {
      final responsePokemon =
          await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$id'));
      final responseSpecies = await http
          .get(Uri.parse(jsonDecode(responsePokemon.body)['species']['url']));
      return Pokemon.fromJson(
          jsonDecode(responsePokemon.body), jsonDecode(responseSpecies.body));
    } catch (e) {
      rethrow;
    }
  }
}
