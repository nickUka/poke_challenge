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
