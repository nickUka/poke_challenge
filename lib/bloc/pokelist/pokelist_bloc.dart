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
    on<FavPokemon>((event, emit) => _toggleFavPokemon(event, emit));
    on<PokelistToggleShowFav>((event, emit) => _loggleShowFavPokelist(emit));
    add(PokelistFirstLoad());
  }

  void _loadFirstPokelist(event, emit) async {
    try {
      final pokelistFetched = await pokemonService.fetchPokelist(0);

      emit(
        PokelistState(
          pokelist: pokelistFetched,
          currentItem: 15,
        ),
      );
    } on PokeException catch (e) {
      _emitFailedState(e);
    } catch (e) {
      _emitFailedState(PokeException());
    }

    if (state.pokelist == null) {
      add(event);
    } else {
      add(PokelistLoadMore());
    }
  }

  void _loadMorePokelist(event, emit) async {
    if (state.currentItem! >= state.maxItems) return;
    try {
      final pokelistFetched =
          await pokemonService.fetchPokelist(state.currentItem!);

      var pokelist = state.pokelist;

      pokelistFetched.forEach((element) => pokelist!.add(element));

      if (state is! PokelistFavState) {
        emit(PokelistState(
          pokelist: pokelist,
          currentItem: state.currentItem! + 15,
        ));
      } else {
        emit(PokelistFavState(
          favPokelist: (state as PokelistFavState).favPokelist,
          originalPokelist: pokelist!,
          currentItem: state.currentItem! + 15,
        ));
      }
    } on PokeException catch (e) {
      _emitFailedState(e);
    } catch (e) {
      _emitFailedState(PokeException());
    }

    add(event);
  }

  void _toggleFavPokemon(FavPokemon event, emit) {
    final bool isFav = state.pokelist![event.id - 1].isFav!;
    state.pokelist![event.id - 1].isFav = !isFav;

    if (state is PokelistFavState) {
      emit(PokelistFavState(
        currentItem: (state as PokelistFavState).currentItem,
        originalPokelist: state.pokelist!,
        favPokelist:
            state.pokelist!.where((element) => element.isFav!).toList(),
      ));
    } else {
      emit(PokelistState(
        currentItem: state.currentItem,
        pokelist: state.pokelist,
      ));
    }
  }

  void _loggleShowFavPokelist(emit) {
    if (state is! PokelistFavState) {
      emit(PokelistFavState(
        favPokelist:
            state.pokelist!.where((element) => element.isFav!).toList(),
        currentItem: state.currentItem!,
        originalPokelist: state.pokelist!,
      ));
    } else {
      emit(
        PokelistState(
            pokelist: (state as PokelistFavState).originalPokelist,
            currentItem: (state as PokelistFavState).currentItem),
      );
    }
  }

  _emitFailedState(PokeException e) {
    if (state is! PokelistLoadFailedState) {
      emit(PokelistLoadFailedState(
        e.message,
        currentItem: state.currentItem,
        pokelist: state.pokelist,
      ));
    }
  }
}
