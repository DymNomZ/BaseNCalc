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
  onChangeSign = false;
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
  }else if(currentOperator == 5){
    power();
  }else if(currentOperator == 6){
    modulo();
  }
  displayStream.sink.add(displayValue);
  firstValue = 0;
  secondValue = 0;
  willOperateStream.sink.add(false);
}

void convertDisplay(){
  String temp = '';
  if(displayValue.contains('-')){
    isNegative = true;
    temp = displayValue.replaceAll('-', '');
  }else{
    isNegative = false;
    temp = displayValue;
  }
  if(onHex){
    int decimalEquiv = int.parse(temp, radix: 16);
    displayHex = temp.toUpperCase();
    displayDec = decimalEquiv.toString();
    displayOct = decimalEquiv.toRadixString(8);
    displayBin = decimalEquiv.toRadixString(2);
  }else if(onDec){
    int decimalEquiv = int.parse(temp);
    displayHex = decimalEquiv.toRadixString(16).toUpperCase();
    displayDec = temp;
    displayOct = decimalEquiv.toRadixString(8);
    displayBin = decimalEquiv.toRadixString(2);
  }else if(onOct){
    int decimalEquiv = int.parse(temp, radix: 8);
    displayHex = decimalEquiv.toRadixString(16).toUpperCase();
    displayDec = decimalEquiv.toString();
    displayOct = temp;
    displayBin = decimalEquiv.toRadixString(2);
  }else{
    int decimalEquiv = int.parse(temp, radix: 2);
    displayHex = decimalEquiv.toRadixString(16).toUpperCase();
    displayDec = decimalEquiv.toString();
    displayOct = decimalEquiv.toRadixString(8);
    displayBin = temp;
  }
  //hexSeparator();
  //decimalSeparator();
  //octalSeparator();
  if(displayValue.contains('-')){
    displayHex = '-$displayHex';
    displayDec = '-$displayDec';
    displayOct = '-$displayOct';
    twosComplement();
  }else{
    binarySeparator();
  }
}

void resetBin(){
  int decimalEquiv = int.parse(displayDec, radix: 10);
  displayBin = decimalEquiv.toRadixString(2);
  binarySeparator();
  if(displayBin.contains('-')){
    displayBin = displayBin.replaceAll('-', '0');
    displayBin = '-$displayBin';
  }
  binaryStream.sink.add(0);
}

void onesComplement(){
  int decimalEquiv = 0;
  if(displayValue != '0'){
    if(displayValue.contains('-')){
      String temp = displayDec.replaceAll('-', '');
      decimalEquiv = int.parse(temp, radix: 10);
    }else{
      decimalEquiv = int.parse(displayDec, radix: 10);
    }
  }
  if(displayBin != '0000'){
    if(onOnes == false){
      displayBin = decimalEquiv.toRadixString(2);
      binarySeparator();
      displayBin = displayBin.replaceAll('0', 'a');
      displayBin = displayBin.replaceAll('1', '0');
      displayBin = displayBin.replaceAll('a', '1');
      onOnes = true;
      binaryStream.sink.add(1);
    }else{
      resetBin();
      if(displayBin.contains('-')){
        displayBin = displayBin.replaceAll('-', '0');
        displayBin = '-$displayBin';
      }
      onOnes = false;
    }
  }
}

void twosComplement(){
  int decimalEquiv = 0;
  if(displayValue != '0'){
    if(displayValue.contains('-')){
      String temp = displayDec.replaceAll('-', '');
      decimalEquiv = int.parse(temp, radix: 10);
    }else{
      decimalEquiv = int.parse(displayDec, radix: 10);
    }
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
      if(displayBin.contains('-')){
        displayBin = displayBin.replaceAll('-', '0');
        displayBin = '-$displayBin';
      }
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
        if(spaceCounter == 7){
        separatedBinary += '\n';
      }
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
    displayValue = (firstValue + secondValue).toRadixString(16).toUpperCase();
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
    displayValue = (firstValue - secondValue).toRadixString(16).toUpperCase();
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
    displayValue = (firstValue * secondValue).toRadixString(16).toUpperCase();
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
    displayValue = (firstValue ~/ secondValue).toRadixString(16).toUpperCase();
  }else if(onDec){
    displayValue = (firstValue ~/ secondValue).toString();
  }else if(onOct){
    displayValue = (firstValue ~/ secondValue).toRadixString(8);
  }else if(onBin){
    displayValue = (firstValue ~/ secondValue).toRadixString(2);
  }
}

void power(){
  int answer = 1;
  for(int i = 1; i <= secondValue; i++){
      answer *= firstValue;
    }
  if(onHex){
    displayValue = answer.toRadixString(16).toUpperCase();
  }else if(onDec){
    displayValue = answer.toString();
  }else if(onOct){
    displayValue = answer.toRadixString(8);
  }else if(onBin){
    displayValue = answer.toRadixString(2);
  }
}

void modulo(){
  if(firstValue < 0){
    moduloNegative = true;
    String temp = firstValue.toString();
    temp = temp.replaceAll('-', '');
    firstValue = int.parse(temp);
  }else{
    moduloNegative = false;
  }
  if(onHex){
    displayValue = (firstValue % secondValue).toRadixString(16).toUpperCase();
  }else if(onDec){
    displayValue = (firstValue % secondValue).toString();
  }else if(onOct){
    displayValue = (firstValue % secondValue).toRadixString(8);
  }else if(onBin){
    displayValue = (firstValue % secondValue).toRadixString(2);
  }
  if(moduloNegative){
    displayValue = '-$displayValue';
  }
}

void changeSign(){
  if(onChangeSign){
     int decimalEquiv = 0;
    if(onHex){
      decimalEquiv = int.parse(displayValue, radix: 16);
      displayValue = (decimalEquiv - (decimalEquiv * 2)).toRadixString(16).toUpperCase();
    }else if(onDec){
      decimalEquiv = int.parse(displayValue, radix: 10);
      displayValue = (decimalEquiv - (decimalEquiv * 2)).toString();
    }else if(onOct){
      decimalEquiv = int.parse(displayValue, radix: 8);
      displayValue = (decimalEquiv - (decimalEquiv * 2)).toRadixString(8);
    }else if(onBin){
      decimalEquiv = int.parse(displayValue, radix: 2);
      displayValue = (decimalEquiv - (decimalEquiv * 2)).toRadixString(2);
    }
    displayStream.sink.add(displayValue);
    willOperateStream.sink.add(false);
  }else{
    if(onTwos){
      onTwos = false;
    }
    displayValue = displayValue.replaceAll('-', '');
    displayStream.sink.add(displayValue);
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
  if(onHex){
    return false;
  }else if(onDec && notDec.contains(text)){
    return true;
  }else if(onOct && notOct.contains(text)){
    return true;
  }else if(onBin && notBin.contains(text)){
    return true;
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
  }else if(data == CupertinoIcons.multiply_square){
    currentOperator = 5;
    operatorStream.sink.add(data);
  }else if(data == CupertinoIcons.percent){
    currentOperator = 6;
    operatorStream.sink.add(data);
  }
  willOperateStream.sink.add(false);
}