import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:wallet_friend/models/userModel.dart';

import '../home/HomeScreen.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      final firstNameField = TextFormField(
          autofocus: false,
          controller: firstNameEditingController,
          keyboardType: TextInputType.name,
          validator: (value) {
            RegExp regex = new RegExp(r'^.{3,}$');
            if (value!.isEmpty) {
              return ("First Name cannot be Empty");
            }
            if (!regex.hasMatch(value)) {
              return ("Enter Valid name(Min. 3 Character)");
            }
            return null;
          },
          onSaved: (value) {
            firstNameEditingController.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: "Primeiro Nome",
            prefixIcon: Icon(Icons.account_circle, color: Colors.black),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ));
      final secondNameField = TextFormField(
          autofocus: false,
          controller: secondNameEditingController,
          keyboardType: TextInputType.name,
          validator: (value) {
            if (value!.isEmpty) {
              return ("Second Name cannot be Empty");
            }
            return null;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: "Segundo Nome",
            prefixIcon: Icon(Icons.account_circle, color: Colors.black),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ));
      final emailField = TextFormField(
          autofocus: false,
          controller: emailEditingController,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value!.isEmpty) {
              return ("Digite o seu email");
            }
            //email validation
            if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                .hasMatch(value)) {
              return ("Digite um email valido");
            }
            return null;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: "Email",
            prefixIcon: Icon(Icons.mail, color: Colors.black),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ));
      final passwordField = TextFormField(
        autofocus: false,
        controller: passwordEditingController,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("É preciso uma palavra-passe para iniciar sessão");
          }
          if (!regex.hasMatch(value)) {
            return ("Digite uma palavra-passe Valida (Min. 6 letras)");
          }
        },
        onSaved: (value) {
          passwordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            hintText: "Palavra-Passe",
            prefixIcon: Icon(Icons.vpn_key, color: Colors.black),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            )),
      );
      final confirmPasswordField = TextFormField(
        autofocus: false,
        controller: confirmPasswordEditingController,
        obscureText: true,
        validator: (value) {
          if (confirmPasswordEditingController.text !=
              passwordEditingController.text) {
            return "Password don't match";
          }
          return null;
        },
        onSaved: (value) {
          confirmPasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            hintText: "Confirmar Palavra-Passe",
            prefixIcon: Icon(Icons.vpn_key, color: Colors.black),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            )),
      );
      final signUpButton = Material(
        child: Center(
          child: Container(
            width: 85.w,
            height: 8.h,
            child: RawMaterialButton(
              fillColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () async {
                signUp(emailEditingController.text,
                    passwordEditingController.text, firstNameEditingController.text, secondNameEditingController.text);




              },
              child: Center(
                child: AutoSizeText("Criar Conta",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      fontSize: 12.sp,
                    )),
              ),
            ),
          ),
        ),
      );
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Stack(
          children: <Widget>[
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "Wallet Friend",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    AutoSizeText(
                      "Criar Conta",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    firstNameField,
                    SizedBox(
                      height: 2.h,
                    ),
                    secondNameField,
                    SizedBox(
                      height: 2.h,
                    ),
                    emailField,
                    SizedBox(
                      height: 2.h,
                    ),
                    passwordField,
                    SizedBox(
                      height: 2.h,
                    ),
                    confirmPasswordField,
                    SizedBox(
                      height: 10.h,
                    ),
                    signUpButton,
                    SizedBox(
                      height: 2.h,
                    ),
                    /*TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(Icons.mail, color:Colors.black),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                )
            ),
          ),
            SizedBox(height: 2.h,
            ),
          TextField(
            obscureText: true,
            decoration:  InputDecoration(
                hintText: "Palavra-Passe",
                prefixIcon: Icon(Icons.vpn_key, color:Colors.black),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                )
            ),
          ),
            SizedBox(height: 2.h,
            ),
          TextField(
            obscureText: true,
            decoration:  InputDecoration(
                hintText: "Confirmar Palavra-Passe",
                prefixIcon: Icon(Icons.vpn_key, color:Colors.black),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                )
            ),
          ),
           */
                  ]),
            ),
          ],
        ),
      );
    });
  }

  Future<void> signUp(String email, String password, String Nome, String Apelido) async {
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password).catchError((e) {Fluttertoast.showToast(msg: e!.message);});
      print("Começou");
      Map<String, dynamic> User = {
        "email": email,
        "first name": Nome,
        "second name": Apelido,
        "saldo": "0",
        "uid": cred.user!.uid
      };
      print(email);
      print(Nome);
      print(Apelido);
      print(cred.user!.uid);
      print(User);

      await FirebaseFirestore.instance.collection("users").doc(cred.user!.uid).set(User).catchError((e) => print(e));
      print("Terminou");

      Fluttertoast.showToast(msg: "Account created successfully :) ");

      Navigator.pushAndRemoveUntil(
          (context),
          MaterialPageRoute(builder: (context) => HomeScreen()),
              (route) => false);
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errorMessage!);
      print(error.code);
    }
  }
}
