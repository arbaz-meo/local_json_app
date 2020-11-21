import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main()
{
  runApp(new MaterialApp(
    theme: new ThemeData(
      primarySwatch: Colors.green
    ),
    home: new homepage(),
  ));
}
class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List data;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("json data"),
        centerTitle: true,
      ),
      body: new Container(
        child: new Center(
          child: new FutureBuilder(
            future: DefaultAssetBundle
                .of(context)
                .loadString('load_json/data.json'),
            builder: (context,snapshot) {
              var mydata = json.decode(snapshot.data.toString());
              return new ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return new Card(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          new Text("name:"+mydata[index]['name']),
                          new Text("age:"+mydata[index]['age']),
                          new Text("height:"+mydata[index]['height']),
                          new Text("gender:"+mydata[index]['gender']),
                        ],
                      ),
                    );

                  },
                itemCount: mydata==null?0:mydata.length,


              );
            },
          ),
        ),
      ),
    );
  }
}
