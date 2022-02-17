import 'package:flutter/material.dart';
import 'package:heaven/Pages/home.dart';
import 'package:heaven/Utils/constants.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static const String routeName = "/home";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Image.asset("assets/horsies.jpg",
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.7),
            colorBlendMode: BlendMode.darken),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                            controller: _usernameController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (string) {
                              return "";
                            },
                            decoration: const InputDecoration(
                                hintText: "Enter email",
                                labelText: "Username")),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _passwordController,
                          keyboardType: TextInputType.text,
                          validator: (string) {
                            return "";
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                              hintText: "Enter password",
                              labelText: "Password"),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                            onPressed: () {
                              formKey.currentState!.validate();
                              Constants.prefs!.setBool("loggedIn", true);
                              //   Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) => const Home()));
                              Navigator.pushReplacementNamed(
                                  context, Home.routeName);
                            },
                            child: const Text("Sign In"),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.amber),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.purple),
                            )),
                      ]),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
