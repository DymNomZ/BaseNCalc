import 'package:base_n_calculator/classes/colors.dart';
import 'package:base_n_calculator/classes/ios_style_text.dart';
import 'package:base_n_calculator/functions.dart';
import 'package:base_n_calculator/variables.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CalcButton extends StatefulWidget {
  //Made entirely by me: DymNomZ
  final double? size;
  final double? pad;
  final IconData? icon;
  final String? text;
  final double? textSize;
  final double? textPad;
  final Color? color;
  final Color? textColor;
  final Color? iconColor;
  final Widget? child;
  final double? width;

  const CalcButton({this.size, this.pad, this.icon, this.text, this.textSize, this.textPad, 
  this.color, this.textColor, this.iconColor, this.child, this.width, super.key});

  @override
  State<CalcButton> createState() => _CalcButtonState();
}

class _CalcButtonState extends State<CalcButton> {

  bool? isDisabled;
  bool toOperate = false;

  @override
  void initState(){
    willOperateStream.stream.listen((status){
      setState(() {
        toOperate = status;
      });
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
      child: SizedBox(
        width: widget.width ?? 75,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100.0),
          child: Material(
            color: (widget.text != null && !isDisabled!)
            ? widget.color : IOSColors.disabled,
            child: InkWell(
              highlightColor: (isDisabled!) ? IOSColors.transparent : null,
              splashColor: (isDisabled!) ? IOSColors.transparent : null,
              onLongPress: (widget.text == 'Del') ? reset : null,
              onTap: () {
                if(isDisabled!) {
                  return;
                } else if(widget.text != null){
                  if(widget.text == 'Del'){
                    delete();
                  }else{
                    if(toOperate){
                      if(chainOperate){
                        activatedStream.sink.add(false);
                        clear();
                      }
                      if(firstValue == 0){
                        firstValue = convert();
                        activatedStream.sink.add(false);
                        clear();
                      }
                      concatenate(widget.text!);
                    }else{
                      concatenate(widget.text!);
                    }
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
                color: widget.textColor ?? Colors.white,
                pad: widget.textPad)
              : Icon(
                widget.icon ?? Icons.menu,
                color: widget.iconColor ?? Colors.white
              )),
            ),
          ),
        ),
      ),
    );
  }
}

class InfoButton extends StatefulWidget {
  //Made entirely by me: DymNomZ
  final double? size;
  final double? pad;
  final IconData? icon;
  final Color? color;
  final Color? textColor;
  final Color? iconColor;
  final double? iconSize;
  final Widget? child;
  final double? width;

  const InfoButton({this.size, this.pad, this.icon, this.color, this.iconSize, 
  this.textColor, this.iconColor, this.child, this.width, super.key});

  @override
  State<InfoButton> createState() => _InfoButtonState();
}

class _InfoButtonState extends State<InfoButton> {

  @override
  void initState(){
    super.initState();
  }

  _launchURL() async {
   final Uri url = Uri.parse('https://github.com/DymNomZ');
   if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
    }
}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(widget.pad ?? 3),
      child: SizedBox(
        width: widget.width ?? 75,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100.0),
          child: Material(
            color: widget.color,
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context, 
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                      builder: (context, setState) {
                        return Scaffold(
                          backgroundColor: Colors.black,
                          body: Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const IOStext(text: 'BaseNCalc', align: TextAlign.center),
                                const IOStext(text: '☘ App Info ☘', 
                                align: TextAlign.center, size: 25),
                                const IOStext(text: 'A programming oriented calculator with conversions from Base-2 to Base-16!\n\n Visit my Github profile:', 
                                align: TextAlign.center, size: 25),
                                InkWell(
                                  onTap: () => _launchURL(),
                                  child: const Text('https://github.com/DymNomZ', style: TextStyle(color: Colors.green, fontWeight: FontWeight.w400, fontSize: 18),)
                                ),
                              ],
                            ),
                          )
                        );
                      }
                    );
                  }
                );
              },
              child: SizedBox(
                width: widget.size ?? 75, 
                height: widget.size ?? 75,
              child: Icon(
                widget.icon ?? Icons.menu,
                color: widget.iconColor ?? Colors.white,
                size: widget.iconSize ?? 30
              )),
            ),
          ),
        ),
      ),
    );
  }
}