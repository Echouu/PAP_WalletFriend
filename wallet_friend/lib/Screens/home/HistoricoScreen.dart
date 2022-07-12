import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Historico extends StatefulWidget {
  const Historico({Key? key}) : super(key: key);

  @override
  State<Historico> createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {
  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF6F7372);
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
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 2,
                  ),
                ),
              ),
              child: Center(
                child: AutoSizeText(
                  'Historico',
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
          children: <Widget>[
            Center(
              child: FutureBuilder(
              future: FirebaseFirestore.instance.collection('changes').where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid).orderBy("data", descending: true).get(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: (snapshot.data! as dynamic).docs.length,
                  itemBuilder: (context, index) =>
                    Padding(
                      padding: EdgeInsets.only(top: 2.h),
                      child: Center(
                      child: Container(
                        width: 95.w,
                        height: 15.h,
                        decoration: BoxDecoration(
                            color: Colors.grey[350],
                            borderRadius: const BorderRadius.all(Radius.circular(25)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: Offset(0, 3),
                              )
                            ]//BoxShadow
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Row(
                                children: [
                                  SizedBox(width: 2.w,),
                                  Icon(
                                  (snapshot.data! as dynamic).docs[index]["despesas"] == false ?
                                    Icons.attach_money : Icons.money_off,
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
                                            (snapshot.data! as dynamic).docs[index]["nome"],
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
                                                    (snapshot.data! as dynamic).docs[index]["despesas"] == false ?
                                                    TextSpan(
                                                      text: "+",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 18.sp,
                                                        fontFamily: 'Montserrat',
                                                        decoration: TextDecoration.none,
                                                      ),
                                                    ) :
                                                    TextSpan(
                                                      text: "-",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 18.sp,
                                                        fontFamily: 'Montserrat',
                                                        decoration: TextDecoration.none,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: (snapshot.data! as dynamic).docs[index]["quantidade"].toString(),
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
                            Align(
                              alignment: AlignmentDirectional(0.9,0.9),
                              child: AutoSizeText(
                                ((snapshot.data! as dynamic).docs[index]["data"] as Timestamp).toDate().toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11.sp,
                                  fontFamily: 'Montserrat',
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ),
                    ),
                );
                }),
            ),
          ],
        ),
      );
    });
  }
}
