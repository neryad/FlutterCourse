import 'package:flutter/material.dart';
import 'package:formvalidation/src/blocs/login_bloc.dart';
import 'package:formvalidation/src/blocs/producto_bloc.dart';
export 'package:formvalidation/src/blocs/producto_bloc.dart';
export 'package:formvalidation/src/blocs/login_bloc.dart';


class Provider extends InheritedWidget {
  final loginBloc = new LoginBloc();
  final _productosBloc = new  ProductoBloc();

  static Provider _instacia;

  factory Provider({ Key key, Widget child}) {

    if(_instacia == null ) {
      _instacia = new Provider._internal(key: key, child: child);
    }

    return _instacia;
  }

    Provider._internal({ Key key, Widget child})
          : super(key: key, child: child);



  // Provider({ Key key, Widget child})
  //         : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of ( BuildContext context ) {
   return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
   }

    static ProductoBloc productosBloc ( BuildContext context ) {
   return context.dependOnInheritedWidgetOfExactType<Provider>()._productosBloc;
   }
}