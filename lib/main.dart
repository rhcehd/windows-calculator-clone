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

      body: StandardBody()

    );
  }
}
