import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}
class _RegisterState extends State<Register> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Padding(
        padding: const EdgeInsets.all(16.0),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Wallet Friend",
            style: TextStyle(
                color: Colors.black,
                fontSize: 28.0,
                fontWeight: FontWeight.bold
            ),
          ),
          const Text(
            "Inicie Sessão",
            style: TextStyle(
                color: Colors.black,
                fontSize: 44.0,
                fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(
            height:44.0,
          ),
          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(Icons.mail, color:Colors.black),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                )
            ),
          ),
          const SizedBox(height: 26.0,
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
                hintText: "Palavra-Passe",
                prefixIcon: Icon(Icons.vpn_key, color:Colors.black),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                )
            ),
          ),
          const SizedBox(height: 12.0,
          ),
          const Text(
            "Esqueceu-se da palavra-passe?",
            style: TextStyle(
              color: Color(0xFF6F7372),
            ),
          ),
          const SizedBox(height: 88.0,
          ),
          Container(
            width: double.infinity,
            child: RawMaterialButton(
              fillColor:Colors.black,
              elevation: 7,
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: ()  {},
              child: const Text("Iniciar Sessão",
                  style:TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    fontSize: 18.0,
                  )),
            ),
          ),
          const SizedBox(height: 25.0,
          ),
        ],
      ),
    ),
    );
  }
}
