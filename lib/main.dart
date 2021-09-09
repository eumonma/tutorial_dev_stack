import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
       ),
       home: Scaffold(
         body: SafeArea(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text('Login Page',
               style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
             ],
           ),
         ),
      ),
    );
  }
}
