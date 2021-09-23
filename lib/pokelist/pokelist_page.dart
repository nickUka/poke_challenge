import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/pokelist/widgets/pokelist_tile.dart';
import 'package:hello_world/pokelist/widgets/show_pokemon_info_modal.dart';

class PokelistPage extends StatefulWidget {
  @override
  State<PokelistPage> createState() => _PokelistPageState();
}

class _PokelistPageState extends State<PokelistPage> {
  final String url =
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'POKELISTA',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) => PokelistTile(
          pokemon: 'Pikachu',
          imgUrl: url,
          index: i,
          onTap: () => showPokemonInfo(context, url),
        ),
        itemCount: 150,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
