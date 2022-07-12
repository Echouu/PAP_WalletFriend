import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TutorialZezocaScreen extends StatefulWidget {
  const TutorialZezocaScreen({Key? key}) : super(key: key);

  @override
  State<TutorialZezocaScreen> createState() => _TutorialZezocaScreenState();
}

class _TutorialZezocaScreenState extends State<TutorialZezocaScreen> {
  bool wasButtonPressed = false;
  String batatas = "batatas";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    batatas = "cenouras";
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: Colors.green,
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Center(
                  child: Container(
                    width: 80.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.redAccent,
                    ),
                    child: Center(
                      child: Text(
                        batatas,
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 80.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.pink,
                  ),
                  child: Center(
                    child: AutoSizeText(
                      'Tutorial Bué Sonolento v2 zzzZZ ZzzzZZZ  ZzzzZZZZZZ zzzZZz  ZzzzZzZZZ  ZZzzZZZZ   Zzzzzz',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  width: 98.w,
                  height: 30.h,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Spacer(),
                      Row(
                        children: [
                          Spacer(),
                          SizedBox.square(
                            dimension: 50.sp,
                            child: Container(
                              width: 20.w,
                              height: 20.w,
                              color: Colors.orangeAccent,
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: 20.w,
                            height: 15.h,
                            color: Colors.green,
                            child: FittedBox(
                              child: Container(
                                width: 20.w,
                                height: 20.w,
                                color: Colors.purpleAccent,
                              ),
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            width: 20.w,
                            height: 15.h,
                            child: FittedBox(
                              child: Container(
                                width: 20.w,
                                height: 20.w,
                                color: Colors.yellow,
                              ),
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            width: 20.w,
                            height: 15.h,
                            child: FittedBox(
                              child: Container(
                                width: 20.w,
                                height: 20.w,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                wasButtonPressed = !wasButtonPressed;
                                batatas = "batatas não cenoura buro";
                                //Navigator.pushReplacement(context,
                                //  MaterialPageRoute(builder: (context) => HomePage())
                                //);
                              });

                              print(wasButtonPressed);
                            },
                            child: Container(
                              width: 20.w,
                              height: 20.w,
                              color: Colors.orangeAccent,
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: 20.w,
                            height: 20.w,
                            color: Colors.yellow,
                          ),
                          Spacer(),
                          Container(
                            width: 20.w,
                            height: 20.w,
                            color: Colors.purpleAccent,
                          ),
                          Spacer(),
                          Container(
                            width: 20.w,
                            height: 20.w,
                            color: wasButtonPressed
                                ? Colors.blueAccent
                                : Colors.green,
                          ),
                          Spacer(),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: const AlignmentDirectional(0, -0.55),
              child: Container(
                width: 10.h,
                height: 10.h,
                color: Colors.blueGrey,
              ),
            )
          ],
        ),
      );
    });
  }
}
