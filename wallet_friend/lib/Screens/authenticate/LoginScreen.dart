import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:wallet_friend/Screens/authenticate/Register.dart';
import 'package:wallet_friend/Screens/home/HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {

      final emailField = TextFormField(
          autofocus: false,
          controller: emailController,
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
        controller: passwordController,
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
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: "Palavra-Passe",
          prefixIcon: Icon(Icons.vpn_key, color: Colors.black),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      );

      final loginButton = Material(
        child: Center(
          child: Container(
            width: 85.w,
            height: 8.h,
            child: RawMaterialButton(
              fillColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () async {
                print(emailController.text + passwordController.text);
                await signIn(emailController.text, passwordController.text);
              },
              child: Center(
                child: AutoSizeText("Iniciar Sessão",
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
        body: Stack(children: <Widget>[
          Center(
            child: Column(
              key: _formKey,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                AutoSizeText(
                  "Wallet Friend",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold),
                ),
                AutoSizeText(
                  "Inicie Sessão",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5.h,
                ),
                emailField,
                SizedBox(
                  height: 2.h,
                ),
                passwordField,

/*
               TextField(
                 autofocus: false,
                 controller: emailController,
                 keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.mail, color: Colors.black),
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
                    prefixIcon: Icon(Icons.vpn_key, color: Colors.black),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    )
                ),
              ),
*/
                SizedBox(
                  height: 1.h,
                ),
                AutoSizeText(
                  "Esqueceu-se da palavra-passe?",
                  style: TextStyle(
                    fontSize: 5.sp,
                    color: Color(0xFF6F7372),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                loginButton,
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: Container(
                    width: 85.w,
                    height: 8.h,
                    child: RawMaterialButton(
                      fillColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                      child: Center(
                        child: AutoSizeText("Registar",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              fontSize: 12.sp,
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      );
    });
  }

//login function
  Future<void> signIn(String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Register())),
              });
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
