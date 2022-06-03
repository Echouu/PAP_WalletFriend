import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wallet_friend/Screens/home/Graficos.dart';
import 'package:wallet_friend/Screens/home/HistoricoScreen.dart';
import 'package:wallet_friend/Screens/home/ProfileScreen.dart';
import 'package:wallet_friend/Screens/home/SaldoScreen.dart';
import 'ProfileScreen.dart';


class Homee extends StatefulWidget {
  const Homee({Key? key}) : super(key: key);

  @override
  State<Homee> createState() => _HomeeState();
}

class _HomeeState extends State<Homee> {
  int index = 0;
  final  screens = [
    Historico(),
    Saldo(),
    Graficos(),
    ProfileScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Historico();

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return const Scaffold(
            /*
          body: PageStorage(
            child: currentScreen,
            bucket: bucket,
          ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
                onPressed: () {}
            ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 10,
            child: Container(
              height: 60,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget> [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MaterialButton(
                          minWidth:40,
                          onPressed: () {
                            setState((){
                              currentScreen = Dashboard();
                              currentTab=0;
                            },);
                          },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon.dashboard,


                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          */
          );
        }
    );
  }
}
