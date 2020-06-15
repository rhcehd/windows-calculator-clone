import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: '표준'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = const MethodChannel('com.lhs94.calcflutter/calculate');

  String _input = '0';
  String _output = '';
  String _temp = '';
  String _operation = '';

  bool _initializeInput = false;
  bool _usedPercent = false;

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
    setState(() {
      _input = res;
    });
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
    setState(() {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: PopupMenuButton(itemBuilder: (BuildContext context) => <PopupMenuEntry<dynamic>> [
          const PopupMenuItem(
            child: Text('hello'),
            value: 3,
          ),
          PopupMenuItem(
            child: Text('non const'),
            value: 'hi',
          )
        ],
        onSelected: (dynamic) {
          //not implement yet
        },),
        title: Text(widget.title),
        actions: [
          MaterialButton(
            onPressed: () {
              //do nothing
            },
            child: Icon(
              Icons.history,
              color: Colors.white,),
          )
        ],
      ),


      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
                '$_output',
            ),
            Text(
              '$_input',
              textAlign: TextAlign.right,
              textScaleFactor: 5.0,
            ),
            Column(
              children: [
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonMinWidth: 50.0,
                  children: [
                    MaterialButton(
                      key: Key('MC'),
                      onPressed: () {
                        func('MC');
                      },
                      child: Text('MC'),
                    ),
                    MaterialButton(
                      onPressed: () {
                        func('MR');
                      },
                      child: Text('MR'),
                    ),
                    MaterialButton(
                      onPressed: () {
                        func('M＋');
                      },
                      child: Text('M＋'),
                    ),
                    MaterialButton(
                      onPressed: () {
                        func('M－');
                      },
                      child: Text('M－'),
                    ),
                    MaterialButton(
                      onPressed: () {
                        func('MS');
                      },
                      child: Text('MS'),
                    ),
                    MaterialButton(
                      onPressed: () {
                        func('Mˇ');
                      },
                      child: Text('Mˇ'),
                    ),
                  ],
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        func('%');
                      },
                      child: Text('%'),
                    ),
                    MaterialButton(
                      onPressed: () {
                        func('CE');
                      },
                      child: Text('CE'),
                    ),
                    MaterialButton(
                      onPressed: () {
                        func('C');
                      },
                      child: Text('C'),
                    ),
                    MaterialButton(
                      onPressed: () {
                        func('Back');
                      },
                      child: Icon(Icons.backspace),
                    ),
                  ],
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        func('1/x');
                      },
                      child: Text('1/x'),
                    ),
                    MaterialButton(
                      onPressed: () {
                        func('x²');
                      },
                      child: Text('x²'),
                    ),
                    MaterialButton(
                      onPressed: () {
                        func('²√x');
                      },
                      child: Text('²√x'),
                    ),
                    MaterialButton(
                      onPressed: () {
                        func('÷');
                      },
                      child: Text('÷'),
                    ),
                  ],
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        func('7');
                      },
                      child: Text('7'),
                    ),
                    MaterialButton(
                      onPressed: () {
                        func('8');
                      },
                      child: Text('8'),
                    ),
                    MaterialButton(
                      onPressed: () {
                        func('9');
                      },
                      child: Text('9'),
                    ),
                    MaterialButton(
                      onPressed: () {
                        func('×');
                      },
                      child: Text('×'),
                    ),
                  ],
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        func('4');
                      },
                      child: Text('4'),
                    ),
                    MaterialButton(
                      onPressed: () {
                        func('5');
                      },
                      child: Text('5'),
                    ),
                    MaterialButton(
                      onPressed: () {
                        func('6');
                      },
                      child: Text('6'),
                    ),
                    MaterialButton(
                      onPressed: () {
                        func('-');
                      },
                      child: Text('-'),
                    ),
                  ],
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          func('1');
                        });
                      },
                      child: Text('1'),
                    ),
                    MaterialButton(
                      onPressed: () {
                        func('2');
                      },
                      child: Text('2'),
                    ),
                    MaterialButton(
                      onPressed: () {
                        func('3');
                      },
                      child: Text('3'),
                    ),
                    MaterialButton(
                      onPressed: () {
                        func('+');
                      },
                      child: Text('+'),
                    ),
                  ],
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        func('＋/－');
                      },
                      child: Text('＋/－'),
                    ),
                    MaterialButton(
                      onPressed: () {
                        func('0');
                      },
                      child: Text('0'),
                    ),
                    MaterialButton(
                      onPressed: () {
                        func('.');
                      },
                      child: Text('.'),
                    ),
                    MaterialButton(
                      onPressed: () {
                        func('=');
                      },
                      child: Text('='),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
