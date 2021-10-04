import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_test/bloc/tab/tab_bloc.dart';
import 'package:pokemon_test/bloc/tab/tab_event.dart';
import 'package:pokemon_test/screens/pokedex_page.dart';
import 'package:pokemon_test/screens/pokelist_page.dart';
import 'package:pokemon_test/screens/register_page.dart';

class MyHomePage extends StatelessWidget {
  final List<Widget> _pages = [
    PokedexPage(),
    PokelistPage(),
    RegisterPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, int>(
      builder: (context, state) {
        return Scaffold(
          body: _pages.elementAt(state),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Theme.of(context).primaryColor,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.black38,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Pokelista',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle),
                label: 'Cadastrar',
              ),
            ],
            currentIndex: state,
            onTap: (tab) => context.read<TabBloc>().add(TabUpdate(tab)),
          ),
        );
      },
    );
  }
}
