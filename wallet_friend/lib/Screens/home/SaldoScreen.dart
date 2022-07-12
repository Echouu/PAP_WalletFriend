import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../DespesasReceitas/DespesasScreen.dart';
import '../DespesasReceitas/ReceitasScreen.dart';

class Saldo extends StatefulWidget {
  const Saldo({Key? key}) : super(key: key);

  @override
  State<Saldo> createState() => _SaldoState();
}

class _SaldoState extends State<Saldo> {
  var snapUser = {};

  void getUserInfo() async {
    var getSnapUser = await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get();
    snapUser = getSnapUser.data()!;
  }

  @override
  void initState() {
    super.initState();
    getUserInfo();
    Future.delayed(Duration(seconds: 1)).then((value) => setState(() async {
      setState(() {
      });
    }));

  }
  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF6F7372);
    return Sizer(builder: (context, orientation, deviceType) {
      final DespesasButton = Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            width: 30.w,
            height: 8.h,
            child: RawMaterialButton(
              fillColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DespesasScreen()));
              },
              child: Center(
                child: AutoSizeText("Despesas",
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

      final ReceitasButton = Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            width: 30.w,
            height: 8.h,
            child: RawMaterialButton(
              fillColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ReceitasScreen()));
              },
              child: Center(
                child: AutoSizeText("Receitas",
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
                  'Saldo',
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
        body: Stack(
          children: [
            Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 4.h,
                  ),
                  Center(
                    child: Container(
                      width: 95.w,
                      height: 15.h,
                      decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: const BorderRadius.all(Radius.circular(25)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            )
                          ]//BoxShadow
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            SizedBox(width: 2.w,),
                            Icon(
                              Icons.account_balance_wallet,
                              size: 35.sp,
                            ),
                            SizedBox(width: 2.w,),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(width: 0.4.h, color: Colors.black),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    AutoSizeText(
                                      "Saldo:",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp,
                                        fontFamily: 'Montserrat',
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    Spacer(),
                                    RichText(
                                        text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: snapUser["saldo"].toString(),
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.sp,
                                                  fontFamily: 'Montserrat',
                                                  decoration: TextDecoration.none,
                                                ),
                                              ),
                                              TextSpan(
                                                text:  "€",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.sp,
                                                  fontFamily: 'Montserrat',
                                                  decoration: TextDecoration.none,
                                                ),
                                              ),
                                            ]
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 3.w,),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Center(
                    child: Row(children: <Widget>[
                      Spacer(),
                      DespesasButton,
                      Spacer(),
                      SizedBox(
                        height: 10.h,
                      ),
                      ReceitasButton,
                      Spacer(),
                    ]),
                  ),
                  SizedBox(height: 5.h,),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
