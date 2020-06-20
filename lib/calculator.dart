import 'package:flutter/services.dart';

class Calculator {

  static const platform = const MethodChannel('com.lhs94.calcflutter/calculate');

  String _input = '0';
  String _output = '';
  String _temp = '';
  String _operation = '';

  bool _initializeInput = false;
  bool _usedPercent = false;

  String getInput() => _input;
  String getOutput() => _output;

  Future<void> _calculate(String s) async {
    dynamic res;
    String arg = s.replaceAll('×', '*').replaceAll('÷', '/');
    //String arg = '123';
    print('calc_input : $arg');
    if(arg.isEmpty) {
      print('empty!!');
      return;
    }
    try {
      final dynamic result = await platform.invokeMethod('calculate', {'calc' : arg});
      res = result;
    } on PlatformException catch(e) {
      print(e.message);
    }
    print('calc_output : $res');

    _input = res;
  }

  bool _endsWithOperation(String s) {
    return s.endsWith('+') || s.endsWith('-') || s.endsWith('÷') || s.endsWith('×') ? true : false;
  }

  bool _endsWithEqual(String s) {
    return s.endsWith('=') ? true : false;
  }

  bool _hasOperation(String s) {
    return s.contains('+') || s.contains('-') || s.contains('÷') || s.contains('×') ? true : false;
  }

  void func(String d) {
    switch(d) {
      case 'MC':
      case 'MR':
      case 'M＋':
      case 'M－':
      case 'MS':
      case 'Mˇ':
      case '%'://todo: not implement yet
      if(true)
        break;
      _usedPercent = true;
      _calculate(_output.substring(0, _output.length - 1) + '*0.01*' + _input);
      //num a = num.parse(_temp) * num.parse(_input) * 0.01;
      //_input = a.toString();
      if(_input.endsWith('.0')) {
        _input = _input.substring(0, _input.length - 2);
      }
      _output += _input;
      break;

      case 'CE':
        if(_endsWithEqual(_output)) {
          _output = '';
        }
        _input = '0';
        break;

      case 'C':
        _input = '0';
        _output = '';
        _temp = '';
        _operation = '';
        break;

      case 'Back':
        if(_endsWithEqual(_output)) {
          if(_hasOperation(_output)) {
            _output = '';
          }
          else {
            //do nothing
          }
          break;
        }
        _input = _input.substring(0, _input.length - 1);
        if(_input.length == 0) {
          _input = '0';
        }
        break;

      case '1/x':
      case 'x²':
      case '²√x':
      break;

      case '÷':
      case '×':
      case '-':
      case '+':
      if(_temp.isEmpty) {
        _temp = _input;
      }
      if(_endsWithEqual(_output)) {
        _output = '';
      }
      if(_endsWithOperation(_output)) {
        _output = _output.substring(0, _output.length - 1) + d;
        break;
      }
      _initializeInput = true;

      _operation = d;

      _output = _output + _input;
      _calculate(_output);
      _output += d;
      break;

      case '=':
        if(_usedPercent) {
          _output = _output.substring(0, _output.length - _input.length);
          _temp = _input;
          _usedPercent = false;
        }
        if(_temp.isEmpty) {
          _temp = _input;
        }
        if(_endsWithEqual(_output) || _output.isEmpty) {
          _output = _input;
        }
        if(_hasOperation(_output)) {
          _output += _input;
        }
        else {
          _output += _operation + _temp;
        }
        _initializeInput = false;

        _calculate(_output);
        _output += '=';
        break;

      case '＋/－':
        break;

      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case '0':
      if(_endsWithEqual(_output)) {
        _input = '';
        _output = '';
      }
      if(_initializeInput) {
        _input = '';
        _initializeInput = false;
      }
      if(_input == '0' && d == '0') {
        //do nothing
        break;
      }
      if(_input == '0')
        _input = '';
      if(_temp.isNotEmpty) {
        _temp = '';
      }

      _input += d;
      break;

      case '.':
        if(_input.contains('.')) {
          //do nothing
          break;
        }
        _input += d;
        break;
    }
  }
}