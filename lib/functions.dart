import 'package:base_n_calculator/variables.dart';
import 'package:flutter/cupertino.dart';

void compute(){
  if(toAdd){
    displayValue = (firstDec + secondDec).toString();
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

void delete(String data){
  if(displayValue.length <= 1){
    displayValue = '0';
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
  }else if(mode == 2){
    onHex = false;
    onDec = true;
    onOct = false;
    onBin = false;
  }else if(mode == 3){
    onHex = false;
    onDec = false;
    onOct = true;
    onBin = false;
  }else if(mode == 4){
    onHex = false;
    onDec = false;
    onOct = false;
    onBin = true;
  }
  baseNCardStream.sink.add(mode);
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

void determineIfActivated(IconData? data){
  if(data != null){
      if(data == CupertinoIcons.add){
      toAdd = true;
      toMinus = false;
      toMultiply = false;
      toDivide = false;
      activatedStream.sink.add(data);
    }else if(data == CupertinoIcons.minus){
      toAdd = false;
      toMinus = true;
      toMultiply = false;
      toDivide = false;
      activatedStream.sink.add(data);
    }else if(data == CupertinoIcons.multiply){
      toAdd = false;
      toMinus = false;
      toMultiply = true;
      toDivide = false;
      activatedStream.sink.add(data);
    }else if(data == CupertinoIcons.divide){
      toAdd = false;
      toMinus = false;
      toMultiply = false;
      toDivide = true;
      activatedStream.sink.add(data);
    }
  }
  activatedStream.sink.add(data!);
}

int determineOperator(IconData? data){
  if(data == CupertinoIcons.add){
    return 1;
  }else if(data == CupertinoIcons.minus){
    return 2;
  }else if(data == CupertinoIcons.multiply){
    return 3;
  }else if(data == CupertinoIcons.divide){
    return 4;
  }
  return 0;
}