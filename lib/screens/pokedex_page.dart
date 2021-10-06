import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:pokemon_test/bloc/navigation/navigation_bloc.dart';
import 'package:pokemon_test/bloc/navigation/navigation_event.dart';
import 'package:pokemon_test/models/navigation_pages.dart';
import 'package:pokemon_test/widgets/pokedex_card.dart';
import 'package:provider/provider.dart';

class PokedexPage extends StatelessWidget {
  static const pokedexTextStyle = TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.bold,
    color: Color(0xFF048ABF),
  );

  const PokedexPage({Key? key}) : super(key: key);

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
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 14.0,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PokedexCard(
                      title: 'Veja todos os 150 Pokémons',
                      actionDesc: 'Visualizar Pokémons ',
                      onTap: () => context
                          .read<NavigationBloc>()
                          .add(GoTo(page: POKELIST)),
                    ),
                    PokedexCard(
                      title: 'Crie já seu próprio Pokémon',
                      actionDesc: 'Cadastrar novo Pokémon',
                      onTap: () => context
                          .read<NavigationBloc>()
                          .add(GoTo(page: REGISTER)),
                    )
                  ],
                ),
                Expanded(
                  child: Container(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      Text(
                        'As circunstâncias do nascimento de alguém são irrelevantes; é o que você faz com o dom da vida que determina quem você é.',
                        textAlign: TextAlign.justify,
                        style: pokedexTextStyle,
                      ),
                      Text(
                        'Mewtwo',
                        textAlign: TextAlign.right,
                        style: pokedexTextStyle,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
