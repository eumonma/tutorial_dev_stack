import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    title: 'Kill Team',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: LoginPage(),
    debugShowCheckedModeBanner: false,
  ));
}

