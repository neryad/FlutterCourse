import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text('Avatar Page'),
       actions: <Widget>[
         Container(
           padding: EdgeInsets.all(5.0),
           child: CircleAvatar(
             backgroundImage: 
             NetworkImage('https://cdn2.iconfinder.com/data/icons/super-hero/154/spider-man-spiderman-comics-hero-avatar-512.png'),
             radius: 30.0,
           ),
         ),
         Container(
           margin: EdgeInsets.only(right:10.0),
           child: CircleAvatar(
             child: Text('SL'),
             backgroundColor: Colors.red
           ),
         )
       ],
     ),
     body: Center(child: FadeInImage(
       placeholder: AssetImage('assets/jar.gif'), 
       fadeInDuration: Duration(milliseconds:200),
       image:NetworkImage('https://res.cloudinary.com/lmn/image/upload/c_limit,h_360,w_640/e_sharpen:100/f_auto,fl_lossy,q_auto/v1/gameskinnyc/m/a/r/marvels-spider-man-screen-ps4-29mar18-a008a.jpg'),
       ),
       ),
    );
  }
}