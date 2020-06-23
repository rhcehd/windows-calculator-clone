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

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    const double appBarHeight = 50;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromARGB(255, 183, 183, 183),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: statusBarHeight),
              child: Container(
                height: appBarHeight,
                child: Row(
                  children: [
                    Container(
                      width: appBarHeight,
                      height: appBarHeight,
                      child: IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          print('i m pressed!');
                        },
                      )
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          '표준',
                          textScaleFactor: 1.7,
                        ),
                      ),
                    ),
                    Container(
                      width: appBarHeight,
                      height: appBarHeight,
                      child: IconButton(
                        icon: Icon(Icons.history),
                        onPressed: () {
                          print('i m pressed!!');
                        },
                      )
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: StandardBody(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
