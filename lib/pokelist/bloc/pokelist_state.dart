import 'package:hello_world/models/pokemon.dart';

class PokelistState {
  List<Pokemon>? pokeList;

  PokelistState({this.pokeList});
}

class PokelistLoadingState extends PokelistState {}
