

import 'package:flutter/material.dart';
import 'package:tutorial_dev_stack/register_page.dart';
import 'firebaseHelper.dart';

class LoginPage extends StatelessWidget {
  //const LoginPage({Key? key}) : super(key: key);
  // This widget is the root of your application.

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Service service = Service();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login Page',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Enter Your Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 80),
                  ),
                  onPressed: (){
                    // Llamamos al ServiceHelper que hemos creado de Firebase
                    if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
                      service.loginUser(context, emailController.text, passwordController.text);
                    }else{
                      service.errorBox(context, 'Hay campos en blanco. Todos los campos son obligatorios');
                    }

                  },
                  child: Text("Login")),
              TextButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Text("No tengo cuenta"))
            ],
          ),
        ),
      ),
    );
  }
}
