import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_test/bloc/navigation/navigation_bloc.dart';
import 'package:pokemon_test/bloc/navigation/navigation_event.dart';
import 'package:pokemon_test/bloc/pokelist/pokelist_bloc.dart';
import 'package:pokemon_test/bloc/pokelist/pokelist_event.dart';
import 'package:pokemon_test/bloc/pokelist/pokelist_state.dart';
import 'package:pokemon_test/widgets/bottom_loader.dart';
import 'package:pokemon_test/widgets/error_dialog.dart';
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
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left_rounded,
            size: 35,
          ),
          onPressed: () => context.read<NavigationBloc>().add(const Back()),
        ),
        actions: [
          BlocBuilder<PokelistBloc, PokelistState>(
            builder: (context, state) {
              return IconButton(
                icon: Icon(
                  state is PokelistFavState
                      ? Icons.star_rounded
                      : Icons.star_outline_rounded,
                  size: 35,
                ),
                onPressed: () => state is! PokelistLoadingState
                    ? context.read<PokelistBloc>().add(PokelistToggleShowFav())
                    : null,
              );
            },
          ),
        ],
      ),
      body: BlocConsumer<PokelistBloc, PokelistState>(
        listener: (context, state) {
          if (state is PokelistLoadFailedState) {
            ErrorDialog(context, state);
          }
        },
        builder: (context, state) {
          final pokelist;
          if (state is PokelistLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PokelistLoadFailedState &&
              state.pokelist == null) {
            return Center(
              child: Text(
                'Erro!',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20.0,
                ),
              ),
            );
          } else if (state is PokelistFavState) {
            pokelist = state.favPokelist;
          } else {
            pokelist = state.pokelist;
          }

          return pokelist.isEmpty
              ? const Center(
                  child: Text(
                    'Sem Favoritos ainda.',
                    style: TextStyle(color: Colors.black54),
                  ),
                )
              : ListView.builder(
                  itemBuilder: (ctx, i) {
                    return i >= pokelist!.length
                        ? BottomLoader()
                        : PokelistTile(
                            index: i,
                            pokemon: pokelist[i],
                            onTap: () => showPokemonInfo(
                                ctx: context, pokemon: pokelist[i]),
                          );
                  },
                  itemCount: (state.currentItem != state.maxItems &&
                          state is! PokelistFavState &&
                          state is! PokelistLoadFailedState)
                      ? pokelist!.length + 1
                      : pokelist!.length,
                );
        },
      ),
    );
  }
}
