import 'package:base_n_calculator/classes/colors.dart';
import 'package:base_n_calculator/classes/ios_style_text.dart';
import 'package:base_n_calculator/functions.dart';
import 'package:base_n_calculator/variables.dart';
import 'package:flutter/cupertino.dart';
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

  bool? isDisabled;
  bool isActivated = false;
  int currentOperator = 0;

  @override
  void initState(){
    currentOperator = determineOperator(widget.icon);
    activatedStream.stream.listen((result){
      if(widget.icon == result && isActivated == false){
        setState(() {
          isActivated = true;
        });
      }else{
        setState(() {
          isActivated = false;
        });
      }
    });
    setState(() {
      isDisabled = determineIfDisabled(widget.text);
    });
    baseNCardStream.stream.listen((data) {
      bool response = determineIfDisabled(widget.text);
      setState(() {
        isDisabled = response;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(widget.pad ?? 3),
      child: ClipOval(
        child: Material(
          color: (widget.text != null)
          ? (!isDisabled!) ? widget.color : IOSColors.disabled
          : (isActivated) ? Colors.white : widget.color,
          child: InkWell(
            highlightColor: (isDisabled!) ? IOSColors.transparent : null,
            splashColor: (isDisabled!) ? IOSColors.transparent : null,
            onLongPress: (widget.text == 'Del') ? clear : null,
            onTap: () {
              if(isDisabled!) {
                return;
              } else if(widget.text != null){
                if(widget.text != 'Del'){
                  concatenate(widget.text!);
                }
                else{
                  delete(widget.text!);
                }
              } else if(widget.icon != CupertinoIcons.plus_slash_minus){
                setState(() {
                  isActivated = !isActivated;
                });
                determineIfActivated(widget.icon);
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
              color: (isActivated) ? widget.iconColor : Colors.white
            )),
          ),
        ),
      ),
    );
  }
}