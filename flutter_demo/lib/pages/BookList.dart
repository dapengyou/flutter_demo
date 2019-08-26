import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo/models/Animate.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;


class BookList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BookListState();
  }
}

//AutomaticKeepAliveClientMixin  Flutter切换tab后保留tab状态
class BookListState extends State<BookList> with AutomaticKeepAliveClientMixin{
  List movies;


  Future getMovies() async {
    String url = "http://renyugang.io/api/read.php?action=list";
    url += '&q=Android&page=1&page_size=10';

    final response = await http.get(url);

    if (response.statusCode == 200) {
      List data = json.decode(response.body)['data'];
      setState(() {
        movies = data.map((json) => Animate.fromJson(json)).toList();
      });
    } else {
      print("err code $response.statusCode");
    }
  }


  @override
  void initState() {
    super.initState();
    getMovies();
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
        body: Container(
          child: movies==null?Center(child: CircularProgressIndicator()):
              Padding(padding: EdgeInsets.symmetric(horizontal: 6.0,vertical: 10.0),
              child: ListView.builder(itemCount: movies.length,
              itemBuilder: (BuildContext context, int index){
                return AnimateCard(movies[index]);
              },
              ),
              )
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}

class AnimateCard extends StatelessWidget {
  Animate animate;

  AnimateCard(this.animate);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Fluttertoast.showToast(msg: animate.name);

        },
        child: ListTile(
          contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image(
                  image: NetworkImage(animate.image),
                  width: 45.0,
                  height: 45.0),
            ],
          ),
          title: Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Text(
              animate.name,
              maxLines: 2,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.deepPurple, fontSize: 16.0),
            ),
          ),
          subtitle: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Text(
                  "id号:",
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Text(
                  animate.id.toString(),
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
