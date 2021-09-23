import 'dart:convert';

import 'package:hello_world/models/pokemon.dart';
import 'package:http/http.dart' as http;

class PokemonRepository {
  static Future<Pokemon> fetchPokemon(int id) async {
    final response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$id'));
    final json = jsonDecode(response.body);
    return Pokemon.fromJson(json);
  }

  static Future<Pokemon> fetchPokemonSpecies(int id) async {
    final response = await http
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon-species/$id/'));
    final json = jsonDecode(response.body);
    return Pokemon.fromJson(json);
  }
}
