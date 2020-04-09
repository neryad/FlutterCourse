import 'package:componetes/src/pages/alert_page.dart';
import 'package:componetes/src/pages/animated_container.dart';
import 'package:componetes/src/pages/avatar_page.dart';
import 'package:componetes/src/pages/card_page.dart';
import 'package:componetes/src/pages/home_page.dart';
import 'package:componetes/src/pages/input_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationsRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card' : (BuildContext context) => CardPage(),
    'animatedContainer' : (BuildContext context) => AnimatedContainerPage(),
     'inputs' : (BuildContext context) => InputPage(),
    
  };
}
