import 'package:flutter/material.dart';
import 'package:send_temps/ui/screens/loading_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Send Temps',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoadingScreen(),
    );
  }
}

