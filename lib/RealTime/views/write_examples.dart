import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class WriteExamples extends StatefulWidget {
  const WriteExamples({Key? key}) : super(key: key);

  @override
  _WriteExamplesState createState() => _WriteExamplesState();
}

class _WriteExamplesState extends State<WriteExamples> {
  final database = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    final dailySpecialRef = database.child('dailySpecial/');

    return Scaffold(
      appBar: AppBar(
        title: Text("Ejemplos de Escritura"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () async{
                    try {
                      // Insert con SET
                      await dailySpecialRef
                         .set({'description': 'Cafe de Vainilla', 'price': 4.99});

//                      .child('price').set(2.99); // Actualiza el precio y mantiene la descripción

//                      .set({'price': 1.99});  // borra el resto de campos y actualiza el precio

//                      .update({'price': 1.99}); // Actualiza sólo el valor que encuentra y si no lo encuentra lo crea

                        // Multiple localizaciones
                      await database.update({
                        'dailySpecial/price': 3.99,
                        'someOtherDailySpecial/price': 4.99
                      });
                      print("Se ha esctito el especial");
                    }catch (e) {
                      print('Ha habido un error en la escritura: $e');
                    }
                  },
                  child: Text("Simple Set")),
              ElevatedButton(
                  onPressed: (){
                    final nextOrder = <String, dynamic>{
                      'description': getRandomDrink(),
                      'price': Random().nextInt(800) / 100.0,
                      'customer': getRandomName(),
                      'time': DateTime.now().millisecondsSinceEpoch
                    };
                    database
                        .child('orders')
                        .push()
                        .set(nextOrder)
                        .then((_) => print('Bebida tomada nota'))
                        .catchError(
                          (error) => print('Hay un error $error'));
                  },
                  child: Text('Añadir una orden')),
            ],
          ),
        ),
      )
    );
  }
}

String getRandomDrink() {
  final drinkList = [
    'Late',
    'Cappuccino',
    'Machiato',
    'Cortado',
    'Mocha',
    'Drip coffee',
    'Espresso',
    'Vanilla late',
    'Unicorn frappe'
  ];
  return drinkList[Random().nextInt(drinkList.length)];
}

String getRandomName(){
  final customerNames = [
    'Sam',
    'Arthur',
    'Jessica',
    'Rachel',
    'Vivian',
    'Todd',
    'Morgan',
    'Peter',
    'David',
    'Sumit'
  ];
  return customerNames[Random().nextInt(customerNames.length)];
}