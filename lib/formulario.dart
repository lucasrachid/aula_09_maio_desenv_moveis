import 'package:aula_nove_de_maio/campo.dart';
import 'package:aula_nove_de_maio/formularioDTO.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Formulario extends StatelessWidget {
  var keyForm = GlobalKey<FormState>();
  var formularioDTO = new FormularioDTO();
  var name = TextEditingController();
  var email = TextEditingController();
  var cpf = TextEditingController();
  var age = TextEditingController();
  // var maskCpf = MaskTextInputFormatter('###.###.###-##');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: Form(
        key: keyForm,
        child: Column(
          children: [
            TextFormField(
              controller: name,
              decoration: InputDecoration(
                  label: Text('NOME:'), hintText: 'Informe seu nome'),
              validator: (inputValue) {
                if (inputValue == null || inputValue.isEmpty) {
                  return 'O campo é obrigatório';
                }
                formularioDTO.name = inputValue;
                return null;
              },
            ),
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                  label: Text('EMAIL:'), hintText: 'Informe seu email'),
              validator: (inputValue) {
                if (inputValue == null || inputValue.isEmpty) {
                  return 'O campo é obrigatório';
                }
                formularioDTO.email = inputValue;
                return null;
              },
            ),
            TextFormField(
              // inputFormatters: [maskCpf],
              controller: cpf,
              decoration: InputDecoration(
                  label: Text('CPF:'), hintText: 'Informe seu CPF'),
              validator: (inputValue) {
                if (inputValue == null || inputValue.isEmpty) {
                  return 'O campo é obrigatório';
                }
                formularioDTO.cpf = inputValue;
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              maxLength: 3,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                FilteringTextInputFormatter.deny(RegExp(r'[123ABC]'))
              ],
              controller: age,
              decoration: InputDecoration(
                  label: Text('Idade:'), hintText: 'Informe sua Idade'),
              validator: (inputValue) {
                if (inputValue == null || inputValue.isEmpty) {
                  return 'O campo é obrigatório';
                }
                formularioDTO.age = inputValue;
                return null;
              },
            ),
            Campo(
              rotulo: 'Nome',
              campo: name,
            ),
            ElevatedButton(
                onPressed: () {
                  if (keyForm.currentState!.validate()) {
                    // ScaffoldMessenger nao é um construtor, e precisa do contexto, para identificar o "contexto" da tela em que deve se enquadrar.
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            'Nome: ${formularioDTO.name} \nEmail: ${formularioDTO.email} \nCPF: ${formularioDTO.cpf}\nIdade: ${formularioDTO.age}')));
                  }
                },
                child: Text('ok'))
          ],
        ),
      ),
    );
  }
}
