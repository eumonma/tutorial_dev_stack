import 'package:flutter/material.dart';

class ReadExamples extends StatefulWidget {
  const ReadExamples({Key? key}) : super(key: key);

  @override
  _ReadExamplesState createState() => _ReadExamplesState();
}

class _ReadExamplesState extends State<ReadExamples> {
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

              ],
            ),
          ),
        )
    );

  }
}
