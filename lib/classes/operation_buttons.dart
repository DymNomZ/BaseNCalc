import 'package:base_n_calculator/classes/colors.dart';
import 'package:base_n_calculator/classes/ios_style_text.dart';
import 'package:base_n_calculator/functions.dart';
import 'package:base_n_calculator/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddButton extends StatefulWidget {
  //Made entirely by me: DymNomZ
  final double? size;
  final double? pad;
  final Color? color;
  final Color? iconColor;
  final Widget? child;

  const AddButton({this.size, this.pad, this.color, this.iconColor, this.child, super.key});

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {

  bool isActivated = false;
  bool isChain = false;

  @override
  void initState(){
    willOperateStream.stream.listen((status){
      setState(() {
        isChain = status;
      });
    });
    operatorStream.stream.listen((value) {
      if(value != CupertinoIcons.add){
        setState(() {
          isActivated = false;
        });
      }
    });
    activatedStream.stream.listen((status) {
      setState(() {
        isActivated = status;
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
          color: (isActivated) ? Colors.white : IOSColors.secondary,
          child: InkWell(
            onTap: () {
              resetBin();
              if(isChain){
                if(secondValue == 0){
                  secondValue = convert();
                  compute();
                }
                firstValue = convert();
                secondValue = 0;
                chainOperate = true;
                chainOperateStream.sink.add(true);
              }
              setState(() {
                isActivated = !isActivated;
              });
              determineOperator(CupertinoIcons.add);
              willOperateStream.sink.add(isActivated);
            },
            child: SizedBox(
              width: widget.size ?? 75, 
              height: widget.size ?? 75,
            child: Icon(
              CupertinoIcons.add,
              color: (isActivated) ? IOSColors.secondary : Colors.white
            )),
          ),
        ),
      ),
    );
  }
}

class MinusButton extends StatefulWidget {
  //Made entirely by me: DymNomZ
  final double? size;
  final double? pad;
  final Color? color;
  final Color? iconColor;
  final Widget? child;

  const MinusButton({this.size, this.pad, this.color, this.iconColor, this.child, super.key});

  @override
  State<MinusButton> createState() => _MinusButtonState();
}

class _MinusButtonState extends State<MinusButton> {

  bool isActivated = false;
  bool isChain = false;

  @override
  void initState(){
    willOperateStream.stream.listen((status){
      setState(() {
        isChain = status;
      });
    });
    operatorStream.stream.listen((value) {
      if(value != CupertinoIcons.minus){
        setState(() {
          isActivated = false;
        });
      }
    });
    activatedStream.stream.listen((status) {
      setState(() {
        isActivated = status;
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
          color: (isActivated) ? Colors.white : IOSColors.secondary,
          child: InkWell(
            onTap: () {
              resetBin();
              if(isChain){
                if(secondValue == 0){
                  secondValue = convert();
                  compute();
                }
                firstValue = convert();
                secondValue = 0;
                chainOperate = true;
              }
              setState(() {
                isActivated = !isActivated;
              });
              determineOperator(CupertinoIcons.minus);
              willOperateStream.sink.add(isActivated);
            },
            child: SizedBox(
              width: widget.size ?? 75, 
              height: widget.size ?? 75,
            child: Icon(
              CupertinoIcons.minus,
              color: (isActivated) ? IOSColors.secondary : Colors.white
            )),
          ),
        ),
      ),
    );
  }
}

class DivideButton extends StatefulWidget {
  //Made entirely by me: DymNomZ
  final double? size;
  final double? pad;
  final Color? color;
  final Color? iconColor;
  final Widget? child;

  const DivideButton({this.size, this.pad, this.color, this.iconColor, this.child, super.key});

  @override
  State<DivideButton> createState() => _DivideButtonState();
}

class _DivideButtonState extends State<DivideButton> {

  bool isActivated = false;
  bool isChain = false;

  @override
  void initState(){
    willOperateStream.stream.listen((status){
      setState(() {
        isChain = status;
      });
    });
    operatorStream.stream.listen((value) {
      if(value != CupertinoIcons.divide){
        setState(() {
          isActivated = false;
        });
      }
    });
    activatedStream.stream.listen((status) {
      setState(() {
        isActivated = status;
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
          color: (isActivated) ? Colors.white : IOSColors.secondary,
          child: InkWell(
            onTap: () {
              resetBin();
              if(isChain){
                if(secondValue == 0){
                  secondValue = convert();
                  compute();
                }
                firstValue = convert();
                secondValue = 0;
                chainOperate = true;
              }
              setState(() {
                isActivated = !isActivated;
              });
              determineOperator(CupertinoIcons.divide);
              willOperateStream.sink.add(isActivated);
            },
            child: SizedBox(
              width: widget.size ?? 75, 
              height: widget.size ?? 75,
            child: Icon(
              CupertinoIcons.divide,
              color: (isActivated) ? IOSColors.secondary : Colors.white
            )),
          ),
        ),
      ),
    );
  }
}

class MultiplyButton extends StatefulWidget {
  //Made entirely by me: DymNomZ
  final double? size;
  final double? pad;
  final Color? color;
  final Color? iconColor;
  final Widget? child;

  const MultiplyButton({this.size, this.pad, this.color, this.iconColor, this.child, super.key});

  @override
  State<MultiplyButton> createState() => _MultiplyButtonState();
}

class _MultiplyButtonState extends State<MultiplyButton> {

  bool isActivated = false;
  bool isChain = false;

  @override
  void initState(){
    willOperateStream.stream.listen((status){
      setState(() {
        isChain = status;
      });
    });
    operatorStream.stream.listen((value) {
      if(value != CupertinoIcons.multiply){
        setState(() {
          isActivated = false;
        });
      }
    });
    activatedStream.stream.listen((status) {
      setState(() {
        isActivated = status;
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
          color: (isActivated) ? Colors.white : IOSColors.secondary,
          child: InkWell(
            onTap: () {
              resetBin();
              if(isChain){
                if(secondValue == 0){
                  secondValue = convert();
                  compute();
                }
                firstValue = convert();
                secondValue = 0;
                chainOperate = true;
              }
              setState(() {
                isActivated = !isActivated;
              });
              determineOperator(CupertinoIcons.multiply);
              willOperateStream.sink.add(isActivated);
            },
            child: SizedBox(
              width: widget.size ?? 75, 
              height: widget.size ?? 75,
            child: Icon(
              CupertinoIcons.multiply,
              color: (isActivated) ? IOSColors.secondary : Colors.white
            )),
          ),
        ),
      ),
    );
  }
}

class EqualButton extends StatefulWidget {
  //Made entirely by me: DymNomZ
  final double? size;
  final double? pad;
  final IconData? icon;
  final Color? color;
  final Color? iconColor;
  final Widget? child;

  const EqualButton({this.size, this.pad, this.icon, this.color, this.iconColor, this.child, super.key});

  @override
  State<EqualButton> createState() => _EqualButtonState();
}

class _EqualButtonState extends State<EqualButton> {

  bool toOperate = false;

  @override
  void initState(){
    willOperateStream.stream.listen((status){
      setState(() {
        toOperate = status;
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
          color: IOSColors.secondary,
          child: InkWell(
            onTap: () {
              resetBin();
              if(toOperate){
                if(secondValue == 0){
                  secondValue = convert();
                  compute();
                }
              }
              chainOperate = false;
            },
            child: SizedBox(
              width: widget.size ?? 75, 
              height: widget.size ?? 75,
            child: const Icon(
              CupertinoIcons.equal,
              color: Colors.white
            )),
          ),
        ),
      ),
    );
  }
}

class ExponentButton extends StatefulWidget {
  //Made entirely by me: DymNomZ
  final double? size;
  final double? pad;
  final Color? color;
  final Color? iconColor;
  final Widget? child;

  const ExponentButton({this.size, this.pad, this.color, this.iconColor, this.child, super.key});

  @override
  State<ExponentButton> createState() => _ExponentButtonState();
}

class _ExponentButtonState extends State<ExponentButton> {

  bool isActivated = false;
  bool isChain = false;

  @override
  void initState(){
    willOperateStream.stream.listen((status){
      setState(() {
        isChain = status;
      });
    });
    operatorStream.stream.listen((value) {
      if(value != CupertinoIcons.multiply_square){
        setState(() {
          isActivated = false;
        });
      }
    });
    activatedStream.stream.listen((status) {
      setState(() {
        isActivated = status;
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
          color: (isActivated) ? Colors.white : IOSColors.tertiary,
          child: InkWell(
            onTap: () {
              resetBin();
              if(isChain){
                if(secondValue == 0){
                  secondValue = convert();
                  compute();
                }
                firstValue = convert();
                secondValue = 0;
                chainOperate = true;
              }
              setState(() {
                isActivated = !isActivated;
              });
              determineOperator(CupertinoIcons.multiply_square);
              willOperateStream.sink.add(isActivated);
            },
            child: SizedBox(
              width: widget.size ?? 75, 
              height: widget.size ?? 75,
            child: const IOStext(text: 'exp', color: Colors.black)
            )
          ),
        ),
      ),
    );
  }
}

class ModuloButton extends StatefulWidget {
  //Made entirely by me: DymNomZ
  final double? size;
  final double? pad;
  final Color? color;
  final Color? iconColor;
  final Widget? child;

  const ModuloButton({this.size, this.pad, this.color, this.iconColor, this.child, super.key});

  @override
  State<ModuloButton> createState() => _ModuloButtonState();
}

class _ModuloButtonState extends State<ModuloButton> {

  bool isActivated = false;
  bool isChain = false;

  @override
  void initState(){
    willOperateStream.stream.listen((status){
      setState(() {
        isChain = status;
      });
    });
    operatorStream.stream.listen((value) {
      if(value != CupertinoIcons.percent){
        setState(() {
          isActivated = false;
        });
      }
    });
    activatedStream.stream.listen((status) {
      setState(() {
        isActivated = status;
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
          color: (isActivated) ? Colors.white : IOSColors.tertiary,
          child: InkWell(
            onTap: () {
              resetBin();
              if(isChain){
                if(secondValue == 0){
                  secondValue = convert();
                  compute();
                }
                firstValue = convert();
                secondValue = 0;
                chainOperate = true;
              }
              setState(() {
                isActivated = !isActivated;
              });
              determineOperator(CupertinoIcons.percent);
              willOperateStream.sink.add(isActivated);
            },
            child: SizedBox(
              width: widget.size ?? 75, 
              height: widget.size ?? 75,
            child: const Icon(CupertinoIcons.percent, size: 30,)),
          ),
        ),
      ),
    );
  }
}

class SignButton extends StatefulWidget {
  //Made entirely by me: DymNomZ
  final double? size;
  final double? pad;
  final Color? color;
  final Color? iconColor;
  final Widget? child;

  const SignButton({this.size, this.pad, this.color, this.iconColor, this.child, super.key});

  @override
  State<SignButton> createState() => _SignButtonState();
}

class _SignButtonState extends State<SignButton> {

  bool isActivated = false;
  bool isChain = false;
  bool isDisabled = false;

  @override
  void initState(){
    willOperateStream.stream.listen((status){
      setState(() {
        isChain = status;
        isDisabled = status;
      });
    });
    operatorStream.stream.listen((value) {
      if(value != CupertinoIcons.percent){
        setState(() {
          isActivated = false;
        });
      }
    });
    activatedStream.stream.listen((status) {
      setState(() {
        isActivated = status;
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
          color: (isDisabled) ? IOSColors.disabled 
          : (isActivated) ? Colors.white : IOSColors.primary,
          child: InkWell(
            highlightColor: (isDisabled) ? IOSColors.transparent : null,
            splashColor: (isDisabled) ? IOSColors.transparent : null,
            onTap: () {
              //resetBin();
              if(isDisabled){
                return;
              }else{
                setState(() {
                  isActivated = !isActivated;
                  onChangeSign = !onChangeSign;
                });
                changeSign();
              }
            },
            child: SizedBox(
              width: widget.size ?? 75, 
              height: widget.size ?? 75,
            child: Icon(CupertinoIcons.plus_slash_minus, 
            color: (isActivated) ? Colors.black : Colors.white)),
          ),
        ),
      ),
    );
  }
}