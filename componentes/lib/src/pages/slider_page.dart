import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearChec = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearcheckBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen())
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigo,
      label: 'Tamaño de la imagen',
      // divisions: 20,
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (_bloquearChec)
          ? null
          : (valor) {
              setState(() {
                _valorSlider = valor;
              });
            },
    );
  }

  Widget _crearcheckBox() {
    // return Checkbox(
    //   value: _bloquearChec,
    //   onChanged: (valor){
    //     setState(() {
    //      _bloquearChec = valor;
    //     });
    //   },
    // );
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearChec,
      onChanged: (valor) {
        setState(() {
          _bloquearChec = valor;
        });
      },
    );
  }

  Widget _crearSwitch(){
     return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearChec,
      onChanged: (valor) {
        setState(() {
          _bloquearChec = valor;
        });
      },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'http://pluspng.com/img-png/spiderman-logo-png-image-spider-man-png-clipart-png-spider-man-wiki-900.png'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }
}
