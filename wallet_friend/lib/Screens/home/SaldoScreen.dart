import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../DespesasReceitas/Main/DespesasScreen.dart';
import '../DespesasReceitas/Main/ReceitasScreen.dart';

class Saldo extends StatefulWidget {
  const Saldo({Key? key}) : super(key: key);

  @override
  State<Saldo> createState() => _SaldoState();
}

class _SaldoState extends State<Saldo> {
  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF6F7372);
    return Sizer(builder: (context, orientation, deviceType) {
      final DespesasButton = Material(
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
                  Container(
                    width: 100.w,
                    height: 3.h,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: AutoSizeText(
                      "Contas de Pagamento",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp,
                        fontFamily: 'Montserrat',
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      AutoSizeText(
                        "Carteira",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.sp,
                          fontFamily: 'Montserrat',
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.account_balance_wallet),
                      SizedBox(
                        width: 1.w,
                      ),
                      AutoSizeText(
                        "0€",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.sp,
                          fontFamily: 'Montserrat',
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
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
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
