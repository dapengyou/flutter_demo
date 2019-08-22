import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  var phone = '';
  var nickName = '';
  var password = '';
  File imagePath;

  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _nickNameController = new TextEditingController();
  TextEditingController _passWordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      theme: ThemeData(primaryColor: Colors.red),
      home: Scaffold(
        body: bodyPage(),
      ),
    );
  }

  Widget bodyPage() {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          //头像点击
          GestureDetector(
            onTap: () {
              getImage();
            },
            child: Container(
              child: imagePath == null
                  ? CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 50.0,
                    )
                  : CircleAvatar(
                      backgroundImage: new FileImage(imagePath),
                      backgroundColor: Colors.white,
                      radius: 50.0,
                    ),
            ),
          ),
          //昵称
          Container(
            child: TextField(
              controller: _nickNameController,
              decoration: InputDecoration(hintText: '请输入昵称'),
            ),
          ),
          //电话号码
          Container(
            child: TextField(
              controller: _phoneController,
              decoration: InputDecoration(hintText: '请输入电话号码'), //设置提示语
              keyboardType: TextInputType.phone, //设置键盘类型
            ),
          ),
          //密码
          Container(
            margin: EdgeInsets.only(top: 8.0),
            child: TextField(
              controller: _passWordController,
              decoration: InputDecoration(hintText: '请输入密码'),
              obscureText: true,
            ),
          ),
          //注册按钮
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: FlatButton(
              color: Colors.cyan[100],
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                '立即注册',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      imagePath = image;
    });
  }
}
