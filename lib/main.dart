import 'package:flutter/material.dart';
import 'package:hello_world/my_home_page.dart';

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
