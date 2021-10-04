import 'package:flutter/material.dart';
import 'package:pokemon_test/bloc/pokelist/pokelist_state.dart';

Future<dynamic> ErrorDialog(
    BuildContext context, PokelistLoadFailedState state) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Ops, algo deu errado :(',
            style: TextStyle(
                color: Theme.of(context).primaryColor, fontSize: 20.0),
          ),
          content: Text(state.message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Okay!',
                style: TextStyle(
                  color: Color(0xFF048ABF),
                  fontSize: 15.0,
                ),
              ),
            ),
          ],
        );
      });
}
