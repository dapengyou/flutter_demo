import 'package:flutter/material.dart';
import 'package:flutter_app/pages/RegisterPage.dart';
import 'package:fluttertoast/fluttertoast.dart';

//void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  //所填账户信息字符串
  var _str_account = '';

  //所填密码信息字符串
  var _str_pass = '';

  //文本编辑控制器 可用于监听文本内容的改变
  TextEditingController accountController = new TextEditingController();
  TextEditingController passController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.red), //设置主题颜色
      home: new Scaffold(
        appBar: AppBar(
          title: Text('登录'),
          leading: IconButton(
              icon: BackButtonIcon(), //图片
              onPressed: () {
                //点击后的结果，用了一个匿名方法
                Navigator.pop(context);
              }),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            //垂直布局
            children: <Widget>[
              Container(
                child: TextField(
                  controller: accountController,
                  decoration: InputDecoration(hintText: '请输入电话号码'), //设置提示语
                  keyboardType: TextInputType.phone, //设置键盘类型
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                child: TextField(
                  controller: passController,
                  decoration: InputDecoration(hintText: '请输入密码'),
                  obscureText: true,
                ),
              ),
//              监听text点击事件
              InkWell(
                onTap: () {
//                  Navigator.of(context).push(
//                      MaterialPageRoute(builder: (BuildContext context) => RegisterPage()));
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                              new RegisterPage()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 8.0),
                  child: Text(
                    '立即注册',
                    style: TextStyle(
                        color: Colors.black,
                        //设置下划线
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: FlatButton(
                  color: Colors.cyan[100],
                  onPressed: () {
                    _str_account = accountController.text;
                    _str_pass = passController.text;
                    localLogin(_str_account, _str_pass);
                  },
                  child: Text(
                    '登录',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void localLogin(String str_account, String str_pass) {
    if (str_account.trim() == '') {
      Fluttertoast.showToast(msg: '手机号不能为空');
      return;
    }
    if (str_pass.trim() == '') {
      Fluttertoast.showToast(msg: '密码不能为空');
      return;
    }

    if (str_pass == '123456') {
      Fluttertoast.showToast(msg: '登录成功');
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new RegisterPage()));
    } else {
      Fluttertoast.showToast(msg: '密码错误');
    }
  }
}
