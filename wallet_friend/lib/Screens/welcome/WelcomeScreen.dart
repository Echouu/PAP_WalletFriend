import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wallet_friend/Screens/authenticate/LoginScreen.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
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
                Navigator.of(context).pushReplacement(

                    MaterialPageRoute(builder: (context) => LoginScreen()));

              },
              child: Center(
                child: AutoSizeText("Continuar",
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
        body: Stack(
          children: <Widget>[
            Center(
              child: Column(
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    AnimatedTextKit(
                      totalRepeatCount: 1,
                      animatedTexts: [
                        TyperAnimatedText(
                          'Bem vindo ao',
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 35.sp,
                              fontWeight: FontWeight.bold),
                          speed: Duration(milliseconds: 200),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    AnimatedTextKit(totalRepeatCount: 1, animatedTexts: [
                      TyperAnimatedText(
                        'Wallet Friend',
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 35.sp,
                            fontWeight: FontWeight.bold),
                        speed: Duration(milliseconds: 300),
                      ),
                    ]),
                    Center(
                      child: Image(
                        width: 60.w,
                        height: 50.h,
                        image: NetworkImage(
                            'https://media.discordapp.net/attachments/444541551360606220/980901071780184064/unknown.png'),
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    signUpButton
                  ]),
            ),
          ],
        ),
      );
    });
  }
}
