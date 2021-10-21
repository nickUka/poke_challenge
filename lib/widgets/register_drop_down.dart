import 'package:flutter/material.dart';
import 'package:pokemon_test/pages/register_page.dart';

class RegisterDropDown extends StatelessWidget {
  final List<String> list;
  final String placeholder;
  final Function(String?)? onChanged;
  final String? selectedValue;

  const RegisterDropDown({
    required this.list,
    required this.placeholder,
    required this.onChanged,
    this.selectedValue,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: selectedValue,
      items: list
          .map((e) => DropdownMenuItem(
                child: Text(e),
                value: e,
              ))
          .toList(),
      onChanged: onChanged,
      onTap: () => FocusScope.of(context).unfocus(),
      icon: const Icon(
        Icons.expand_more_rounded,
        size: 40,
        color: Color(0xFF333333),
      ),
      decoration: RegisterPage.inputDeco(placeholder),
    );
  }
}
