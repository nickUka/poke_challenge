import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/pokelist/bloc/pokelist_event.dart';
import 'package:hello_world/pokelist/bloc/pokelist_state.dart';

import 'package:hello_world/service.dart';

class PokelistBloc extends Bloc<PokelistEvent, PokelistState> {
  final PokemonService pokemonService;

  PokelistBloc({required this.pokemonService}) : super(PokelistLoadingState()) {
    add(PokelistLoad());
    on<PokelistLoad>((event, emit) async =>
        emit(PokelistState(pokeList: await pokemonService.fetchPokelist())));
  }
}
