import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/BookStore.dart';
import 'package:flutter_demo/pages/MyInfoPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _tabIndex = 0;

  /*
    两个数组
    */
  var _bodys;
  var tabImages;

  var appBarTitles = ['首页', '我的'];

  /*
     * 根据image路径获取图片
     * 这个图片的路径需要在 pubspec.yaml 中去定义
     */
  Image getTabImage(path) {
    return new Image.asset(path, width: 20.0, height: 20.0);
  }

  /*
   * 根据索引获得对应的normal或是press的icon
   */
  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][0];
    }
    return tabImages[curIndex][1];
  }

  /*
    获取bottomTab的颜色和文字
     */
  Text getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(color: Colors.lightBlueAccent));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(color: const Color(0xff888888)));
    }
  }

  void initData() {
    if (tabImages == null) {
      tabImages = [
        [
          getTabImage('images/icon_home.png'),
          getTabImage('images/icon_home_default.png')
        ],
        [
          getTabImage('images/icon_my.png'),
          getTabImage('images/icon_my_default.png')
        ]
      ];
    }
    _bodys = [new BookStore(), new MyInfoPage()];
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("主页"),
      ),
      body: _bodys[_tabIndex],
      backgroundColor: Colors.blueGrey,
      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: getTabIcon(0), title: getTabTitle(0)),
          new BottomNavigationBarItem(
              icon: getTabIcon(1), title: getTabTitle(1)),
        ],
        //设置显示的模式
        type: BottomNavigationBarType.fixed,
        //设置当前的索引
        currentIndex: _tabIndex,
        //tabBottom的点击监听
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }
}
