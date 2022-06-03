import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Screens/welcome/WelcomeScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
// Replace with actual values
    options: FirebaseOptions(
      apiKey: "AIzaSyC8qibIPlZCmAYxWmVZeY0pUQOLGctirqA",
      appId: "1:528875715417:android:33b544e755c87aa5b6ea48",
      messagingSenderId: "528875715417",
      projectId: "528875715417",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome(),
    );
  }
}
