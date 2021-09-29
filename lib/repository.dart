import 'dart:convert';

import 'package:hello_world/models/pokemon.dart';
import 'package:http/http.dart' as http;

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
      print(e.toString());
      throw (e.toString());
    }
  }
}
