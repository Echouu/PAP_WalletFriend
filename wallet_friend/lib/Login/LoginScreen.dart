import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'Register.dart';
import 'ProfileScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
//Login
static Future<User?> loginUsingEmailPassword({required String email, required String password, required BuildContext context}) async{
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  try{
UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
user = userCredential.user;
}on FirebaseAuthException catch(e){
    if(e.code == "user-not-found"){
      print("Usuario não encontrado");
    }
}
return user;
}
//create the textfiled controller
final _formkey = GlobalKey<FormState>();

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
                onPressed: () async {
                  User? user = await loginUsingEmailPassword(email: emailController.text, password: passwordController.text, context: context);
                  print(user);
                  if(user != null){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> ProfileScreen()));
                  }
                },
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
            Container(
              width: double.infinity,
              child: RawMaterialButton(
                fillColor:Colors.white,
                elevation: 7,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: ()  {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Register()));
                },
                child: const Text("Registar",
                    style:TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      fontSize: 18.0,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
