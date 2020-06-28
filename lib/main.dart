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
      home: CalcMain(title: '표준'),
    );
  }
}

class CalcMain extends StatefulWidget {
  CalcMain({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _CalcMainState createState() => _CalcMainState();
}

class _CalcMainState extends State<CalcMain> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CalcColor.background,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        actionsIconTheme: IconThemeData(color: Colors.black),
        title: Text(
          '표준',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              //Scaffold.of(context).openDrawer();
              _showHistory();
            },
          )
        ],
      ),

      drawer: _createCalcMenu(),
      drawerScrimColor: Colors.transparent,

      body: StandardBody()
    );

  }

  Widget _createCalcMenu() {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Padding(
        padding: EdgeInsets.only(top: statusBarHeight),
        child: Drawer(
          elevation: 0.5,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: CalcColor.background,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          '계산기',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      _createCalcMenuButton(Icons.adb, 'test'),
                      _createCalcMenuButton(Icons.adb, 'test'),
                      _createCalcMenuButton(Icons.adb, 'test'),
                      _createCalcMenuButton(Icons.adb, 'test'),
                      _createCalcMenuButton(Icons.adb, 'test'),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          '변환기',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      _createCalcMenuButton(Icons.adb, 'test'),
                      _createCalcMenuButton(Icons.adb, 'test'),
                      _createCalcMenuButton(Icons.adb, 'test'),
                      _createCalcMenuButton(Icons.adb, 'test'),
                      _createCalcMenuButton(Icons.adb, 'test'),
                      _createCalcMenuButton(Icons.adb, 'test'),
                      _createCalcMenuButton(Icons.adb, 'test'),
                      _createCalcMenuButton(Icons.adb, 'test'),
                      _createCalcMenuButton(Icons.adb, 'test'),
                      _createCalcMenuButton(Icons.adb, 'test'),
                      _createCalcMenuButton(Icons.adb, 'test'),
                    ],
                  ),
                ),

                Container(
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {
                      print('i m pressed!!');
                    },
                    child: Row(
                      children: [
                        Icon(Icons.info_outline),
                        Text('정보')
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

  Widget _createCalcMenuButton(IconData icon, String buttonText) {
    return MaterialButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Row(
        children: [
          Icon(icon),
          Text(buttonText),
        ],
      ),
    );
  }

  void _showHistory() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                constraints: BoxConstraints.tight(Size.infinite),
                color: CalcColor.background,
                child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: _createHistory(setState),
                ),
              );
            },
          );
        });
  }

  Widget _createHistory(StateSetter setState) {
    return Container(
      constraints: BoxConstraints.tight(Size.infinite),
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(maxHeight: 300),
            height: CalcHistory.isEmpty() ? double.infinity : 0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '아직 기록이 없음',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints.loose(Size.infinite),
            height: CalcHistory.isNotEmpty() ? 350 : 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  constraints: BoxConstraints.loose(Size(double.infinity, 300)),
                  child: ListView.builder(
                    itemBuilder: _createHistoryItem,
                    itemCount: CalcHistory.length(),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Material(
                    color: CalcColor.background,
                    child: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          CalcHistory.clear();
                          print('clear!!');
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );

  }

  Widget _createHistoryItem(BuildContext context, int index) {
    History history = CalcHistory.indexOf(index);

    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: MaterialButton(
          onPressed: () {
            print('i m pressed!!');
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                children: [
                  Text(
                    history.output,
                  ),
                  Text(
                    history.input,
                    textScaleFactor: 1.7,
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
