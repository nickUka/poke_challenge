import 'package:flutter/material.dart';

Future<dynamic> errorDialog({
  required BuildContext context,
  required String mainMessage,
  required String message,
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            mainMessage,
            style: TextStyle(
                color: Theme.of(context).primaryColor, fontSize: 20.0),
          ),
          content: Text(message),
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
