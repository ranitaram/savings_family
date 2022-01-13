import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:savings/models/family.dart';
import 'package:savings/widgets/ingresar_cantidad.dart';
import 'package:savings/widgets/ingresar_monto.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Family> familia = [
    Family(id: '1', name: 'Ramses', cantidad: 18),
    Family(id: '2', name: 'Anahi', cantidad: 12),
    Family(id: '3', name: 'Marissa', cantidad: 20),
    Family(id: '4', name: 'Natalia', cantidad: 50),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ahorros', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
          itemCount: familia.length,
          itemBuilder: (context, i) {
            return _familyTile(familia[i]);
          }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), elevation: 1, onPressed: addNewFamily),
    );
  }

  Widget _familyTile(Family family) {
    return Dismissible(
      key: Key(family.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (DismissDirection direction) {
        print('direction:$direction');
        print('id: ${family.id}');

        //llamar el borrado en el server
      },
      background: Container(
          padding: EdgeInsets.only(left: 8.0),
          color: Colors.red,
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Eliminar integrante',
              style: TextStyle(color: Colors.white),
            ),
          )),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(family.name.substring(0, 2)),
          backgroundColor: Colors.blue[200],
        ),
        title: Text(family.name),
        subtitle: Text('Ingrese cantidad'),
        trailing: Container(height: 35, width: 150, child: IngresarCantidad()),
        onTap: () {
          //ingreseCantidad();
          print(family.name);
        },
      ),
    );
  }

  addNewFamily() {
    final textController = TextEditingController();
    if (Platform.isAndroid) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Nuevo  integrante'),
              content: TextField(
                controller: textController,
              ),
              actions: [
                MaterialButton(
                    child: Text('Add'),
                    elevation: 5,
                    textColor: Colors.blue,
                    onPressed: () => addFamilyToList(textController.text))
              ],
            );
          });
    }
    showCupertinoDialog(
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
            title: Text('Nuevo integrante'),
            content: CupertinoTextField(
              controller: textController,
            ),
            actions: [
              CupertinoDialogAction(
                isDestructiveAction: true,
                child: Text('Cancelar'),
                onPressed: () => Navigator.pop(context),
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text('Agregar'),
                onPressed: () => addFamilyToList(textController.text),
              ),
            ],
          );
        });
  }

  // ingreseCantidad() {
  //   final numberController = TextEditingController();

  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text('Ingrese la cantidad'),
  //           content: TextFormField(
  //             controller: numberController,
  //             keyboardType: TextInputType.number,
  //             decoration:
  //                 InputDecoration(hintText: '\$0', labelText: 'Cantidad:'),
  //           ),
  //           actions: [
  //             MaterialButton(
  //                 child: Text('añadir'),
  //                 elevation: 5,
  //                 textColor: Colors.blue,
  //                 onPressed: () =>
  //                     addIngreseCantidadToList(numberController.))
  //           ],
  //         );
  //       });
  // }

  void addFamilyToList(String name) {
    print(name);
    if (name.length > 1) {
      //podemos agregar
      this
          .familia
          .add(Family(id: DateTime.now().toString(), name: name, cantidad: 0));
      setState(() {});
    }
    Navigator.pop(context);
  }

  // void addIngreseCantidadToList(double cantidad) {
  //   print('$cantidad');
  //   if (cantidad > 1) {
  //     //podemos agregar
  //   }
  //   Navigator.pop(context);
  // }
}
