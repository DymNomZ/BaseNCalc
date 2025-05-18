import 'package:flutter/material.dart';

class ButtonRow extends StatefulWidget {

  final Widget first;
  final Widget second;
  final Widget third;
  final Widget fourth;
  final Widget fifth;

  const ButtonRow({required this.first, required this.second, required this.third,
  required this.fourth, required this.fifth, super.key});

  @override
  State<ButtonRow> createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget.first,
        widget.second,
        widget.third,
        widget.fourth,
        widget.fifth
      ],
    );
  }
}