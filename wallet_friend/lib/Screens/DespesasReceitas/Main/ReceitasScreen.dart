import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wallet_friend/Screens/DespesasReceitas/Receitas/DividasScreen.dart';
import 'package:wallet_friend/Screens/DespesasReceitas/Receitas/OutroRScreen.dart';
import 'package:wallet_friend/Screens/DespesasReceitas/Receitas/Premio.dart';
import 'package:wallet_friend/Screens/DespesasReceitas/Receitas/PresenteScreen.dart';
import 'package:wallet_friend/Screens/DespesasReceitas/Receitas/RendaScreen.dart';
import 'package:wallet_friend/Screens/DespesasReceitas/Receitas/SalarioScreen.dart';

class ReceitasScreen extends StatefulWidget {
  const ReceitasScreen({Key? key}) : super(key: key);

  @override
  State<ReceitasScreen> createState() => _ReceitasScreenState();
}

class _ReceitasScreenState extends State<ReceitasScreen> {
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
                      'Receitas',
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
                        icon: Icon(Icons.account_circle, color: Colors.black),
                        iconSize: 40,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => SalarioScreen()));
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
                        icon: Icon(Icons.card_giftcard, color: Colors.black),
                        iconSize: 40,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => PresenteScreen()));
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
                        icon: Icon(Icons.workspace_premium, color: Colors.black),
                        iconSize: 40,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => PremioScreen()));
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
                      'Salário',
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
                      'Presente',
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
                      'Premio',
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
                        icon: Icon(Icons.watch_later, color: Colors.black),
                        iconSize: 40,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => DividasScreen()));
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
                        icon: Icon(Icons.home_repair_service ,color: Colors.black),
                        iconSize: 40,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => RendaScreen()));
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
                        icon: Icon(Icons.attach_money, color: Colors.black),
                        iconSize: 40,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => OutroRScreen()));
                        },
                      ),
                    ),
                    SizedBox(
                      width: 13.75.w,
                    ),
                  ]),

                  Row(children: <Widget>[
                    SizedBox(
                      width: 7.w,
                    ),
                    AutoSizeText(
                      'Receita de Dividas',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    AutoSizeText(
                      'Renda Comercial',
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
