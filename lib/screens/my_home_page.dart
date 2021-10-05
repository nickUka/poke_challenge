import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_test/bloc/navigation/navigation_bloc.dart';
import 'package:pokemon_test/bloc/navigation/navigation_state.dart';
import 'package:pokemon_test/bloc/navigation/navigation_event.dart';
import 'package:pokemon_test/models/navigation_pages.dart';
import 'package:pokemon_test/widgets/poke_nav_bar.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: WillPopScope(
            child: Pages.elementAt(state.currentPage),
            onWillPop: () async {
              if (state.pages.length == 1) {
                return true;
              }
              context.read<NavigationBloc>().add(const Back());
              return false;
            },
          ),
          bottomNavigationBar: PokeNavBar(state),
        );
      },
    );
  }
}
