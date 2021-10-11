import 'dart:async';

import 'package:bloc/bloc.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:pokemon_test/bloc/pokelist/pokelist_bloc.dart';
// import 'package:pokemon_test/bloc/pokelist/pokelist_state.dart';
import 'register_poke_event.dart';
import 'register_poke_state.dart';

class RegisterPokeBloc extends Bloc<RegisterPokeEvent, RegisterPokeState> {
  // PokelistBloc pokelistBloc;
  // StreamSubscription? pokelistStreamSubscription;

  RegisterPokeBloc() : super(RegisterPokeState()) {
    on<OnChange>((event, emit) => _onChangeCamp(event, emit, state));
  }

  // @override
  // Future<void> close() {
  //   pokelistStreamSubscription!.cancel();
  //   return super.close();
  // }
}

void _onChangeCamp(
    OnChange event, Emitter emit, RegisterPokeState state) async {
  emit(state.copyWith(
    name: event.name,
    categoryValue: event.categoriesValue,
    abilityValues: event.abilitiesValue,
    typeValues: event.typesValue,
    description: event.description,
  ));
}

// void _onStateChange(PokelistState state) {
//   final pokelist = state.pokelist;
//   final List abilities;
//   final List<String> categories;
//   final List<String> types;

//   abilities = pokelist!.map((pokemon) => pokemon.abilities).toList();
// }
