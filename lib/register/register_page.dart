import 'dart:math';

import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  static const inputBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
  );

  InputDecoration inputDeco(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(
        color: Colors.black,
        fontSize: 12.0,
      ),
      floatingLabelStyle: const TextStyle(color: Colors.black54),
      enabledBorder: inputBorder,
      focusedBorder: inputBorder,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(children: [
            const SizedBox(height: 40.0),
            Row(
              children: [
                TextFormField(
                  decoration: inputDeco('Nome do Pokemon'),
                  cursorColor: Colors.black12,
                ),
              ],
            ),
            DropdownButtonFormField(
              items: [
                DropdownMenuItem(
                  child: Text('oie'),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text('oie'),
                  value: 2,
                ),
              ],
              onChanged: (value) {},
              icon: Icon(
                Icons.expand_more_rounded,
                size: 40,
                color: Color(0xFF333333),
              ),
              decoration: inputDeco('Categoria'),
            ),
          ]),
        ),
      ),
    );
  }
}
