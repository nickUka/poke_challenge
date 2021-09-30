import 'package:hello_world/bloc/pokelist/pokelist_event.dart';
import 'package:hello_world/models/pokemon.dart';

class PokelistState {
  List<Pokemon>? pokeList = [];
  int maxItems = 150;
  int? currentItem;

  PokelistState({
    this.pokeList,
    this.currentItem,
  });
}

class PokelistLoadingState extends PokelistState {}

class PokelistLoadFailedState extends PokelistState {
  String message;
  List<Pokemon>? pokelist = [];
  int? currentItem;
  PokelistLoadFailedState(this.message, {this.pokelist, this.currentItem})
      : super(
          pokeList: pokelist,
          currentItem: currentItem,
        );
}
