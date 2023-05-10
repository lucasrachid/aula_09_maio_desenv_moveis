import 'package:flutter/material.dart';

class Campo extends StatelessWidget {
  var campo = TextEditingController();
  String rotulo;

  Campo({required this.rotulo, required this.campo});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: campo,
      decoration: InputDecoration(
          label: Text('${rotulo}: '), hintText: 'Informe seu ${campo}'),
      validator: (inputValue) {
        if (inputValue == null || inputValue.isEmpty) {
          return 'O campo ${campo} é obrigatório';
        }
        return null;
      },
    );
  }
}
