import 'package:base_n_calculator/classes/ios_style_text.dart';
import 'package:base_n_calculator/variables.dart';
import 'package:flutter/material.dart';

class CalcButton extends StatefulWidget {
  //Made entirely by me: DymNomZ
  final double? size;
  final double? pad;
  final IconData? icon;
  final String? text;
  final double? textSize;
  final double? textPad;
  final Color? color;
  final Color? iconColor;
  final Widget? child;

  const CalcButton({this.size, this.pad, this.icon, this.text,
  this.textSize, this.textPad, this.color, this.iconColor, this.child, super.key});

  @override
  State<CalcButton> createState() => _CalcButtonState();
}

class _CalcButtonState extends State<CalcButton> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(widget.pad ?? 3),
      child: ClipOval(
        child: Material(
          color: widget.color ?? const Color(0xFF343434),
          child: InkWell(
            splashColor: Colors.white,
            onTap: () {
              print(displayValue);
              if(widget.text != null){
                if(displayValue == '0'){
                  setState(() {
                    displayValue = widget.text!;
                  });
                  print(displayValue);
                }
                else{
                  setState(() {
                    displayValue += widget.text!;
                    print(displayValue);
                  });
                }
              }
            },
            child: SizedBox(
              width: widget.size ?? 75, 
              height: widget.size ?? 75,
            child: (widget.text != null)
            ? IOStext(
              text: widget.text!, 
              size: widget.textSize,
              pad: widget.textPad)
            : Icon(
              widget.icon ?? Icons.menu,
              color: widget.iconColor ?? Colors.white
            )),
          ),
        ),
      ),
    );
  }
}