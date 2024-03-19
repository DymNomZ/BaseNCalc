import 'package:base_n_calculator/classes/colors.dart';
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
              if(toOperate){
                if(chainOperate){
                  displayStream.sink.add(displayValue);
                  firstValue = 0;
                  secondValue = 0;
                  willOperateStream.sink.add(false);
                }else if(secondValue == 0){
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