import 'package:calcflutter/calc_color.dart';
import 'package:calcflutter/calculator.dart';
import 'package:flutter/material.dart';

class StandardBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StandardBodyState();
}

class StandardBodyState extends State<StandardBody> {

  static final Calculator _calc = Calculator();
  final EdgeInsets _padding = EdgeInsets.all(1.5);

  Widget createBtn(String btnText, double btnWidth, double btnHeigth, Color btnColor, {IconData icon}) {
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
            child: icon == null ? Text(btnText) : Icon(icon),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width - _padding.horizontal;
    double height = size.height - _padding.vertical;

    double button_6_width = width / 6;
    double button_4_width = width / 4;
    double row_height = height / 11;
    double row_height2 = row_height * 0.6;

    return Container(
        color: CalcColor.background,
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
                      createBtn('MC', button_6_width, row_height2, CalcColor.btnMemory),
                      createBtn('MR', button_6_width, row_height2, CalcColor.btnMemory),
                      createBtn('M＋', button_6_width, row_height2, CalcColor.btnMemory),
                      createBtn('M－', button_6_width, row_height2, CalcColor.btnMemory),
                      createBtn('MS', button_6_width, row_height2, CalcColor.btnMemory),
                      createBtn('Mˇ', button_6_width, row_height2, CalcColor.btnMemory),
                    ],
                  ),

                  Row(
                    children: [
                      createBtn('%', button_4_width, row_height, CalcColor.btnOperation),
                      createBtn('CE', button_4_width, row_height, CalcColor.btnOperation),
                      createBtn('C', button_4_width, row_height, CalcColor.btnOperation),
                      createBtn('Back', button_4_width, row_height, CalcColor.btnOperation, icon: Icons.backspace),
                    ],
                  ),

                  Row(
                    children: [
                      createBtn('1/x', button_4_width, row_height, CalcColor.btnOperation),
                      createBtn('x²', button_4_width, row_height, CalcColor.btnOperation),
                      createBtn('²√x', button_4_width, row_height, CalcColor.btnOperation),
                      createBtn('÷', button_4_width, row_height, CalcColor.btnOperation),
                    ],
                  ),

                  Row(
                    children: [
                      createBtn('7', button_4_width, row_height, CalcColor.btnNumber),
                      createBtn('8', button_4_width, row_height, CalcColor.btnNumber),
                      createBtn('9', button_4_width, row_height, CalcColor.btnNumber),
                      createBtn('×', button_4_width, row_height, CalcColor.btnOperation),
                    ],
                  ),

                  Row(
                    children: [
                      createBtn('4', button_4_width, row_height, CalcColor.btnNumber),
                      createBtn('5', button_4_width, row_height, CalcColor.btnNumber),
                      createBtn('6', button_4_width, row_height, CalcColor.btnNumber),
                      createBtn('-', button_4_width, row_height, CalcColor.btnOperation),
                    ],
                  ),

                  Row(
                    children: [
                      createBtn('1', button_4_width, row_height, CalcColor.btnNumber),
                      createBtn('2', button_4_width, row_height, CalcColor.btnNumber),
                      createBtn('3', button_4_width, row_height, CalcColor.btnNumber),
                      createBtn('+', button_4_width, row_height, CalcColor.btnOperation),
                    ],
                  ),

                  Row(
                    children: [
                      createBtn('＋/－', button_4_width, row_height, CalcColor.btnNumber),
                      createBtn('0', button_4_width, row_height, CalcColor.btnNumber),
                      createBtn('.', button_4_width, row_height, CalcColor.btnNumber),
                      createBtn('=', button_4_width, row_height, CalcColor.btnEqual),
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