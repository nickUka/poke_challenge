import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_test/bloc/pokelist/pokelist_event.dart';
import 'package:pokemon_test/bloc/pokelist/pokelist_state.dart';
import 'package:pokemon_test/models/pokemon.dart';
import 'package:pokemon_test/models/repo_exception.dart';
import 'package:pokemon_test/service.dart';

class PokelistBloc extends Bloc<PokelistEvent, PokelistState> {
  final PokemonService pokemonService;

  PokelistBloc({required this.pokemonService}) : super(PokelistLoadingState()) {
    on<PokelistFirstLoad>((event, emit) => _loadFirstPokelist(event, emit));
    on<PokelistLoadMore>((event, emit) => _loadMorePokelist(event, emit));
    on<FavPokemon>((event, emit) => _toggleFavPokemon(event, emit));
    on<PokelistToggleShowFav>((event, emit) => _loggleShowFavPokelist(emit));
    on<AddNewPokemon>((event, emit) => _addNewPokemonPokelist(event, emit));
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
      _emitFailedState(e, emit);
    } catch (e) {
      _emitFailedState(PokeException(), emit);
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
      _emitFailedState(e, emit);
    } catch (e) {
      _emitFailedState(PokeException(), emit);
    }

    add(event);
  }

  void _toggleFavPokemon(FavPokemon event, emit) {
    final bool isFav;
    if (state is PokelistFavState) {
      isFav = (state as PokelistFavState).favPokelist[event.index].isFav!;
      (state as PokelistFavState).favPokelist[event.index].isFav = !isFav;
      emit(PokelistFavState(
        currentItem: (state as PokelistFavState).currentItem,
        originalPokelist: state.pokelist!,
        favPokelist:
            state.pokelist!.where((element) => element.isFav!).toList(),
      ));
    } else {
      isFav = state.pokelist![event.index].isFav!;
      state.pokelist![event.index].isFav = !isFav;

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

  void _addNewPokemonPokelist(AddNewPokemon event, emit) {
    Pokemon newPokemon = Pokemon(
      id: state.maxItems + 1,
      name: event.name,
      abilities: event.abilities,
      category: event.category,
      types: event.types,
      description: event.description,
      img: event.image,
    );

    state.pokelist!.add(newPokemon);
    
    emit(PokelistState(
        maxItems: state.maxItems + 1,
        currentItem: state.currentItem!,
        pokelist: state.pokelist));
  }

  _emitFailedState(PokeException e, Emitter emit) {
    if (state is! PokelistLoadFailedState) {
      emit(PokelistLoadFailedState(
        e.message,
        currentItem: state.currentItem,
        pokelist: state.pokelist,
      ));
    }
  }
}
