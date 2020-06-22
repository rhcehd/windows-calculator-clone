import 'package:calcflutter/calculator.dart';
import 'package:flutter/material.dart';

class StandardBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StandardBodyState();
}

class StandardBodyState extends State<StandardBody> {

  static final Calculator _calc = Calculator();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double heigth = size.height;

    double button_6_width = width / 6;
    double button_4_width = width / 4;
    double row_height = heigth / 11;

    return Container(
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
                Row(
                  children: [
                    Container(
                      width: button_6_width,
                      height: row_height,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            _calc.func('MC');
                          });
                        },
                        child: Text('MC'),
                      ),
                    ),
                    Container(
                      width: button_6_width,
                      height: row_height,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            _calc.func('MR');
                          });
                        },
                        child: Text('MR'),
                      ),
                    ),
                    Container(
                      width: button_6_width,
                      height: row_height,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            _calc.func('M＋');
                          });
                        },
                        child: Text('M＋'),
                      ),
                    ),
                    Container(
                      width: button_6_width,
                      height: row_height,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            _calc.func('M－');
                          });
                        },
                        child: Text('M－'),
                      ),
                    ),
                    Container(
                      width: button_6_width,
                      height: row_height,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            _calc.func('MS');
                          });
                        },
                        child: Text('MS'),
                      ),
                    ),
                    Container(
                      width: button_6_width,
                      height: row_height,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            _calc.func('Mˇ');
                          });
                        },
                        child: Text('Mˇ'),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Container(
                      width: button_4_width,
                      height: row_height,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            _calc.func('%');
                          });
                        },
                        child: Text('%'),
                      ),
                    ),
                    Container(
                      width: button_4_width,
                      height: row_height,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            _calc.func('CE');
                          });
                        },
                        child: Text('CE'),
                      ),
                    ),
                    Container(
                      width: button_4_width,
                      height: row_height,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            _calc.func('C');
                          });
                        },
                        child: Text('C'),
                      ),
                    ),
                    Container(
                      width: button_4_width,
                      height: row_height,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            _calc.func('Back');
                          });
                        },
                        child: Icon(Icons.backspace),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Container(
                      width: button_4_width,
                      height: row_height,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            _calc.func('1/x');
                          });
                        },
                        child: Text('1/x'),
                      ),
                    ),
                    Container(
                      width: button_4_width,
                      height: row_height,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            _calc.func('x²');
                          });
                        },
                        child: Text('x²'),
                      ),
                    ),
                    Container(
                      width: button_4_width,
                      height: row_height,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            _calc.func('²√x');
                          });
                        },
                        child: Text('²√x'),
                      ),
                    ),
                    Container(
                      width: button_4_width,
                      height: row_height,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            _calc.func('÷');
                          });
                        },
                        child: Text('÷'),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Container(
                      width: button_4_width,
                      height: row_height,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            _calc.func('7');
                          });
                        },
                        child: Text('7'),
                      ),
                    ),
                    Container(
                      width: button_4_width,
                      height: row_height,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            _calc.func('8');
                          });
                        },
                        child: Text('8'),
                      ),
                    ),
                    Container(
                      width: button_4_width,
                      height: row_height,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            _calc.func('9');
                          });
                        },
                        child: Text('9'),
                      ),
                    ),
                    Container(
                      width: button_4_width,
                      height: row_height,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            _calc.func('×');
                          });
                        },
                        child: Text('×'),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Container(
                      width: button_4_width,
                      height: row_height,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            _calc.func('4');
                          });
                        },
                        child: Text('4'),
                      ),
                    ),
                    Container(
                      width: button_4_width,
                      height: row_height,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            _calc.func('5');
                          });
                        },
                        child: Text('5'),
                      ),
                    ),
                    Container(
                      width: button_4_width,
                      height: row_height,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            _calc.func('6');
                          });
                        },
                        child: Text('6'),
                      ),
                    ),
                    Container(
                      width: button_4_width,
                      height: row_height,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            _calc.func('-');
                          });
                        },
                        child: Text('-'),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Container(
                      width: button_4_width,
                      height: row_height,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            _calc.func('1');
                          });
                        },
                        child: Text('1'),
                      ),
                    ),
                    Container(
                      width: button_4_width,
                      height: row_height,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            _calc.func('2');
                          });
                        },
                        child: Text('2'),
                      ),
                    ),
                    Container(
                      width: button_4_width,
                      height: row_height,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            _calc.func('3');
                          });
                        },
                        child: Text('3'),
                      ),
                    ),
                    Container(
                      width: button_4_width,
                      height: row_height,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            _calc.func('+');
                          });
                        },
                        child: Text('+'),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Container(
                      width: button_4_width,
                      height: row_height,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            _calc.func('＋/－');
                          });
                        },
                        child: Text('＋/－'),
                      ),
                    ),
                    Container(
                      width: button_4_width,
                      height: row_height,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            _calc.func('0');
                          });
                        },
                        child: Text('0'),
                      ),
                    ),
                    Container(
                      width: button_4_width,
                      height: row_height,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            _calc.func('.');
                          });
                        },
                        child: Text('.'),
                      ),
                    ),
                    Container(
                      width: button_4_width,
                      height: row_height,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            _calc.func('=');
                          });
                        },
                        child: Text('='),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        )
    );
  }

}