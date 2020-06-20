import 'package:calcflutter/calculator.dart';
import 'package:flutter/material.dart';

class StandardBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StandardBodyState();
}

class StandardBodyState extends State<StandardBody> {

  static final Calculator _calc = Calculator();

  @override
  Widget build(BuildContext context) => Container(
      color: Color.fromARGB(100, 184, 184, 184),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 15, 0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Text(
                    _calc.getOutput(),
                    textAlign: TextAlign.right,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 100,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: FittedBox(
                      child: Text(
                        _calc.getInput(),
                        maxLines: 1,
                        textAlign: TextAlign.right,
                        textScaleFactor: 5.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonMinWidth: 50.0,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _calc.func('MC');
                      });
                    },
                    child: Text('MC'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _calc.func('MR');
                      });
                    },
                    child: Text('MR'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _calc.func('M＋');
                      });
                    },
                    child: Text('M＋'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _calc.func('M－');
                      });
                    },
                    child: Text('M－'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _calc.func('MS');
                      });
                    },
                    child: Text('MS'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _calc.func('Mˇ');
                      });
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
                      setState(() {
                        _calc.func('%');
                      });
                    },
                    child: Text('%'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _calc.func('CE');
                      });
                    },
                    child: Text('CE'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _calc.func('C');
                      });
                    },
                    child: Text('C'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _calc.func('Back');
                      });
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
                      setState(() {
                        _calc.func('1/x');
                      });
                    },
                    child: Text('1/x'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _calc.func('x²');
                      });
                    },
                    child: Text('x²'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _calc.func('²√x');
                      });
                    },
                    child: Text('²√x'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _calc.func('÷');
                      });
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
                      setState(() {
                        _calc.func('7');
                      });
                    },
                    child: Text('7'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _calc.func('8');
                      });
                    },
                    child: Text('8'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _calc.func('9');
                      });
                    },
                    child: Text('9'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _calc.func('×');
                      });
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
                      setState(() {
                        _calc.func('4');
                      });
                    },
                    child: Text('4'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _calc.func('5');
                      });
                    },
                    child: Text('5'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _calc.func('6');
                      });
                    },
                    child: Text('6'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _calc.func('-');
                      });
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
                        _calc.func('1');
                      });
                    },
                    child: Text('1'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _calc.func('2');
                      });
                    },
                    child: Text('2'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _calc.func('3');
                      });
                    },
                    child: Text('3'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _calc.func('+');
                      });
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
                      setState(() {
                        _calc.func('＋/－');
                      });
                    },
                    child: Text('＋/－'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _calc.func('0');
                      });
                    },
                    child: Text('0'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _calc.func('.');
                      });
                    },
                    child: Text('.'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _calc.func('=');
                      });
                    },
                    child: Text('='),
                  ),
                ],
              ),
            ],
          ),
        ],
      )
  );

}