import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wallet_friend/Screens/DespesasReceitas/Despesas/CasaScreen.dart';
import 'package:wallet_friend/Screens/DespesasReceitas/Despesas/ComprasScreen.dart';
import 'package:wallet_friend/Screens/DespesasReceitas/Despesas/DebitoScreen.dart';
import 'package:wallet_friend/Screens/DespesasReceitas/Despesas/EntertenimentoScreen.dart';
import 'package:wallet_friend/Screens/DespesasReceitas/Despesas/ImpostosScreen.dart';
import 'package:wallet_friend/Screens/DespesasReceitas/Despesas/JantarForaScreen.dart';
import 'package:wallet_friend/Screens/DespesasReceitas/Despesas/OutroScreen.dart';
import 'package:wallet_friend/Screens/DespesasReceitas/Despesas/PessoalScreen.dart';
import 'package:wallet_friend/Screens/DespesasReceitas/Despesas/UtilidadeScreen.dart';

import '../Despesas/CarroScreen.dart';

class DespesasScreen extends StatefulWidget {
  const DespesasScreen({Key? key}) : super(key: key);

  @override
  State<DespesasScreen> createState() => _DespesasScreenState();
}

class _DespesasScreenState extends State<DespesasScreen> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      final SaveButton = Material(
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
                    width: 30.w,
                  ),
                  Center(
                    child: AutoSizeText(
                      'Despesas',
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
            Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(children: <Widget>[
                    SizedBox(
                      width: 13.75.w,
                    ),
                    Container(
                      width: 15.w,
                      height: 15.h,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.directions_car, color: Colors.black),
                        iconSize: 40,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => CarroScreen()));
                        },
                      ),
                    ),
                    SizedBox(
                      width: 13.75.w,
                    ),
                    Container(
                      width: 15.w,
                      height: 15.h,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.account_circle, color: Colors.black),
                        iconSize: 40,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => PessoalScreen()));
                        },
                      ),
                    ),
                    SizedBox(
                      width: 13.75.w,
                    ),
                    Container(
                      width: 15.w,
                      height: 15.h,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.dining, color: Colors.black),
                        iconSize: 40,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => JantarForaScreen()));
                        },
                      ),
                    ),
                    SizedBox(
                      width: 13.75.w,
                    ),
                  ]),





              Row(children: <Widget>[
                SizedBox(
                  width: 17.w,
                ),
                  AutoSizeText(
                    'Carro',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                SizedBox(
                  width: 19.w,
                ),
                AutoSizeText(
                  'Pessoal',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 14.w,
                ),
                AutoSizeText(
                  'Jantar Fora',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ]),


                  Row(children: <Widget>[
                    SizedBox(
                      width: 13.75.w,
                    ),
                    Container(
                      width: 15.w,
                      height: 15.h,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.home, color: Colors.black),
                        iconSize: 40,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => CasaScreen()));
                        },
                      ),
                    ),
                    SizedBox(
                      width: 13.75.w,
                    ),
                    Container(
                      width: 15.w,
                      height: 15.h,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.local_grocery_store, color: Colors.black),
                        iconSize: 40,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ComprasScreen()));
                        },
                      ),
                    ),
                    SizedBox(
                      width: 13.75.w,
                    ),
                    Container(
                      width: 15.w,
                      height: 15.h,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.videogame_asset_sharp, color: Colors.black),
                        iconSize: 40,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => EntertenimentoScreen()));
                        },
                      ),
                    ),
                    SizedBox(
                      width: 13.75.w,
                    ),
                  ]),

                  Row(children: <Widget>[
                    SizedBox(
                      width: 17.w,
                    ),
                    AutoSizeText(
                      'Casa',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 17.w,
                    ),
                    AutoSizeText(
                      'Compras',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 11.w,
                    ),
                    AutoSizeText(
                      'Entretenimento',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),






                  Row(children: <Widget>[
                    SizedBox(
                      width: 13.75.w,
                    ),
                    Container(
                      width: 15.w,
                      height: 15.h,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.account_balance, color: Colors.black),
                        iconSize: 40,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => DebitoScreen()));
                        },
                      ),
                    ),
                    SizedBox(
                      width: 13.75.w,
                    ),
                    Container(
                      width: 15.w,
                      height: 15.h,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.home_filled, color: Colors.black),
                        iconSize: 40,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => UtilidadeScreen()));
                        },
                      ),
                    ),
                    SizedBox(
                      width: 13.75.w,
                    ),
                    Container(
                      width: 15.w,
                      height: 15.h,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.monetization_on_rounded, color: Colors.black),
                        iconSize: 40,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ImpostosScreen()));
                        },
                      ),
                    ),
                    SizedBox(
                      width: 13.75.w,
                    ),
                  ]),
                  Row(children: <Widget>[
                    SizedBox(
                      width: 16.w,
                    ),
                    AutoSizeText(
                      'Débito',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 9.w,
                    ),
                    AutoSizeText(
                      'Serviços de utilidade',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    AutoSizeText(
                      'Impostos',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),

                  Row(children: <Widget>[
                    SizedBox(
                      width: 13.75.w,
                    ),
                    Container(
                      width: 15.w,
                      height: 15.h,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.attach_money, color: Colors.black),
                        iconSize: 40,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => OutroDScreen()));
                        },
                      ),
                    ),
                    SizedBox(
                      width: 13.75.w,
                    ),
                  ]),

                  Row(children: <Widget>[
                    SizedBox(
                      width: 17.w,
                    ),
                    AutoSizeText(
                      'Outro',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),

                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
