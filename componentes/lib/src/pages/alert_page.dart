import 'package:flutter/material.dart';



class AlertPAge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text('Alert Page'),
     ),
     body: Center(
       child: RaisedButton(
         child: Text('Mostrar Alerta'),
         color: Colors.blue,
         textColor: Colors.white,
         shape: StadiumBorder(),
         onPressed: ()=>_mostrarAlert(context),
       ),
     ),
     floatingActionButton: FloatingActionButton(
       child: Icon(Icons.ac_unit),
       onPressed: (){
         Navigator.pop(context);
       },
       ),
    );
  }

  void _mostrarAlert(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          title: Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Este es el contenido de la caja de dialogo'),
              FlutterLogo(size: 100.0)
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: ()=> Navigator.of(context).pop(),
            ),
             FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }
}