import 'package:base_n_calculator/classes/calc_pad.dart';
import 'package:base_n_calculator/functions.dart';
import 'package:base_n_calculator/variables.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Base-n Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'San Francisco',
        useMaterial3: true,
      ),
      home: const Calc(),
    );
  }
}

class Calc extends StatefulWidget {
  const Calc({super.key});

  @override
  State<Calc> createState() => _CalcState();
}

class _CalcState extends State<Calc> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Text(displayValue, style: TextStyle(color: Colors.white),),
          CalcPad(),
        ],
      ),
    );
  }
}
