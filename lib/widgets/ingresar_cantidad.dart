import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class IngresarCantidad extends StatefulWidget {
  IngresarCantidad({Key? key}) : super(key: key);

  @override
  _IngresarCantidadState createState() => _IngresarCantidadState();
}

class _IngresarCantidadState extends State<IngresarCantidad> {
  bool _numberInputIsValided = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          icon: Icon(Icons.attach_money),
          labelText: 'Ingrese monto',
          errorText: _numberInputIsValided ? null : 'Por favor ingrese monto',
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      onSubmitted: (val) =>
          Fluttertoast.showToast(msg: 'Ingresaste: ${int.parse(val)}'),
      onChanged: (String val) {
        final v = int.tryParse(val);
        debugPrint('parsed value = $v');
        if (v == null) {
          setState(() => _numberInputIsValided = false);
        } else {
          setState(() => _numberInputIsValided = true);
        }
      },
    );
  }
}
