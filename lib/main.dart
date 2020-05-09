import 'package:flutter/material.dart';
import 'package:viacep/screens/cep_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: CepScreen(),
      debugShowCheckedModeBanner: false,
    );
  }

}