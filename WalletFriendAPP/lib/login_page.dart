import 'package:flutter/material.dart';

import 'header.dart';
import 'input_wrapper.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.cyan,
            Colors.cyan,
            Colors.cyan
          ]),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 80,)
            , Header(),
            Expanded(child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  )
              ),
              child: InputWrapper(),
            )),
          ],
        ),
      ),
    );
  }
}

/*
* <div>
  <header>
  * <div>

  </div>
* */


