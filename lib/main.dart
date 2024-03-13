import 'package:base_n_calculator/classes/base_n_display.dart';
import 'package:base_n_calculator/classes/calc_pad.dart';
import 'package:base_n_calculator/classes/ios_style_text.dart';
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

  String display = '0';
  double displaySize = 60;

  @override
  void initState(){
    displayStream.stream.listen((data){
      if(data == '0'){
        setState(() {
          displaySize = 60;
        });
      }
      setState(() {
        display = data;
      });
      if(display.length > 8 && displaySize != 40){
        setState(() {
          displaySize -= 2.5;
        });
      }
    });
    displaySizeStream.stream.listen((data) {
      //works but right now will only add initially then resumes after length reaches 8
      if(displaySize != 60){
        setState(() {
          displaySize += 2.5;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: IOStext(text: display, size: displaySize, weight: FontWeight.w300),
            )),
          ),
          const BaseNDisplay(),
          const SizedBox(height: 20),
          const CalcPad(),
        ],
      ),
    );
  }
}
