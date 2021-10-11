import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_test/bloc/navigation/navigation_bloc.dart';
import 'package:pokemon_test/bloc/pokelist/pokelist_bloc.dart';
import 'package:pokemon_test/bloc/register_poke/register_poke_bloc.dart';
import 'package:pokemon_test/repository.dart';
import 'package:pokemon_test/service.dart';
import 'package:pokemon_test/screens/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        BlocProvider(
          create: (context) => NavigationBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterPokeBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'RobotoMono',
          primaryColor: const Color(0xFFD94A4A),
          accentColor: const Color(0xFFF2BE22),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
