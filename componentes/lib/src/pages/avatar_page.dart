import 'package:flutter/material.dart';



class AvatarPAge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text('Avatar Page'),
       actions: <Widget>[
         Container(
           padding: EdgeInsets.all(2.0),
           child: CircleAvatar(
             backgroundImage: NetworkImage('https://dam.smashmexico.com.mx/wp-content/uploads/2018/09/26165403/spidermantop10_portada.jpg'),
             radius: 25.0,
           ),
         ),
         Container(
           margin: EdgeInsets.only(right: 10.0),
           child: CircleAvatar(
             child: Text('SL'),
             backgroundColor: Colors.redAccent,
             foregroundColor: Colors.white,
           ),
         )
       ],
     ),
     body: Center(
       child: FadeInImage(
         image: NetworkImage('https://img.game.co.uk/ml2/5/6/2/9/562944_scr9_a.png'),
         placeholder: AssetImage('assets/jar-loading.gif'),
         fadeInDuration: Duration( microseconds: 200),
         ),
     ),
    );
  }
}