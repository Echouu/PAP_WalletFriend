import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:wallet_friend/Screens/home/HomeScreen.dart';

class PagSaldoScreen extends StatefulWidget {
  final String Nome;
  final IconData Icon;
  final bool despesas;

  const PagSaldoScreen({Key? key, required this.Nome, required this.Icon, required this.despesas}) : super(key: key);

  @override
  State<PagSaldoScreen> createState() => _PagSaldoScreenState();
}

class _PagSaldoScreenState extends State<PagSaldoScreen> {
  var snapUser = {};
  final numberEditingController = new TextEditingController();

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
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          actions: [
            Container(
              width: 100.w,
              height: 10.h,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(
                    width: 35.w,
                  ),
                  Center(
                    child: AutoSizeText(
                      widget.Nome,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Column(
              children: <Widget>[
                Container(
                  width: 100.w,
                  height: 0.4.h,
                  color: Colors.black,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.grey[350],
                    width: 100.w,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        Center(
                          child: Container(
                            width: 95.w,
                            height: 15.h,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(25))
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
                        SizedBox(height: 5.h,),
                        Center(
                          child: Container(
                            width: 95.w,
                            height: 15.h,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(25))
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  SizedBox(width: 2.w,),
                                  Icon(
                                    widget.Icon,
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
                                            widget.Nome + ":",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.sp,
                                              fontFamily: 'Montserrat',
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                              width: 100.w,
                                              child: TextField(
                                                  controller: numberEditingController,
                                                  textAlign: TextAlign.right,
                                                  keyboardType: TextInputType.number,
                                                  textAlignVertical: TextAlignVertical.center,
                                                  cursorColor: Colors.black,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18.sp,
                                                  ),
                                                  decoration: const InputDecoration(
                                                    isDense: true,
                                                    hintText: "0.00€",
                                                    enabledBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                    ),
                                                    focusedBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                    ),
                                                  ),
                                              ),
                                            ),
                                          ),
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
                        Material(
                          color: Colors.transparent,
                          child: Center(
                            child: Container(
                              width: 85.w,
                              height: 8.h,
                              child: RawMaterialButton(
                                fillColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                onPressed: () async {
                                  bool errorDetector = false;
                                  double num1 = snapUser["saldo"] + .0;
                                  double? num2 = double.tryParse(numberEditingController.text);
                                  print(num2);
                                  try{
                                    if(num2 == null){
                                      int num3 = int.parse(numberEditingController.text);
                                      num2 = num3 + .0;
                                    }
                                  }
                                  catch(e){
                                    print(e);
                                    errorDetector = true;
                                    Fluttertoast.showToast(msg: "Something is wrong with the number!!!");
                                  }

                                  if(!errorDetector){
                                    try{
                                      double resultado;
                                      if(widget.despesas){
                                        resultado = num1 - num2!;
                                      }else{
                                        resultado = num1 + num2!;
                                      }
                                      await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).update(
                                          {
                                            "saldo": resultado,
                                          }
                                      );
                                      await FirebaseFirestore.instance.collection('changes').doc(FirebaseAuth.instance.currentUser!.uid + " " + DateTime.now().toString()).set(
                                          {
                                            "data": DateTime.now(),
                                            "despesas": widget.despesas,
                                            "nome": widget.Nome,
                                            "quantidade": num2,
                                            "uid": FirebaseAuth.instance.currentUser!.uid
                                          }
                                      );
                                    }catch(e){
                                      print(e);
                                    }
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                                    Fluttertoast.showToast(msg: "Your balance has been updated!!!");
                                    setState(() {

                                    });
                                  }

                                },
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
                        ),
                        SizedBox(height: 4.h,),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    });
  }
}
