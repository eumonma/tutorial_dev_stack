import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_dev_stack/RealTime/models/daily_special.dart';

class ReadExamples extends StatefulWidget {
  const ReadExamples({Key? key}) : super(key: key);

  @override
  _ReadExamplesState createState() => _ReadExamplesState();
}

class _ReadExamplesState extends State<ReadExamples> {
  String _displayText = 'Resultados aquí';
  final _database = FirebaseDatabase.instance.reference();
  late StreamSubscription _dailySpecialStream;

  @override
  void initState(){
    super.initState();
    _activateListeners();
    //_performSingleFetch();
  }

  // Leer sólo una vez y no detecta los cambios. No necesita desactivar el listener, ya que no tiene
  void _performSingleFetch(){
    _database.child('dailySpecial').once().then((snapshot) {
      final data = new Map<String, dynamic>.from(snapshot.value);
      final dailySpecial = DailySpecial.fromRTDB(data);
      setState(() {
        _displayText = dailySpecial.fancyDescription();
      });
    });
  }


  void _activateListeners(){
    // Si se modifica el valor en la ruta "dailySpacial/description",
    // hay que borrar el listener cuando no se utilice
/*    _dailySpecialStream = _database.child('dailySpecial/description').onValue.listen((event) {
      final String? description = event.snapshot.value;
      setState(() {
        _displayText = 'Hoy hay: $description';
      });
    });
*/

/*    // para leer un bloque
    _dailySpecialStream = _database.child('dailySpecial').onValue.listen((event) {
      final data = new Map<String, dynamic>.from(event.snapshot.value);
      final description = data['description'] as String;
      final price = data['price'] as double;
      setState(() {
        _displayText = 'Hoy hay: $description por sólo ${price.toStringAsFixed(2)}';
      });
    });
*/
    // Utilizando un modelo
    _dailySpecialStream = _database.child('dailySpecial').onValue.listen((event) {
      final data = new Map<String, dynamic>.from(event.snapshot.value);
      final dailySpecial = DailySpecial.fromRTDB(data);
      setState(() {
        _displayText = dailySpecial.fancyDescription();
      });
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ejemplos de Lectura"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              children: [
                Text(
                  _displayText,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50,),

                // Si no se pone el Expanded, da error al pintar el ListView
                // Lo siguiente es para el coger de forma dinámica la lista de valores
                Expanded(
                  child: StreamBuilder(
                    stream: _database
                        .child('orders')
                        .orderByKey()
                        .limitToLast(10)
                        .onValue,
                    builder: (context, snapshot) {
                      final tilesList = <ListTile>[];
                      if (snapshot.hasData){
                        final myOrders = Map<String, dynamic>.from(
                            (snapshot.data! as Event).snapshot.value);
                        myOrders.forEach((key, value) {
                          final nextOrder = Map<String, dynamic>.from(value);
                          final orderTile = ListTile(
                                leading: Icon(Icons.local_cafe),
                                title: Text(nextOrder['description']),
                                subtitle: Text(nextOrder['customer']));
                          tilesList.add(orderTile);
                        });
                      }
                      return ListView(
                        children: tilesList,
                        shrinkWrap: true,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

  @override
  void deactivate() {
    _dailySpecialStream.cancel();
    super.deactivate();
  }
}
