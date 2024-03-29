import 'package:base_n_calculator/classes/colors.dart';
import 'package:base_n_calculator/classes/ios_style_text.dart';
import 'package:base_n_calculator/functions.dart';
import 'package:base_n_calculator/variables.dart';
import 'package:flutter/material.dart';

class OnesButton extends StatefulWidget {
  //Made entirely by me: DymNomZ
  final double? size;
  final double? pad;
  final Color? color;
  final Color? iconColor;
  final Widget? child;

  const OnesButton({this.size, this.pad, this.color, this.iconColor, this.child, super.key});

  @override
  State<OnesButton> createState() => _OnesButtonState();
}

class _OnesButtonState extends State<OnesButton> {

  bool isActivated = false;
  bool isDisabled = false;

  @override
  void initState(){
    displayStream.stream.listen((event) {
      setState(() {
        if(onChangeSign){
          isDisabled = true;
        }else{
          isDisabled = false;
        }
      });
    });
    binaryStream.stream.listen((complement) {
      if(complement != 1){
        setState(() {
          onOnes = false;
          isActivated = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(widget.pad ?? 3),
      child: ClipOval(
        child: Material(
          color: (isDisabled) ? IOSColors.disabled 
          : (isActivated) ? Colors.white : IOSColors.tertiary,
          child: InkWell(
            highlightColor: (isDisabled) ? IOSColors.transparent : null,
            splashColor: (isDisabled) ? IOSColors.transparent : null,
            onTap: () {
              if(isDisabled){
                return;
              }else{
                setState(() {
                  isActivated = !isActivated;
                });
                onesComplement();
              }
            },
            child: SizedBox(
              width: widget.size ?? 75, 
              height: widget.size ?? 75,
            child: IOStext(text: '1s', color: (isDisabled) ? Colors.white : Colors.black)
            )
          ),
        ),
      ),
    );
  }
}

class TwosButton extends StatefulWidget {
  //Made entirely by me: DymNomZ
  final double? size;
  final double? pad;
  final Color? color;
  final Color? iconColor;
  final Widget? child;

  const TwosButton({this.size, this.pad, this.color, this.iconColor, this.child, super.key});

  @override
  State<TwosButton> createState() => _TwosButtonState();
}

class _TwosButtonState extends State<TwosButton> {

  bool isActivated = false;
  bool isDisabled = false;

  @override
  void initState(){
    displayStream.stream.listen((event) {
      setState(() {
        if(onChangeSign){
          isDisabled = true;
        }else{
          isDisabled = false;
        }
      });
    });
    binaryStream.stream.listen((complement) {
      if(complement != 2){
        setState(() {
          onTwos = false;
          isActivated = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(widget.pad ?? 3),
      child: ClipOval(
        child: Material(
          color: (isDisabled) ? IOSColors.disabled 
          : (isActivated) ? Colors.white : IOSColors.tertiary,
          child: InkWell(
            highlightColor: (isDisabled) ? IOSColors.transparent : null,
            splashColor: (isDisabled) ? IOSColors.transparent : null,
            onTap: () {
              if(isDisabled){
                return;
              }else{
                setState(() {
                  isActivated = !isActivated;
                });
                twosComplement();
              }
            },
            child: SizedBox(
              width: widget.size ?? 75, 
              height: widget.size ?? 75,
            child: IOStext(text: '2s', color: (isDisabled) ? Colors.white : Colors.black)
            )
          ),
        ),
      ),
    );
  }
}