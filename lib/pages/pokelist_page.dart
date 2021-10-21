import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_test/bloc/navigation/navigation_bloc.dart';
import 'package:pokemon_test/bloc/navigation/navigation_event.dart';
import 'package:pokemon_test/bloc/pokelist/pokelist_bloc.dart';
import 'package:pokemon_test/bloc/pokelist/pokelist_event.dart';
import 'package:pokemon_test/bloc/pokelist/pokelist_state.dart';
import 'package:pokemon_test/models/navigation_pages.dart';
import 'package:pokemon_test/models/pokemon.dart';
import 'package:pokemon_test/widgets/error_dialog.dart';
import 'package:pokemon_test/widgets/loading_body.dart';
import 'package:pokemon_test/widgets/pokelist_list.dart';
import 'package:pokemon_test/widgets/error_body.dart';

class PokelistPage extends StatelessWidget {
  final int index;

  const PokelistPage({required this.index, Key? key}) : super(key: key);

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
            errorDialog(
              context: context,
              mainMessage: 'Ops, algo deu errado :(',
              message: state.message,);
          }
        },
        builder: (context, state) {
          final List<Pokemon> pokelist;
          if (state is PokelistLoadingState) {
            return const LoadingBody();
          } else if (state is PokelistLoadFailedState &&
              state.pokelist == null) {
            return const ErrorBody();
          } else if (state is PokelistFavState) {
            pokelist = state.favPokelist;
          } else {
            pokelist = state.pokelist!;
          }

          return pokelist.isEmpty
              ? const Center(
                  child: Text(
                    'Sem Favoritos ainda.',
                    style: TextStyle(color: Colors.black54),
                  ),
                )
              : PokelistList(
                  pokelist: pokelist,
                  state: state,
                );
        },
      ),
    );
  }
}
