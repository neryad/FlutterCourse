import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  String _nombre = '';
  String _email = '';
  String _fecha = '';
  String _opcionSel = 'Volar';
  List<String> _poderes = ['Volar','Rayos X', 'Super Aliento', 'Super Fuerza'];
  TextEditingController _inputfiledDateController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
           Divider(),
          _crearDropdown(),
                    Divider(),
                    _crearPersona(),
                  ],
                ),
              );
            }
          
            _crearInput() {
              return TextField(
                //autofocus: true,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                    // counter: Text('Letras ${ _nombre.length }'),
                    hintText: 'Nombre de la persona',
                    labelText: 'Nombre',
                    helperText: 'Solo es el nombre',
                    suffixIcon: Icon(Icons.accessibility),
                    icon: Icon(Icons.account_circle)),
                onChanged: (valor) {
                  setState(() {
                    _nombre = valor;
                  });
                },
              );
            }
          
            Widget _crearPersona() {
              return ListTile(
                title: Text('Nombre es: $_nombre'),
                subtitle: Text('Email es: $_email'),
                trailing: Text(_opcionSel),
              );
            }
          
            Widget _crearEmail() {
              return TextField(
                  //autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border:
                          OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                      // counter: Text('Letras ${ _nombre.length }'),
                      hintText: 'Email',
                      labelText: 'Email',
                      suffixIcon: Icon(Icons.alternate_email),
                      icon: Icon(Icons.email)),
                  onChanged: (valor) => setState(() {
                        _email = valor;
                      }));
            }
          
            Widget _crearPassword() {
              return TextField(
                  //autofocus: true,
                  obscureText: true,
                  decoration: InputDecoration(
                      border:
                          OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                      // counter: Text('Letras ${ _nombre.length }'),
                      hintText: 'Password',
                      labelText: 'Password',
                      suffixIcon: Icon(Icons.lock_open),
                      icon: Icon(Icons.lock)),
                  onChanged: (valor) => setState(() {
                        _email = valor;
                      }));
            }
          
            Widget _crearFecha(BuildContext context) {
              return TextField(
                //autofocus: true,
                enableInteractiveSelection: false,
                controller: _inputfiledDateController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                    hintText: 'Fecha nacimiento',
                    labelText: 'Fecha nacimiento',
                    suffixIcon: Icon(Icons.perm_contact_calendar),
                    icon: Icon(Icons.calendar_today)),
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  _selectDate(context);
                },
              );
            }
          
            _selectDate(BuildContext context) async {
              DateTime picked = await showDatePicker(
                  context: context,
                  initialDate: new DateTime.now(),
                  firstDate: new DateTime(2018),
                  lastDate: new DateTime(2025),
                  locale: Locale('es', 'ES'));
          
              if (picked != null) {
                setState(() {
                  _fecha = picked.toString();
                  _inputfiledDateController.text = _fecha;
                });
              }
            }


          List<DropdownMenuItem<String>> getOpciones(){

            List<DropdownMenuItem<String>> lista = new List();

            _poderes.forEach((poder){

              lista.add(DropdownMenuItem(
                child: Text(poder),
                value: poder,
              ));

            });
           return lista;
          }


            Widget _crearDropdown() {

              return Row(
                children: <Widget>[
                  Icon(Icons.select_all),
                  SizedBox(width: 30.0),
               DropdownButton(
                 value: _opcionSel,
                items: getOpciones(),
                onChanged: (opt){
                  setState(() {
                   _opcionSel = opt; 
                  });
                },
              )
                ],
              );


            }
}
