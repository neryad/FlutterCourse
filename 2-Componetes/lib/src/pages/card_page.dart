import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[_cardTipo1(), SizedBox(height: 30.0), _cardTipo2()],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(children: <Widget>[
        ListTile(
          leading: Icon(Icons.photo_album, color: Colors.blue),
          title: Text('Soy el titulo'),
          subtitle: Text(
              'asdasdjkasdjklashdjkahsjkdhasjkdhjkashdjksahdjksahjkdfgsadjkghjksagfsdhhjsdgf'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(onPressed: () {}, child: Text('Cancelar')),
            FlatButton(onPressed: () {}, child: Text('Ok')),
          ],
        )
      ]),
    );
  }

 Widget _cardTipo2() {
   return Card(
     clipBehavior: Clip.antiAlias,
     child: 
     Column(
       children: <Widget>[
         FadeInImage(
           placeholder: AssetImage('assets/jar.gif'),
           fadeInDuration: Duration(milliseconds: 200),
           height: 300.0,
           fit: BoxFit.cover,
           image: NetworkImage('https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjExMDk0fQ&w=1000&q=80'),
           ),
      //  Image(
      //    image: NetworkImage('https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjExMDk0fQ&w=1000&q=80')
      // ),  
        Container(
          padding: EdgeInsets.all(10.0),
          child:Text('nose qu eponer'))
     ],
     ),
   );
 }
}
