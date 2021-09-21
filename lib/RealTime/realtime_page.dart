import 'package:flutter/material.dart';
import 'package:tutorial_dev_stack/RealTime/views/read_examples.dart';
import 'package:tutorial_dev_stack/RealTime/views/write_examples.dart';

class RealTimePage extends StatelessWidget {
  const RealTimePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Real time"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Prueba los ejamplos"),
            SizedBox(
                height: 6,
                width: MediaQuery.of(context).size.width
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReadExamples(),
                      ));
                },
                child: Text("Leer Ejemplos"),
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WriteExamples(),
                      ));
                },
                child: Text("Escribir Ejemplos"),
            ),
          ],
        ),
      ),
    );
  }
}
