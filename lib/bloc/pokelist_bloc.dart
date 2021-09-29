import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/bloc/pokelist_event.dart';
import 'package:hello_world/bloc/pokelist_state.dart';
import 'package:hello_world/service.dart';

class PokelistBloc extends Bloc<PokelistEvent, PokelistState> {
  final PokemonService pokemonService;

  PokelistBloc({required this.pokemonService}) : super(PokelistLoadingState()) {
    on<PokelistFirstLoad>((event, emit) => _loadFirstPokelist(emit));
    on<PokelistLoadMore>((event, emit) => _loadMorePokelist(emit));
    add(PokelistFirstLoad());
  }

  void _loadFirstPokelist(emit) async {
    final pokelistFetched = await pokemonService.fetchPokelist(0);

    emit(
      PokelistState(
        pokeList: pokelistFetched,
        currentItem: 15,
      ),
    );
    add(PokelistLoadMore());
  }

  void _loadMorePokelist(emit) async {
    if (state.currentItem == state.maxItems) return;

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
    add(PokelistLoadMore());
  }
}
