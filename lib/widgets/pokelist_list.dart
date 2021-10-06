import 'package:flutter/material.dart';
import 'package:pokemon_test/bloc/pokelist/pokelist_state.dart';
import 'package:pokemon_test/models/pokemon.dart';
import 'package:pokemon_test/widgets/bottom_loader.dart';
import 'package:pokemon_test/widgets/pokelist_tile.dart';
import 'package:pokemon_test/widgets/show_pokemon_info_modal.dart';

class PokelistList extends StatelessWidget {
  const PokelistList({Key? key, required this.pokelist, required this.state})
      : super(key: key);

  final List<Pokemon> pokelist;
  final PokelistState state;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, i) {
        return i >= pokelist.length
            ? BottomLoader()
            : PokelistTile(
                index: i,
                pokemon: pokelist[i],
                onTap: () =>
                    showPokemonInfo(ctx: context, pokemon: pokelist[i]),
              );
      },
      itemCount: (state.currentItem != state.maxItems &&
              state is! PokelistFavState &&
              state is! PokelistLoadFailedState)
          ? pokelist.length + 1
          : pokelist.length,
    );
  }
}
