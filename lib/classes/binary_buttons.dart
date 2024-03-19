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
  bool isOnes= false;

  @override
  void initState(){
    binaryStream.stream.listen((complement) {
      if(complement == 1){
        setState(() {
          isOnes = true;
        });
      }else{
        setState(() {
          isOnes = false;
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
          color: (isActivated) ? Colors.white : IOSColors.tertiary,
          child: InkWell(
            onTap: () {
              setState(() {
                isActivated = !isActivated;
              });
              if(isOnes){
                resetBin();
              }else{
                onesComplement();
              }
            },
            child: SizedBox(
              width: widget.size ?? 75, 
              height: widget.size ?? 75,
            child: const IOStext(text: '1s', color: Colors.black)
            )
          ),
        ),
      ),
    );
  }
}