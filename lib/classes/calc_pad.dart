import 'package:base_n_calculator/classes/button_row.dart';
import 'package:base_n_calculator/classes/calc_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalcPad extends StatefulWidget {
  const CalcPad({super.key});

  @override
  State<CalcPad> createState() => _CalcPadState();
}

class _CalcPadState extends State<CalcPad> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ButtonRow(
          first: CalcButton(color: Color(0xFFA5A5A5), iconColor: Colors.black),
          second: CalcButton(text: 'D'),
          third: CalcButton(text: 'E'),
          fourth: CalcButton(text: 'F'),
          fifth: CalcButton(color: Color(0xFFFE9700), text: 'Del', textSize: 25, textPad: 20),
        ),
        ButtonRow(
          first: CalcButton(color: Color(0xFFA5A5A5), iconColor: Colors.black),
          second: CalcButton(text: 'A'),
          third: CalcButton(text: 'B'),
          fourth: CalcButton(text: 'C'),
          fifth: CalcButton(color: Color(0xFFFE9700), icon: CupertinoIcons.multiply),
        ),
        ButtonRow(
          first: CalcButton(color: Color(0xFFA5A5A5), iconColor: Colors.black),
          second: CalcButton(text: '7'),
          third: CalcButton(text: '8'),
          fourth: CalcButton(text: '9'),
          fifth: CalcButton(color: Color(0xFFFE9700), icon: CupertinoIcons.divide),
        ),
        ButtonRow(
          first: CalcButton(color: Color(0xFFA5A5A5), iconColor: Colors.black),
          second: CalcButton(text: '4'),
          third: CalcButton(text: '5'),
          fourth: CalcButton(text: '6'),
          fifth: CalcButton(color: Color(0xFFFE9700), icon: CupertinoIcons.minus),
        ),
        ButtonRow(
          first: CalcButton(color: Color(0xFFA5A5A5), iconColor: Colors.black),
          second: CalcButton(text: '1'),
          third: CalcButton(text: '2'),
          fourth: CalcButton(text: '3'),
          fifth: CalcButton(color: Color(0xFFFE9700), icon: CupertinoIcons.add),
        ),
        ButtonRow(
          first: CalcButton(color: Color(0xFFA5A5A5), iconColor: Colors.black),
          second: CalcButton(text: '0'),
          third: CalcButton(text: '.', textSize: 50, textPad: 0),
          fourth: CalcButton(icon: CupertinoIcons.plus_slash_minus),
          fifth: CalcButton(color: Color(0xFFFE9700), icon: CupertinoIcons.equal),
        ),
      ],
    );
  }
}