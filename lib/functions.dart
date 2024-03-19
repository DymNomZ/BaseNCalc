import 'package:base_n_calculator/variables.dart';
import 'package:flutter/cupertino.dart';

void reset(){
  clear();
  willOperateStream.sink.add(false);
  activatedStream.sink.add(false);
  operatorStream.sink.add(CupertinoIcons.car_detailed); // :p
  firstValue = 0;
  secondValue = 0;
  currentOperator = 0;
  onOnes = false;
  onTwos = false;
  binaryStream.sink.add(13);
  chainOperate = false;
  chainOperateStream.sink.add(false);
}

int convert(){
  if(onHex){
    return int.parse(displayValue, radix: 16);
  }else if(onDec){
    return int.parse(displayValue);
  }else if(onOct){
    return int.parse(displayValue, radix: 8);
  }else{
    return int.parse(displayValue, radix: 2);
  }
}

void compute(){
  if(currentOperator == 1){
    add();
  }else if(currentOperator == 2){
    subtract();
  }else if(currentOperator == 3){
    divide();
  }else if(currentOperator == 4){
    multiply();
  }
  displayStream.sink.add(displayValue);
  firstValue = 0;
  secondValue = 0;
  willOperateStream.sink.add(false);
}

void convertDisplay(){
  if(onHex){
    int decimalEquiv = int.parse(displayValue, radix: 16);
    displayHex = displayValue.toUpperCase();
    displayDec = decimalEquiv.toString();
    displayOct = decimalEquiv.toRadixString(8);
    displayBin = decimalEquiv.toRadixString(2);
  }else if(onDec){
    int decimalEquiv = int.parse(displayValue);
    displayHex = decimalEquiv.toRadixString(16).toUpperCase();
    displayDec = displayValue;
    displayOct = decimalEquiv.toRadixString(8);
    displayBin = decimalEquiv.toRadixString(2);
  }else if(onOct){
    int decimalEquiv = int.parse(displayValue, radix: 8);
    displayHex = decimalEquiv.toRadixString(16).toUpperCase();
    displayDec = decimalEquiv.toString();
    displayOct = displayValue;
    displayBin = decimalEquiv.toRadixString(2);
  }else{
    int decimalEquiv = int.parse(displayValue, radix: 2);
    displayHex = decimalEquiv.toRadixString(16).toUpperCase();
    displayDec = decimalEquiv.toString();
    displayOct = decimalEquiv.toRadixString(8);
    displayBin = displayValue;
  }
  //hexSeparator();
  //decimalSeparator();
  //octalSeparator();
  binarySeparator();
}

void resetBin(){
  int decimalEquiv = int.parse(displayDec, radix: 10);
  displayBin = decimalEquiv.toRadixString(2);
  binarySeparator();
  binaryStream.sink.add(0);
}

void onesComplement(){
  if(displayBin != '0000'){
    if(onOnes == false){
      int decimalEquiv = int.parse(displayDec, radix: 10);
      displayBin = decimalEquiv.toRadixString(2);
      binarySeparator();
      displayBin = displayBin.replaceAll('0', 'a');
      displayBin = displayBin.replaceAll('1', '0');
      displayBin = displayBin.replaceAll('a', '1');
      onOnes = true;
      binaryStream.sink.add(1);
    }else{
      resetBin();
      onOnes = false;
    }
  }
}

void twosComplement(){
  if(displayValue != '0'){
    int decimalEquiv = int.parse(displayDec, radix: 10);
    if(onTwos == false){
      displayBin = decimalEquiv.toRadixString(2);
      compensator();
      displayBin = displayBin.replaceAll('0', 'a');
      displayBin = displayBin.replaceAll('1', '0');
      displayBin = displayBin.replaceAll('a', '1');
      decimalEquiv = int.parse(displayBin, radix: 2);
      decimalEquiv += 1;
      displayBin = decimalEquiv.toRadixString(2);
      binarySeparator();
      onTwos = true;
      binaryStream.sink.add(2);
    }else{
      resetBin();
      onTwos = false;
    }
  }
}

void hexSeparator() {
  String separatedHex = displayHex;
  for(int i = 4; i < displayHex.length; i += 4){
    separatedHex = separatedHex.substring(0, i) + ' ' + separatedHex.substring(i);
  }
}

void decimalSeparator() {
  String separatedDecimal = '';
  if(displayDec.length % 4 == 0){
    for (int i = 0; i < displayDec.length; i += 4) {
     String decimalGroup = displayDec.substring(i, i + 4);
     separatedDecimal += decimalGroup;
     if (i < displayDec.length - 4) {
       separatedDecimal += ',';
     }
   }
  displayDec = separatedDecimal;
  }
}

void octalSeparator() {
  String separatedOctal = '';
   for (int i = 0; i < displayOct.length; i += 4) {
     String octalGroup = displayOct.substring(i, i + 4);
     separatedOctal += octalGroup;
     if (i < displayOct.length - 4) {
       separatedOctal += ' ';
     }
   }
  displayOct = separatedOctal;
}

void binarySeparator() {
  compensator();
  String separatedBinary = '';
  int spaceCounter = 0;
   for (int i = 0; i < displayBin.length; i += 4) {
     String binaryGroup = displayBin.substring(i, i + 4);
     separatedBinary += binaryGroup;
     if (i < displayBin.length - 4) {
       separatedBinary += ' ';
       spaceCounter++;
     }
     if(spaceCounter == 8){
       separatedBinary += '\n';
     }
   }
  displayBin = separatedBinary;
}

void compensator(){
  String compensate = '0';
  if (displayBin.length % 4 != 0) {
    int remainder = displayBin.length % 4;
    for(int i = 0; i < 3-remainder; i++){
      compensate += '0';
    }
    displayBin = compensate + displayBin;
  }
}

void add(){
  if(onHex){
    displayValue = (firstValue + secondValue).toRadixString(16);
  }else if(onDec){
    displayValue = (firstValue + secondValue).toString();
  }else if(onOct){
    displayValue = (firstValue + secondValue).toRadixString(8);
  }else if(onBin){
    displayValue = (firstValue + secondValue).toRadixString(2);
  }
}

void subtract(){
  if(onHex){
    displayValue = (firstValue - secondValue).toRadixString(16);
  }else if(onDec){
    displayValue = (firstValue - secondValue).toString();
  }else if(onOct){
    displayValue = (firstValue - secondValue).toRadixString(8);
  }else if(onBin){
    displayValue = (firstValue - secondValue).toRadixString(2);
  }
}

void multiply(){
  if(onHex){
    displayValue = (firstValue * secondValue).toRadixString(16);
  }else if(onDec){
    displayValue = (firstValue * secondValue).toString();
  }else if(onOct){
    displayValue = (firstValue * secondValue).toRadixString(8);
  }else if(onBin){
    displayValue = (firstValue * secondValue).toRadixString(2);
  }
}

void divide(){
  if(onHex){
    displayValue = (firstValue ~/ secondValue).toRadixString(16);
  }else if(onDec){
    displayValue = (firstValue ~/ secondValue).toString();
  }else if(onOct){
    displayValue = (firstValue ~/ secondValue).toRadixString(8);
  }else if(onBin){
    displayValue = (firstValue ~/ secondValue).toRadixString(2);
  }
}

void concatenate(String data){
  if(displayValue.length < 16){
    if(displayValue == '0'){
      displayValue = data;
    }
    else{
      displayValue += data;
    }
  }
  displayStream.sink.add(displayValue);
}

void delete(){
  if(displayValue.length <= 1 || (displayValue.length == 2 && displayValue.startsWith('-'))){
    displayValue = '0';
    willOperateStream.sink.add(false);
    activatedStream.sink.add(false);
  }
  else{
    displayValue = displayValue.substring(0, displayValue.length - 1);
  }
  displayStream.sink.add(displayValue);
  displaySizeStream.sink.add(displayValue);
}

void clear(){
  displayValue = '0';
  displayStream.sink.add(displayValue);
}

void baseMode(int mode){
  if(mode == 1){
    onHex = true;
    onDec = false;
    onOct = false;
    onBin = false;
    displayValue = displayHex;
  }else if(mode == 2){
    onHex = false;
    onDec = true;
    onOct = false;
    onBin = false;
    displayValue = displayDec;
  }else if(mode == 3){
    onHex = false;
    onDec = false;
    onOct = true;
    onBin = false;
    displayValue = displayOct;
  }else if(mode == 4){
    onHex = false;
    onDec = false;
    onOct = false;
    onBin = true;
    displayValue = (displayBin != '0000') ? displayBin : '0';
  }
  baseNCardStream.sink.add(mode);
  displayStream.sink.add(displayValue);
}

bool determineIfDisabled(String? text){
  if(onHex && text != '.'){ //temp for now until support for floating point
    return false;
  }else if(onDec && notDec.contains(text)){
    return true;
  }else if(onOct && notOct.contains(text)){
    return true;
  }else if(onBin && notBin.contains(text)){
    return true;
  }else if(text == '.'){
    return true; //temp for now until support for floating point
  }
  return false;
}

void determineOperator(IconData data){
  if(data == CupertinoIcons.add){
    currentOperator = 1;
    operatorStream.sink.add(data);
  }else if(data == CupertinoIcons.minus){
    currentOperator = 2;
    operatorStream.sink.add(data);
  }else if(data == CupertinoIcons.divide){
    currentOperator = 3;
    operatorStream.sink.add(data);
  }else if(data == CupertinoIcons.multiply){
    currentOperator = 4;
    operatorStream.sink.add(data);
  }
  willOperateStream.sink.add(false);
}