import 'package:flutter/material.dart';

class IngresarMonto extends StatelessWidget {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 150,
      child: TextField(
        onChanged: (String texto) {
          print(texto);
        },

        //onSubmitted: _handleSubmit,
        controller: _textController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixText: '\$',
          suffixIcon: Icon(
            Icons.monetization_on_outlined,
            color: Colors.green[400],
            size: 22,
          ),
        ),
      ),
    );
  }

  _handleSubmit(String texto) {
    print(texto);
  }
}
