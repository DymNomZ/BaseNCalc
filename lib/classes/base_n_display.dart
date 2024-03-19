import 'package:base_n_calculator/classes/colors.dart';
import 'package:base_n_calculator/classes/ios_style_text.dart';
import 'package:base_n_calculator/functions.dart';
import 'package:base_n_calculator/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BaseNDisplay extends StatefulWidget {
  const BaseNDisplay({super.key});

  @override
  State<BaseNDisplay> createState() => _BaseNDisplayState();
}

class _BaseNDisplayState extends State<BaseNDisplay> {

  int currentMode = 2;

  @override
  void initState(){
    binaryStream.stream.listen((event) {
      setState(() {
        
      });
    });
    displayStream.stream.listen((event) {
      convertDisplay();
      setState(() {
        
      });
    });
    baseNCardStream.stream.listen((data) {
      setState(() {
        currentMode = data;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            baseMode(1);
          },
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15),
                height: 30,
                width: 5,
                color: (currentMode == 1) ? IOSColors.secondary : Colors.black,
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                height: 30,
                width: 50,
                color: Colors.black,
                child: const IOStext(text: 'HEX', size: 20, pad: 3),
              ),
              IOStext(text: displayHex, size: 20, pad: 3, weight: FontWeight.w300),
            ],
          ),
        ),
        GestureDetector(
          onTap: (){
            baseMode(2);
          },
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15),
                height: 30,
                width: 5,
                color: (currentMode == 2) ? IOSColors.secondary : Colors.black,
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                height: 30,
                width: 50,
                color: Colors.black,
                child: const IOStext(text: 'DEC', size: 20, pad: 3),
              ),
              IOStext(text: displayDec, size: 20, pad: 3, weight: FontWeight.w300),
            ],
          ),
        ),
        GestureDetector(
          onTap: (){
            baseMode(3);
          },
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15),
                height: 30,
                width: 5,
                color: (currentMode == 3) ? IOSColors.secondary : Colors.black,
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                height: 30,
                width: 50,
                color: Colors.black,
                child: const IOStext(text: 'OCT', size: 20, pad: 3),
              ),
              IOStext(text: displayOct, size: 20, pad: 3, weight: FontWeight.w300, align: TextAlign.start),
            ],
          ),
        ),
        GestureDetector(
          onTap: (){
            baseMode(4);
          },
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15),
                height: 30,
                width: 5,
                color: (currentMode == 4) ? IOSColors.secondary : Colors.black,
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                height: 30,
                width: 50,
                color: Colors.black,
                child: const IOStext(text: 'BIN', size: 20, pad: 3),
              ),//'0000 0000 0000 0000 0000 0000 0000 0000\n0000 0000 0000 0000 0000 0000 0000 0000'
              IOStext(text: displayBin, size: 18, pad: 3, weight: FontWeight.w300),
            ],
          ),
        ),
      ]
    );
  }
}