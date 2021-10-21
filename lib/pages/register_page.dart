import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:pokemon_test/bloc/pokelist/pokelist_bloc.dart';
import 'package:pokemon_test/bloc/pokelist/pokelist_event.dart';
import 'package:pokemon_test/bloc/register/register_poke_bloc.dart';
import 'package:pokemon_test/bloc/register/register_poke_event.dart';
import 'package:pokemon_test/bloc/register/register_poke_state.dart';
import 'package:pokemon_test/constants/drop_down_values.dart';
import 'package:pokemon_test/models/navigation_pages.dart';
import 'package:pokemon_test/widgets/error_dialog.dart';
import 'package:provider/provider.dart';
import 'package:pokemon_test/bloc/navigation/navigation_bloc.dart';
import 'package:pokemon_test/bloc/navigation/navigation_event.dart';
import 'package:pokemon_test/widgets/poke_button.dart';

class RegisterPage extends StatelessWidget {
  static const inputBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
  );
  final int index;
  final _form = GlobalKey<FormState>();

  RegisterPage({required this.index, Key? key}) : super(key: key);

  static InputDecoration inputDeco(String label) {
    return InputDecoration(
      errorMaxLines: 2,
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

  void _save(BuildContext ctx) {
    if( ctx.read<RegisterPokeBloc>().state.img == null){
      errorDialog(
        context: ctx,
        mainMessage: 'Erro ao inserir pokemon',
        message: 'Você deve inserir uma foto.',
      );
      return;
    }
    if (!_form.currentState!.validate()) {
      return;
    }
    ctx.read<RegisterPokeBloc>().state.name;
    ctx.read<PokelistBloc>().add(AddNewPokemon(
        image: ctx.read<RegisterPokeBloc>().state.img!,
        name: ctx.read<RegisterPokeBloc>().state.name!,
        category: ctx.read<RegisterPokeBloc>().state.categorySelected!.last!,
        types: ctx.read<RegisterPokeBloc>().state.typesSelected!,
        abilities: ctx.read<RegisterPokeBloc>().state.abilitiesSelected!,
        description: ctx.read<RegisterPokeBloc>().state.description!));
    ctx.read<RegisterPokeBloc>().add(RegisterPokeCleanEvent());
    ctx.read<NavigationBloc>().add(GoTo(page: POKELIST));
  }

  Future _pickImage(BuildContext ctx) async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    final File imgFile = File(image.path);
    ctx.read<RegisterPokeBloc>().add(RegisterPokeEvent(img: imgFile));
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _form,
            child: Column(children: [
              const SizedBox(height: 34),
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
                  InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    child: Column(
                      children: [
                        BlocBuilder<RegisterPokeBloc, RegisterPokeState>(
                          builder: (context, state) {
                            if (state.img == null) {
                              return Image.asset('assets/images/pokeball.png');
                            }
                            return CircleAvatar(
                              backgroundImage: FileImage(state.img!),
                              radius: 63,
                            );
                          },
                        ),
                        const Text(
                          'Editar',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    onTap: () => _pickImage(context),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Flexible(
                    child: TextFormField(
                      decoration: RegisterPage.inputDeco('Nome do Pokemon'),
                      cursorColor: Colors.black12,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Insira um nome para seu pokémon';
                        }
                        return null;
                      },
                      initialValue: context.read<RegisterPokeBloc>().state.name,
                      onChanged: (value) => context
                          .read<RegisterPokeBloc>()
                          .add(RegisterPokeEvent(name: value)),
                    ),
                  ),
                ],
              ),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: MultiSelectBottomSheetField(
                        title: const Text('Categorias'),
                        buttonText: const Text('Categorias'),
                        items: Values.categories.map((value) {
                          return MultiSelectItem<String?>(value, value);
                        }).toList(),
                        buttonIcon: const Icon(
                          Icons.expand_more_rounded,
                          size: 35,
                          color: Color(0xFF333333),
                        ),
                        onSelectionChanged: (selected) {
                          if (selected.length > 1) {
                            selected.removeLast();
                          }                          
                        },
                        validator: (values) {
                          if (values == null || values.isEmpty) {
                            return 'Falta uma cat.';
                          }
                          return null;
                        },                        
                        onConfirm: (values) => context
                            .read<RegisterPokeBloc>()
                            .add(RegisterPokeEvent(
                                categorySelected: values)),
                         initialValue: context.read<RegisterPokeBloc>().state.categorySelected,
                      ),
                    ),
                    const SizedBox(width: 34.0),
                    Expanded(
                      child: MultiSelectBottomSheetField(
                        title: const Text('Tipos'),
                        buttonText: const Text('Tipos'),
                        items: Values.types.map((value) {
                          return MultiSelectItem<String?>(value, value);
                        }).toList(),
                        buttonIcon: const Icon(
                          Icons.expand_more_rounded,
                          size: 35,
                          color: Color(0xFF333333),
                        ),
                        onSelectionChanged: (selected) {
                          if (selected.length > 2) {
                            selected.removeLast();
                          }
                        },
                        validator: (values) {
                          if (values == null || values.isEmpty) {
                            return 'Falta um tipo';
                          }
                          return null;
                        },
                        onConfirm: (values){ 
                          context.read<RegisterPokeBloc>().add(RegisterPokeEvent(typesSelected: values));
                          FocusScope.of(context).unfocus();
                        },
                        initialValue: context
                            .read<RegisterPokeBloc>()
                            .state
                            .typesSelected ?? [],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              MultiSelectBottomSheetField(
                title: const Text('Habilidades'),
                buttonText: const Text('Habilidades'),
                items: Values.abilities.map((value) {
                  return MultiSelectItem<String?>(value, value);
                }).toList(),
                buttonIcon: const Icon(
                  Icons.expand_more_rounded,
                  size: 35,
                  color: Color(0xFF333333),
                ),
                onSelectionChanged: (selected) {
                  if (selected.length > 2) {
                    selected.removeLast();
                  }
                },
                validator: (values) {
                  if (values == null || values.isEmpty) {
                    return 'Selecione pelo menos uma habilidade';
                  }
                  return null;
                },
                onConfirm: (values) => context.read<RegisterPokeBloc>().add(
                      RegisterPokeEvent(
                          abilitiesSelected: values),
                    ),
                initialValue: context.read<RegisterPokeBloc>().state.abilitiesSelected ?? [],
              ),
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira uma descrição';
                  } else if (value.length <= 7) {
                    return 'Descrição muito curta';
                  }
                  return null;
                },
                initialValue: context.read<RegisterPokeBloc>().state.description,
                onChanged: (value) => context
                    .read<RegisterPokeBloc>()
                    .add(RegisterPokeEvent(description: value)),
              ),
              const SizedBox(height: 50.0),
              PokeButton(
                title: 'Salvar',
                onTap: () => _save(context),
              ),
              const SizedBox(
                height: 20,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
