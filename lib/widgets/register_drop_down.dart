import 'package:flutter/material.dart';
import 'package:pokemon_test/bloc/register_poke/register_poke_event.dart';
import 'package:pokemon_test/screens/register_page.dart';

class RegisterDropDown extends StatelessWidget {
  final List<String> list;
  final String placeholder;
  final Function(String?)? onChanged;

  const RegisterDropDown({
    required this.list,
    required this.placeholder,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: list
          .map((e) => DropdownMenuItem(
                child: Text(e),
                value: e,
              ))
          .toList(),
      onChanged: onChanged,
      icon: const Icon(
        Icons.expand_more_rounded,
        size: 40,
        color: Color(0xFF333333),
      ),
      decoration: RegisterPage.inputDeco(placeholder),
    );
  }
}
