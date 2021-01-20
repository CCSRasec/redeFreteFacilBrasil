import 'package:doglife/pages/home.page.dart';
import 'package:doglife/pages/login.page.dart';
import 'package:doglife/pages/reset-password.page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rede FreteFácil',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: LoginPage(),
      home: HomePage(),
    );
  }
}
