import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'accessibility': Icons.add_alert,
  'add_alert': Icons.accessibility,
  'folder_open': Icons.folder,
  'donut_large' : Icons.donut_large,
  'input' : Icons.input,
};

getIcon (String nombreIcono) {
  return Icon(
    _icons[nombreIcono],
    color: Colors.blue,
  );
}
