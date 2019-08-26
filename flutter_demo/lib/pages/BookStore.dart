import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/models/Animate.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;

import 'BookList.dart';

class BookStore extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BookStoreState();
  }
}

class BookStoreState extends State<BookStore>
    with SingleTickerProviderStateMixin {
  final List<Tab> titleTabs = <Tab>[
    Tab(
      text: '本地list',
    ),
    Tab(
      text: '网络获取',
    ),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
        vsync: this, //动画效果的异步处理，默认格式，背下来即可
        length: 2 //需要控制的Tab页数量
    );
//    getMovies();
  }

  //当整个页面dispose时，记得把控制器也dispose掉，释放内存
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //创建list数据源
  final items = List.generate(20, (index) => "本地$index");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: AppBar(
          title: TabBar(
            tabs: titleTabs,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            controller: _tabController,
            isScrollable: true,
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(style: BorderStyle.none)),
          ),
        ),
        body: Container(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
          new ListView.builder(
          itemCount: items.length,
            itemExtent: 90,
            itemBuilder: (context, index) {
//                  return new ListTile(
//                    title: new Text('${items[index]}'),
//                  );
              return GestureDetector(
                onTap: () {
                  Fluttertoast.showToast(msg: '点击了${items[index]}');
                },
                child: new Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                  ),
                  child: Text('${items[index]}'),
                ),
              );
            },
          ),

          new BookList(),
          ],
        ),
      ),
    ),);
  }
}
