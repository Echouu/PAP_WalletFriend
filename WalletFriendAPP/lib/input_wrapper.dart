import 'package:flutter/material.dart';

import 'button.dart';
import 'input_field.dart';

class InputWrapper extends StatelessWidget {
  const InputWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column (
    children: <Widget>[
    const SizedBox(height: 40,),
    Container(
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10)
    ),
    child: InputField(),
    ),
    const SizedBox(height: 40,),
    const Text(
    "Esqueci-me da Password?",
    style: TextStyle(color: Colors.grey),
    ),
    const SizedBox(height: 40,),
    Button()
    ],
    ),
    );
  }
}


