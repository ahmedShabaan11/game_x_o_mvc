import 'package:flutter/material.dart';
import 'package:game_x_o/model/player_model.dart';
import 'package:game_x_o/screen/home-screen.dart';

class NamedScreen extends StatefulWidget {
  NamedScreen({super.key});

  static String namedScreen = "NamedScreen";
  TextEditingController controllerOne = TextEditingController();
  TextEditingController controllerOneType = TextEditingController();
  TextEditingController controllerTwo = TextEditingController();
  TextEditingController controllerTwoType = TextEditingController();

  @override
  State<NamedScreen> createState() => _NamedScreenState();
}

final _fromKey = GlobalKey<FormState>();

class _NamedScreenState extends State<NamedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
        key: _fromKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    label: Text("Enter Name's Player1"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                controller: widget.controllerOne,
                validator: (name) => name!.length < 3
                    ? "Name Should be at least 3 characters"
                    : null,
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (X) => X != "X" ? "Please Enter X" : null,
                decoration: InputDecoration(
                    label: Text("Enter X "),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                controller: widget.controllerOneType,
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (name) => name!.length < 3
                    ? "Name Should be at least 3 characters"
                    : null,
                decoration: InputDecoration(
                    label: Text(
                      "Enter Name's Player2",
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                controller: widget.controllerTwo,
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (O) => O != "O" ? "Please Enter O" : null,
                decoration: InputDecoration(
                    label: Text("Enter O"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                controller: widget.controllerTwoType,
              ),
              SizedBox(
                height: 15,
                width: 5,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_fromKey.currentState!.validate()) {
                    Navigator.pushNamed(context, HomeScreen.homeScreen,
                        arguments: PlayerModel(
                            widget.controllerOne.text,
                            widget.controllerTwo.text,
                            widget.controllerTwoType.text,
                            widget.controllerOneType.text));
                  }
                },
                child: Text("Register"),
              )
            ],
          ),
        ),
      )),
    );
  }
}
