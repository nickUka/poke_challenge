import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_test/bloc/pokelist/pokelist_bloc.dart';
import 'package:pokemon_test/bloc/pokelist/pokelist_state.dart';
import 'package:pokemon_test/widgets/bottom_loader.dart';
import 'package:pokemon_test/widgets/pokelist_tile.dart';
import 'package:pokemon_test/widgets/show_pokemon_info_modal.dart';

class PokelistPage extends StatelessWidget {
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
      body: BlocConsumer<PokelistBloc, PokelistState>(
        listener: (context, state) {
          if (state is PokelistLoadFailedState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is PokelistLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PokelistLoadFailedState && state.pokelist == null) {
            return Center(
              child: Text(
                'Erro!',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20.0,
                ),
              ),
            );
          }
          final pokelist = state.pokeList;
          return ListView.builder(
            itemBuilder: (ctx, i) {
              return i >= pokelist!.length
                  ? BottomLoader()
                  : PokelistTile(
                      pokemon: pokelist[i].name,
                      imgUrl: pokelist[i].imgUrl,
                      index: i,
                      onTap: () =>
                          showPokemonInfo(ctx: context, pokemon: pokelist[i]),
                    );
            },
            itemCount: state.currentItem != state.maxItems
                ? pokelist!.length + 1
                : pokelist!.length,
          );
        },
      ),
    );
  }
}
