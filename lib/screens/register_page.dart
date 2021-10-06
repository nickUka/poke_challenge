import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:pokemon_test/bloc/navigation/navigation_bloc.dart';
import 'package:pokemon_test/bloc/navigation/navigation_event.dart';
import 'package:pokemon_test/widgets/poke_button.dart';

class RegisterPage extends StatelessWidget {
  static const inputBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
  );

  const RegisterPage({Key? key}) : super(key: key);

  static InputDecoration inputDeco(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(
        color: Colors.black,
        fontSize: 12.0,
      ),
      floatingLabelStyle: const TextStyle(color: Colors.black54),
      enabledBorder: inputBorder,
      focusedBorder: inputBorder,
      alignLabelWithHint: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'CADASTRE SEU POKÉMON',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left_rounded,
            size: 35,
          ),
          onPressed: () => context.read<NavigationBloc>().add(const Back()),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(children: [
              const SizedBox(height: 16.0),
              const Text(
                'Crie seu próprio pokémon',
                style: TextStyle(
                    color: Color(0xFF048ABF),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32.0),
              Row(
                children: [
                  Image.asset('assets/images/pokeball.png'),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Flexible(
                    child: TextFormField(
                      decoration: RegisterPage.inputDeco('Nome do Pokemon'),
                      cursorColor: Colors.black12,
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Flexible(child: RegisterDropDown()),
                  SizedBox(width: 34.0),
                  Flexible(child: RegisterDropDown()),
                ],
              ),
              const SizedBox(height: 15),
              RegisterDropDown(),
              const SizedBox(height: 48.0),
              TextFormField(
                maxLines: 3,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  label: Text(
                    'Descrição',
                    style: TextStyle(color: Colors.black),
                  ),
                  contentPadding: EdgeInsets.all(10),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 50.0),
              PokeButton(
                title: 'Salvar',
                onTap: () {},
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class RegisterDropDown extends StatelessWidget {
  const RegisterDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: const [
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
      icon: const Icon(
        Icons.expand_more_rounded,
        size: 40,
        color: Color(0xFF333333),
      ),
      decoration: RegisterPage.inputDeco('Categoria'),
    );
  }
}
