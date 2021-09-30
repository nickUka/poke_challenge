import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/bloc/pokelist/pokelist_bloc.dart';
import 'package:hello_world/widgets/my_home_page.dart';
import 'package:hello_world/repository.dart';
import 'package:hello_world/service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PokelistBloc(
        pokemonService: PokemonService(
          pokemonRepository: PokemonRepository(),
        ),
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'RobotoMono',
          primaryColor: const Color(0xFFD94A4A),
          accentColor: const Color(0xFFF2BE22),
        ),
        home: MyHomePage(),
      ),
    );
  }
}
