import 'dart:convert';

import 'package:hello_world/models/pokemon.dart';
import 'package:http/http.dart' as http;

class PokemonRepository {
  static Future<Pokemon> fetchPokemon(int id) async {
    final response1 =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$id'));
    final json1 = jsonDecode(response1.body);

    final response2 = await http.get(Uri.parse(json1['species']['url']));
    final json2 = jsonDecode(response2.body);

    return Pokemon.fromJson(json1, json2);
  }
}
