import 'package:componentes/src/pages/InputsPage.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/animated_container.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:flutter/material.dart';


Map<String, WidgetBuilder> getAplicationsRoutes(){

return <String, WidgetBuilder>{
        '/' : (BuildContext context) => HomePAge(),
        'alert' : (BuildContext context) => AlertPAge(),
        'avatar' : (BuildContext context) => AvatarPAge(),
        'card' : (BuildContext context) => CardPage(),
        'animatedContainer' : (BuildContext context) => AnimatedContainerPage(),
        'inputs' : (BuildContext context) => InputsPage(),
      };
}

