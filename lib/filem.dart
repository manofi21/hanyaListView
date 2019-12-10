import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class UserWidget extends StatelessWidget {
  final String title,desscription;
  const UserWidget(
  {Key key,
    this.title,
    this.desscription
  });

  @override
  Widget build(BuildContext context) {

    return new Container(
      padding: new EdgeInsets.only(top: 10, right: 5, left: 5),
      margin: new EdgeInsets.symmetric(vertical: 1),
      child: ListTile(
        title: 
        subSubtitle(EdgeInsets.only(left: 10), this.title.toUpperCase(), 17,Colors.blue),
        subtitle: 
        dreat(<Widget>[
               subSubtitle(EdgeInsets.only(top: 10),this.title,18,Colors.black),
               subSubtitle(EdgeInsets.only(top: 5),this.desscription,16,Colors.black),
        ]),
        onTap:() {},
      ),
    );
  }
}

Widget subSubtitle(EdgeInsets del ,String tex,double font,Color due){
  return Container(
    padding: del,
    //del,
    child: Text(tex,
    style: TextStyle(color: due, fontSize: font)),
  );
}

Container dreat(List<Widget> chidren){
  return Container(
    margin: EdgeInsets.only(left: 10),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: chidren,
    )
  );
}