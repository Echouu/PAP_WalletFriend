import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../home/HomeScreen.dart';

class OutroDScreen extends StatefulWidget {
  const OutroDScreen({Key? key}) : super(key: key);

  @override
  State<OutroDScreen> createState() => _OutroDScreenState();
}

class _OutroDScreenState extends State<OutroDScreen> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          final ConfirmButton = Material(
            child: Center(
              child: Container(
                width: 85.w,
                height: 8.h,
                child: RawMaterialButton(
                  fillColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () async {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
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
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(
                        width: 34.w,
                      ),
                      Center(
                        child: AutoSizeText(
                          'Outro',
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
            ),body: Stack(
            children: [
              Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 1.h,
                    ),
                    Center(
                      child: Container(
                        width: 95.w,
                        height: 3.h,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 2,
                            ),
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.account_balance_wallet,
                              size: 25.0,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            AutoSizeText(
                              "Carteira",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                fontFamily: 'Montserrat',
                                decoration: TextDecoration.none,
                              ),
                            ),
                            SizedBox(
                              width: 70.w,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Center(
                      child: Container(
                        width: 95.w,
                        height: 3.h,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 2,
                            ),
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.attach_money,
                              size: 25.0,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            AutoSizeText(
                              "Outro",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                fontFamily: 'Montserrat',
                                decoration: TextDecoration.none,
                              ),
                            ),
                            SizedBox(
                              width: 35.w,
                            ),
                            Container(
                              width: 40.w,
                              height: 5.h,
                              decoration: const BoxDecoration(),
                              child: TextFormField(
                                  validator: (value) {},
                                  decoration: InputDecoration(
                                    hintText: "0.00€",
                                  )),
                            ),
                            /* AutoSizeText(
                            "0€",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp,
                              fontFamily: 'Montserrat',
                              decoration: TextDecoration.none,
                            ),
                          ),
                          */
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    SizedBox(
                      height: 65.h,
                    ),
                    ConfirmButton
                  ],
                ),
              ),
            ],
          ),
          );
        });
  }
}
