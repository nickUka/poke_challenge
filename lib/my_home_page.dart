import 'package:flutter/material.dart';
import 'package:hello_world/models/pokemon.dart';
import 'package:hello_world/pokedex/pokedex_page.dart';
import 'package:hello_world/pokelist/pokelist_page.dart';
import 'package:hello_world/register/register_page.dart';
import 'package:hello_world/repository.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex;
  List<Pokemon> pokemon = [];

  _MyHomePageState({this.selectedIndex = 0});

  final List<Widget> _pages = [
    PokedexPage(),
    PokelistPage(),
    RegisterPage(),
  ];

  @override
  void initState() {
    super.initState();
    print(PokemonRepository.fetchPokemon(111).toString());
  }

  void onTapped(int index) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => _pages[index]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(selectedIndex),
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
        currentIndex: selectedIndex,
        onTap: onTapped,
      ),
    );
  }
}
