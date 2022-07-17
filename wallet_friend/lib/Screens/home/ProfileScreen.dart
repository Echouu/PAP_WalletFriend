import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wallet_friend/Screens/authenticate/EsquecerPass.dart';

import '../authenticate/LoginScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF6F7372);

    return Sizer(builder: (context, orientation, deviceType) {

      /*final firstNameField = TextFormField(
          autofocus: false,
          controller: firstNameChangeController,
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
            firstNameChangeController.text = value!;
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
          controller: secondNameChangeController,
          keyboardType: TextInputType.name,
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
          controller: emailChangeController,
          keyboardType: TextInputType.emailAddress,
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
        controller: emailChangeController,
        obscureText: true,
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
        controller: confirmPasswordChangeController,
        obscureText: true,
        validator: (value) {
          if (confirmPasswordChangeController.text !=
              confirmPasswordChangeController.text) {
            return "Password don't match";
          }
          return null;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            hintText: ("Confirmar Palavra-Passe"),
            prefixIcon: Icon(Icons.vpn_key, color: Colors.black),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            )),
      );

      final confirmButton = Material(
        child: Center(
          child: Container(
            width: 85.w,
            height: 8.h,
            child: RawMaterialButton(
              fillColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () async {},
              child: Center(
                child: AutoSizeText("Salvar",
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
       */
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Perfil',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            Container(
              width: 100.w,
              height: 10.h,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 2,
                  ),
                ),
              ),
              child: Center(
                child: AutoSizeText(
                  'Perfil',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
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
                  "Mudar Password",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold),
                ),

                SizedBox(
                  height: 5.h,
                ),

                TextFormField(
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
                    )),
                SizedBox(
                  height: 11.h,
                ),
                Material(
                  child: Center(
                    child: Container(
                      width: 85.w,
                      height: 8.h,
                      child: RawMaterialButton(
                        fillColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () async {
                          try{
                            if(emailController.text != ""){
                              try{
                                String email = emailController.text;
                                await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
                                //"Email enviado com sucesso!"
                              }catch(e){
                                //"Ocorreu um erro ao enviar o email."
                              }
                            }
                          }catch(e){

                          }
                        },
                        child: Center(
                          child: AutoSizeText("Confirmar",
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
                ),
                SizedBox(
                  height: 5.h,
                ),
                Center(
                  child: ActionChip(
                      label: Text("Terminar sessão"),
                      onPressed: () {
                        logout(context);
                      }),
                ),
              ],
            ),
          ),
        ]),
      );
    });
  }
}

// the logout function
Future<void> logout(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
}
