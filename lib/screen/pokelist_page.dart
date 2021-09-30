import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/bloc/pokelist/pokelist_bloc.dart';
import 'package:hello_world/bloc/pokelist/pokelist_state.dart';
import 'package:hello_world/widgets/bottom_loader.dart';
import 'package:hello_world/widgets/pokelist_tile.dart';
import 'package:hello_world/widgets/show_pokemon_info_modal.dart';

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
      body: BlocBuilder<PokelistBloc, PokelistState>(
        builder: (context, state) {
          if (state is PokelistLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PokelistLoadFailedState) {
            return (Center(
              child: Text(
                (state as PokelistLoadFailedState).message,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 16.0,
                ),
              ),
            ));
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
