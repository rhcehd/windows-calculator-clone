import 'package:calcflutter/calculator.dart';
import 'package:flutter/material.dart';

class StandardBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StandardBodyState();
}

class StandardBodyState extends State<StandardBody> {

  static final Calculator _calc = Calculator();
  final EdgeInsets _padding = EdgeInsets.all(1.5);

  Widget createBtn(String btnText, double btnWidth, double btnHeigth, Color btnColor) {
    return Container(
      width: btnWidth,
      height: btnHeigth,
      child: Padding(
        padding: _padding,
        child: Container(
          color: btnColor,
          child: MaterialButton(
            onPressed: () {
              setState(() {
                _calc.func(btnText);
              });
            },
            child: Text(btnText),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width - _padding.horizontal;
    double heigth = size.height - _padding.vertical;

    double button_6_width = width / 6;
    double button_4_width = width / 4;
    double row_height = heigth / 11;
    double row_height2 = row_height * 0.6;

    Color backGround = Color.fromARGB(255, 183, 183, 183);
    Color btnNumber = Color.fromARGB(255, 241, 241, 241);
    Color btnEqual = Color.fromARGB(255, 100, 158, 196);
    Color btnMemory = Color.fromARGB(255, 183, 183, 183);
    Color btnOperation = Color.fromARGB(255, 211, 211, 211);

    return Container(
        color: backGround,
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

            Padding(
              padding: _padding,
              child: Column(
                children: [
                  Row(
                    children: [
                      createBtn('MC', button_6_width, row_height2, btnMemory),
                      createBtn('MR', button_6_width, row_height2, btnMemory),
                      createBtn('M＋', button_6_width, row_height2, btnMemory),
                      createBtn('M－', button_6_width, row_height2, btnMemory),
                      createBtn('MS', button_6_width, row_height2, btnMemory),
                      createBtn('Mˇ', button_6_width, row_height2, btnMemory),
                    ],
                  ),

                  Row(
                    children: [
                      createBtn('%', button_4_width, row_height, btnOperation),
                      createBtn('CE', button_4_width, row_height, btnOperation),
                      createBtn('C', button_4_width, row_height, btnOperation),
                      createBtn('Back', button_4_width, row_height, btnOperation),
                    ],
                  ),

                  Row(
                    children: [
                      createBtn('1/x', button_4_width, row_height, btnOperation),
                      createBtn('x²', button_4_width, row_height, btnOperation),
                      createBtn('²√x', button_4_width, row_height, btnOperation),
                      createBtn('÷', button_4_width, row_height, btnOperation),
                    ],
                  ),

                  Row(
                    children: [
                      createBtn('7', button_4_width, row_height, btnNumber),
                      createBtn('8', button_4_width, row_height, btnNumber),
                      createBtn('9', button_4_width, row_height, btnNumber),
                      createBtn('×', button_4_width, row_height, btnOperation),
                    ],
                  ),

                  Row(
                    children: [
                      createBtn('4', button_4_width, row_height, btnNumber),
                      createBtn('5', button_4_width, row_height, btnNumber),
                      createBtn('6', button_4_width, row_height, btnNumber),
                      createBtn('-', button_4_width, row_height, btnOperation),
                    ],
                  ),

                  Row(
                    children: [
                      createBtn('1', button_4_width, row_height, btnNumber),
                      createBtn('2', button_4_width, row_height, btnNumber),
                      createBtn('3', button_4_width, row_height, btnNumber),
                      createBtn('+', button_4_width, row_height, btnOperation),
                    ],
                  ),

                  Row(
                    children: [
                      createBtn('＋/－', button_4_width, row_height, btnNumber),
                      createBtn('0', button_4_width, row_height, btnNumber),
                      createBtn('.', button_4_width, row_height, btnNumber),
                      createBtn('=', button_4_width, row_height, btnEqual),
                    ],
                  ),

                ],
              ),
            ),
          ],
        )
    );
  }

}