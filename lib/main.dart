import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_test/bloc/pokelist/pokelist_bloc.dart';
import 'package:pokemon_test/bloc/tab/tab_bloc.dart';
import 'package:pokemon_test/repository.dart';
import 'package:pokemon_test/service.dart';
import 'package:pokemon_test/screens/my_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PokelistBloc(
            pokemonService: PokemonService(
              pokemonRepository: PokemonRepository(),
            ),
          ),
        ),
        BlocProvider(create: (context) => TabBloc()),
      ],
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
