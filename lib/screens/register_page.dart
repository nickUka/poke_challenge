import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:pokemon_test/bloc/pokelist/pokelist_bloc.dart';
import 'package:pokemon_test/bloc/pokelist/pokelist_event.dart';
import 'package:pokemon_test/bloc/register_poke/register_poke_bloc.dart';
import 'package:pokemon_test/bloc/register_poke/register_poke_event.dart';
import 'package:pokemon_test/widgets/register_drop_down.dart';
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
                      onChanged: (value) => context
                          .read<RegisterPokeBloc>()
                          .add(OnChange(name: value)),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: RegisterDropDown(
                      list: context.read<RegisterPokeBloc>().state.categories!,
                      placeholder: 'Categoria',
                      onChanged: (value) => context
                          .read<RegisterPokeBloc>()
                          .add(OnChange(categoriesValue: value)),
                    ),
                  ),
                  const SizedBox(width: 34.0),
                  Flexible(
                    child: RegisterDropDown(
                      list: context.read<RegisterPokeBloc>().state.types!,
                      placeholder: 'Tipos',
                      onChanged: (value) => context
                          .read<RegisterPokeBloc>()
                          .add(OnChange(typesValue: value)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              RegisterDropDown(
                list: context.read<RegisterPokeBloc>().state.abilities!,
                placeholder: 'Habilidades',
                onChanged: (value) => context
                    .read<RegisterPokeBloc>()
                    .add(OnChange(abilitiesValue: value)),
              ),
              const SizedBox(height: 48.0),
              TextFormField(
                maxLines: 3,
                cursorColor: Colors.black,
                onChanged: (value) => context
                    .read<RegisterPokeBloc>()
                    .add(OnChange(description: value)),
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
                onTap: () {
                  final state = context.read<RegisterPokeBloc>().state;
                  context.read<PokelistBloc>().add(AddNewPokemon(
                        name: state.name!,
                        category: state.categoryValue!,
                        abilities: state.categoryValue!,
                        type: state.typeValues!,
                        description: state.description!,
                      ));
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}
