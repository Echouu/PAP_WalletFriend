import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Graficos extends StatefulWidget {
  const Graficos({Key? key}) : super(key: key);

  @override
  State<Graficos> createState() => _GraficosState();
}

class _GraficosState extends State<Graficos> {
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
                  'Gráfico',
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
              child: Column(
                children: [],
              ),
            ),
          ],
        ),
      );
    });
  }
}
