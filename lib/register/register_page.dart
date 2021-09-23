import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:hello_world/pokelist/widgets/modal_button.dart';

class RegisterPage extends StatefulWidget {
  static const inputBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
  );

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
  State<RegisterPage> createState() => _RegisterPageState();

  @override
  _RegisterPageState RegisterPageState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'CADASTRE SEU POKÉMON',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(children: [
              const SizedBox(height: 40.0),
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
                children: [
                  Flexible(child: RegisterDropDown()),
                  const SizedBox(width: 34.0),
                  Flexible(child: RegisterDropDown()),
                ],
              ),
              const SizedBox(height: 30.0),
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
              const SizedBox(height: 49.0),
              ModalButton(
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
