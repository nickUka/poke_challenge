import 'package:flutter/material.dart';
import 'package:hello_world/pokedex/pokedex_page.dart';
import 'package:hello_world/pokelist/pokelist_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'RobotoMono',
        primaryColor: const Color(0xFFD94A4A),
        accentColor: const Color(0xFFF2BE22),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'POKEDEX',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: PokelistPage(),
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
          ]),
    );
  }
}
