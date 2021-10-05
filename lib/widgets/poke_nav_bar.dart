import 'package:flutter/material.dart';
import 'package:pokemon_test/bloc/navigation/navigation_bloc.dart';
import 'package:pokemon_test/bloc/navigation/navigation_event.dart';
import 'package:pokemon_test/bloc/navigation/navigation_state.dart';
import 'package:provider/provider.dart';

class PokeNavBar extends StatelessWidget {
  const PokeNavBar(
    this.state, {
    Key? key,
  }) : super(key: key);

  final NavigationState state;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
      currentIndex: state.currentPage,
      onTap: (tab) => context.read<NavigationBloc>().add(GoTo(page: tab)),
    );
  }
}
