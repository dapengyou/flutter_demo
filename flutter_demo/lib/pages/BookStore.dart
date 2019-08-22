import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

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
  }

  //当整个页面dispose时，记得把控制器也dispose掉，释放内存
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


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
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
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
              ListView(
                itemExtent: 60,
                children: List.generate(20, (index) {
                  return new Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                    ),
                    child: Text("本地${index}"),
                  );
                }),
              ),
              Center(child: Text('网络获取')),
            ],
          ),
        ),
      ),
    );
  }
}
