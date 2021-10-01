import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_test/bloc/pokelist/pokelist_event.dart';
import 'package:pokemon_test/bloc/pokelist/pokelist_state.dart';
import 'package:pokemon_test/models/repo_exception.dart';
import 'package:pokemon_test/service.dart';

class PokelistBloc extends Bloc<PokelistEvent, PokelistState> {
  final PokemonService pokemonService;

  PokelistBloc({required this.pokemonService}) : super(PokelistLoadingState()) {
    on<PokelistFirstLoad>((event, emit) => _loadFirstPokelist(event, emit));
    on<PokelistLoadMore>((event, emit) => _loadMorePokelist(event, emit));
    add(PokelistFirstLoad());
  }

  void _loadFirstPokelist(event, emit) async {
    try {
      final pokelistFetched = await pokemonService.fetchPokelist(0);

      emit(
        PokelistState(
          pokeList: pokelistFetched,
          currentItem: 15,
        ),
      );
    } on PokeException catch (e) {
      _emitFailedState(e);
    }
    if (state.pokeList == null) {
      add(event);
    } else {
      add(PokelistLoadMore());
    }
  }

  void _loadMorePokelist(event, emit) async {
    if (state.currentItem == state.maxItems) return;
    try {
      final pokelistFetched =
          await pokemonService.fetchPokelist(state.currentItem!);
      var pokelist = state.pokeList;

      pokelistFetched.forEach((element) => pokelist!.add(element));

      emit(
        PokelistState(
          pokeList: pokelist,
          currentItem: state.currentItem! + 15,
        ),
      );
    } on PokeException catch (e) {
      _emitFailedState(e);
    }
    add(event);
  }

  _emitFailedState(PokeException e) {
    if (state is! PokelistLoadFailedState) {
      emit(PokelistLoadFailedState(
        e.message,
        currentItem: state.currentItem,
        pokelist: state.pokeList,
      ));
    }
  }
}
