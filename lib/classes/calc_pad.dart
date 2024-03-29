import 'package:base_n_calculator/classes/binary_buttons.dart';
import 'package:base_n_calculator/classes/button_row.dart';
import 'package:base_n_calculator/classes/calc_button.dart';
import 'package:base_n_calculator/classes/colors.dart';
import 'package:base_n_calculator/classes/operation_buttons.dart';
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ButtonRow(
          first: CalcButton(color: IOSColors.tertiary),
          second: CalcButton(color: IOSColors.primary, text: 'D'),
          third: CalcButton(color: IOSColors.primary, text: 'E'),
          fourth: CalcButton(color: IOSColors.primary, text: 'F'),
          fifth: CalcButton(color: IOSColors.secondary, text: 'Del', textSize: 25, textPad: 20),
        ),
        ButtonRow(
          first: const OnesButton(),
          second: CalcButton(color: IOSColors.primary, text: 'A'),
          third: CalcButton(color: IOSColors.primary, text: 'B'),
          fourth: CalcButton(color: IOSColors.primary, text: 'C'),
          fifth: const MultiplyButton(),
        ),
        ButtonRow(
          first: const TwosButton(),
          second: CalcButton(color: IOSColors.primary, text: '7'),
          third: CalcButton(color: IOSColors.primary, text: '8'),
          fourth: CalcButton(color: IOSColors.primary, text: '9'),
          fifth: const DivideButton(),
        ),
        ButtonRow(
          first: const ExponentButton(),
          second: CalcButton(color: IOSColors.primary, text: '4'),
          third: CalcButton(color: IOSColors.primary, text: '5'),
          fourth: CalcButton(color: IOSColors.primary, text: '6'),
          fifth: const MinusButton(),
        ),
        ButtonRow(
          first: const ModuloButton(),
          second: CalcButton(color: IOSColors.primary, text: '1'),
          third: CalcButton(color: IOSColors.primary, text: '2'),
          fourth: CalcButton(color: IOSColors.primary, text: '3'),
          fifth: const AddButton(),
        ),
        ButtonRow(
          first: InfoButton(color:  IOSColors.tertiary, icon: CupertinoIcons.info, iconColor: Colors.black),
          second: CalcButton(color: IOSColors.primary, text: '0', width: 155),
          third: const SignButton(),
          fourth: const EqualButton(),
          fifth: Container()
        ),
      ],
    );
  }
}