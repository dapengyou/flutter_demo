import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class MyInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MyInfoPageState();
  }
}

class MyInfoPageState extends State<MyInfoPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        body: new Center(child: new Text("myinfo")),
      ),
    );
  }
}
